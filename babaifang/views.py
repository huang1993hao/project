import hashlib
import os
import random
import time
import uuid

from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from Django01 import settings
from babaifang.alipay import alipay_axf
from babaifang.models import User, Baner, Mrb, Drb, Goods, Cart, Order, OrderGoods


def index(request):
    baners = Baner.objects.all()
    mrbs = Mrb.objects.all()
    drbs = Drb.objects.all()
    goods = Goods.objects.all()
    token = request.COOKIES.get('token')
    users = User.objects.filter(token=token)
    if users.exists():
        user = users.first()
        carts = Cart.objects.filter(user=user)
        num = 0
        for cart in carts:
            num+=cart.number
        return render(request,'index.html',context={'tel':user.tel,'headimg':user.headimg,'baners':baners,'mrbs':mrbs,'drbs':drbs,'goods':goods,'num':num})
    else:
        return render(request,'index.html',context={'baners':baners,'mrbs':mrbs,'drbs':drbs,'goods':goods})


def cart(request):
    token = request.COOKIES.get('token')
    users = User.objects.filter(token=token)
    if users.exists():
        user = users.first()
        tel = user.tel
        carts = Cart.objects.filter(user=user).exclude(number=0)

        return render(request,'cart.html',context={'tel':user.tel,'carts':carts})
    else:
        return redirect('babaifang:login')


def login(request):
    if request.method == 'GET':
        return render(request,'login.html')
    elif request.method == 'POST':
        tel = request.POST.get('tel')
        password = request.POST.get('password')
        try:
            user = User.objects.get(tel=tel)
            if user.password == generate_password(password):
                user.token = uuid.uuid5(uuid.uuid4(),'login')
                user.save()
                response = redirect('babaifang:index')
                response.set_cookie('token', user.token)
                return response
            else:
                return render(request,'login.html',context={'passwdErr': '密码错误!'})
        except:
            return render(request,'login.html',context={'accountErr':'账号不存在!'})
        # users = User.objects.filter(tel=tel,password=password)
        # if users.exists():
        #     user = users.first()
        #     user.token = uuid.uuid5(uuid.uuid4(),'login')
        #     user.save()
        #     response = redirect('babaifang:index')
        #     response.set_cookie('token',user.token)
        #     return response
        # else:
        #     return HttpResponse('用户名或密码错误')
def product_details(request,trackid):

    good = Goods.objects.get(trackid=trackid)
    token = request.COOKIES.get('token')
    users = User.objects.filter(token=token)
    if users.exists():
        user = users.first()
        carts = Cart.objects.filter(user=user)
        num = 0
        for cart in carts:
            num += cart.number
        return render(request, 'product_details.html', context={'good': good,'tel':user.tel,'num':num})
    else:
        return render(request,'product_details.html',context={'good':good})

# 加密
def generate_password(password):
    sha = hashlib.sha512()
    sha.update(password.encode('utf-8'))
    return sha.hexdigest()
def register(request):
    if request.method == 'GET':
        return render(request,'register.html')
    elif request.method == 'POST':
        tel = request.POST.get('tel')
        password = request.POST.get('password')
        # print(tel,password)
        try:
            user = User()
            user.tel = tel
            user.password = generate_password(password)
            user.token = uuid.uuid5(uuid.uuid4(),'register')
            user.save()
            response = redirect('babaifang:index')
            response.set_cookie('token',user.token)
            return response
        except Exception as e:
            return HttpResponse('注册失败' + e)


def logout(request):
    response = redirect('babaifang:index')
    response.delete_cookie('token')
    return response


def uploadhead(request):
    if request.method == 'GET':
        return render(request,'uploadhead.html')
    elif request.method == 'POST':
        file = request.FILES.get('headimg')
        token = request.COOKIES.get('token')
        users = User.objects.filter(token=token)
        user = users.first()
        filename = str(user.id) + file.name
        filepath = os.path.join(settings.MEDIA_ROOT,filename)
        with open(filepath,'wb') as fp:
            for item in file.chunks():
                fp.write(item)
        user.headimg = 'upload/' + filename
        user.save()
        response = redirect('babaifang:index')
        return response


def checkmobile(request):
    mobile = request.GET.get('mobile')
    responseData = {
        'msg': '账号可用',
        'status': 1,
    }
    # print(mobile)
    try:
        user = User.objects.get(tel=mobile)
        responseData['msg'] = '账号不可用'
        responseData['status'] = -1
        return JsonResponse(responseData)
    except:
        return JsonResponse(responseData)


def addcart(request):
    goodsid = request.GET.get('goodsid')
    number = request.GET.get('number')
    token = request.COOKIES.get('token')
    # print(goodsid,number)
    responseData = {
        'msg':'加入成功',
        'status':1,
    }
    if token:
        user = User.objects.get(token=token)
        goods = Goods.objects.get(pk=goodsid)
        carts = Cart.objects.filter(user=user).filter(goods=goods)
        if carts.exists():
            cart = carts.first()
            cart.number = cart.number + int(number)
            cart.save()
        else:
            cart = Cart()
            cart.user = user
            cart.goods = goods
            cart.number = number
            cart.save()
        return JsonResponse(responseData)
    else:
        responseData['msg'] = '未登录，请登录后操作'
        responseData['status'] = -1
        return JsonResponse(responseData)


def addcount(request):
    goodsid = request.GET.get('goodsid')
    # print(goodsid)
    token = request.COOKIES.get('token')
    user = User.objects.get(token=token)
    goods = Goods.objects.get(pk=goodsid)
    cart = Cart.objects.filter(user=user).filter(goods=goods).first()
    cart.number = cart.number + 1
    cart.save()
    return JsonResponse({'msg':'jiacheng','status':1})


def subcount(request):
    goodsid = request.GET.get('goodsid')
    # print(goodsid)
    token = request.COOKIES.get('token')
    user = User.objects.get(token=token)
    goods = Goods.objects.get(pk=goodsid)
    cart = Cart.objects.filter(user=user).filter(goods=goods).first()
    if cart.number > 1:
        cart.number = cart.number - 1
        cart.save()
    return JsonResponse({'msg':'jianle','status':1,'number':cart.number})


def changecheck(request):
    cartid = request.GET.get('cartid')
    # print(cartid)
    cart = Cart.objects.get(pk=cartid)
    cart.isselect = not cart.isselect
    cart.save()
    return JsonResponse({'msg':'chenggong','status':1,'isselect':cart.isselect})


def changeallcheck(request):
    # hao = request.GET.get('hao')
    # print(hao)
    isselect = request.GET.get('isselect')
    if isselect == 'true':
        isselect = True
    else:
        isselect = False
    token = request.COOKIES.get('token')
    user = User.objects.get(token=token)
    carts = Cart.objects.filter(user=user)
    for cart in carts:
        cart.isselect = isselect
        cart.save()
    return JsonResponse({'msg':'gaile',"status":1,'isselect':isselect})


def clearCart1(request):
    cartid = request.GET.get('cartid')
    # print(cartid)
    # token = request.COOKIES.get('token')
    # user = User.objects.get(token=token)
    responseData = {
        'msg':'shanchu',
        'status':1
    }
    try:
        cart = Cart.objects.get(pk=cartid)
        cart.delete()
        return JsonResponse(responseData)
    except:
        responseData['msg']='shibai'
        responseData['status']=-1
        return JsonResponse(responseData)


def clearCarts(request):
    # msg=request.GET.get('msg')
    # print(msg)
    token = request.COOKIES.get('token')
    user = User.objects.get(token=token)
    carts = Cart.objects.filter(user=user)
    for cart in carts:
        cart.delete()
    return JsonResponse({'msg':'quanshan','status':1})


def generateorder(request):
    token = request.COOKIES.get('token')
    user = User.objects.get(token=token)
    order = Order()
    order.user = user
    order.identifier = str(int(time.time()))+str(random.randrange(10000,100000))
    order.save()
    carts = Cart.objects.filter(user=user).filter(isselect=True)
    # print(carts)
    for cart in carts:
        ordergoods = OrderGoods()
        ordergoods.goods = cart.goods
        ordergoods.order = order
        ordergoods.number = cart.number
        ordergoods.save()
        cart.delete()
        # print(1111)
    responseData = {
        'msg':'生成订单成功',
        'status':1,
        'identifier':order.identifier
    }
    return JsonResponse(responseData)


def orderinfo(request,identifier):
    token = request.COOKIES.get('token')
    user = User.objects.get(token=token)
    tel = user.tel
    order = Order.objects.get(identifier=identifier)
    return render(request,'orderinfo.html',context={'order':order,'tel':tel})
def notifyurl(request):
    print('xxx 订单支付成功，请发货')
    identifier = request.POST.get('out_trade_no')
    order = Order.objects.get(identifier=identifier)
    order.status = 2
    order.save()
    return JsonResponse({'msg':'success'})


def returnurl(request):
    # print('xxx dingdanzhifuchenggong,jinxingyemiantiaozhuan')

    return render(request,'cart.html')


def pay(request):
    identifier = request.GET.get('identifier')
    # print(identifier)
    order = Order.objects.get(identifier=identifier)
    total = 0
    for ordergoods in order.ordergoods_set.all():
        number = ordergoods.number
        price = ordergoods.goods.bprice
        doloar = int(number) * int(price)
        total += doloar
    url = alipay_axf.direct_pay(
        subject='测试订单 --- iphone X',  # 订单名称
        out_trade_no=identifier,  # 订单号
        total_amount=total,  # 付款金额
        return_url='http://39.105.177.201/returnurl/'
    )
    alipay_url = 'https://openapi.alipaydev.com/gateway.do?{data}'.format(data=url)
    return JsonResponse({'alipay_url':alipay_url})