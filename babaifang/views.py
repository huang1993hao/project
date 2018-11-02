import hashlib
import os
import uuid

from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from Django01 import settings
from babaifang.models import User, Baner, Mrb, Drb


def index(request):
    baners = Baner.objects.all()
    mrbs = Mrb.objects.all()
    drbs = Drb.objects.all()
    token = request.COOKIES.get('token')
    users = User.objects.filter(token=token)
    if users.exists():
        user = users.first()
        return render(request,'index.html',context={'tel':user.tel,'headimg':user.headimg,'baners':baners,'mrbs':mrbs,'drbs':drbs})
    else:
        return render(request,'index.html',context={'baners':baners,'mrbs':mrbs,'drbs':drbs})


def cart(request):
    token = request.COOKIES.get('token')
    users = User.objects.filter(token=token)
    if users.exists():
        user = users.first()
        tel = user.tel
        return render(request,'cart.html',context={'tel':user.tel})
    else:
        return render(request,'cart.html')


def login(request):
    if request.method == 'GET':
        return render(request,'login.html')
    elif request.method == 'POST':
        tel = request.POST.get('tel')
        password = generate_password(request.POST.get('password'))
        users = User.objects.filter(tel=tel,password=password)
        if users.exists():
            user = users.first()
            user.token = uuid.uuid5(uuid.uuid4(),'login')
            user.save()
            response = redirect('babaifang:index')
            response.set_cookie('token',user.token)
            return response
        else:
            return HttpResponse('用户名或密码错误')
def product_details(request):
    return render(request,'product_details.html')

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