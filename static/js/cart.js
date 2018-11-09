
$(function(){	
	// var goodsList = $.cookie("cart");
/*如果购物车为空 显示空购物车  否则显示购物商品框*/
	// if( goodsList == undefined ){
	// 	$('#shop_cart').hide();
	// 	$('.no_shp').show();
	// }
	$('#shop_cart').show();
	$('.shopper_main ').each(function(){
		var number = $(this).find('.num').attr('value')
		var price = $(this).find('.price').html()
		$(this).find('.st').html((price*number).toFixed(2))
	})
	// $('.no_shp').hide();
/*如果不为空  执行下面*/
	// if (goodsList) {
	// 	// goodsList = JSON.parse(goodsList);
	// 	for (var i=0; i<goodsList.length; i++) {
	// 		var goods = goodsList[i]; //每个商品
	// 		//创建节点
	//
	// 		var div0 = $("<div class='shopper_main'></div>")
	// 		div0.appendTo('.shop_content')
	//
	//
	// 		var div1 = $("<div class='shopper_n'></div>")
	// 		div1.appendTo(div0)
	//
	// 		var div = $('<div class="shopChoose">药店：<a href="" target="_blank">香港草姬</a></div>')
	// 		div.appendTo(div1)
	//
	// 		var table = $('<table width="1188" class="cart_list" ></table>')
	// 		table.appendTo(div0)
	//
	// 		var tr = $('<tr></tr>')
	// 		tr.appendTo(table)
	//
	// 		var td = $('<td style="text-align:left; padding-left:10px;"  width="20" valign="top"><input type="checkbox" checked name="checkbox"  /></td>')
	// 		td.appendTo(tr)
	//
	// 		var td = $('<td width="375"><div class="b_pord"><p class="pic"><a href=""><img id="goodImg" src="'+goods.img+'" style="width: 58px; height: 58px;"/></a></p><p class="pord_n"><a href="" title="" target="_blank">'+goods.name+'</a></p></div></td>')
	// 		td.appendTo(tr)
	//
	// 		var td = $('<td width="180"><div class="b_price"><p class="m_price">市场价：<del>'+goods.price1+'</del></p><p class="s_price">会员价：<span class="price">'+goods.price2+'</span></p></div></td>')
	// 		td.appendTo(tr)
	//
	// 		var td = $('<td width="163"><p class="pref">全场满减</p></td>')
	// 		td.appendTo(tr)
	//
	// 		var td = $('<td width="88"><div class="mo_num"><span class="rec"></span><input type="text" class="num"  value=" '+goods.num+' "maxlength="9" /><span class="add"></span></div><span id="testKucun" class="cart_storage_tips">库存'+goods.stocks+'件</span></td>')
	// 		td.appendTo(tr)
	//
	// 		var td = $('<td width="88"><p class="s_total">￥<span class="st">'+(goods.num*goods.price2).toFixed(2)+'</span></p></td>')
	// 		td.appendTo(tr)
	//
	// 		var td = $('<td width="110"><span class="opt"><a class="clearCart1" href="#" >删除</a></span></td>')
	// 		td.appendTo(tr)
	// 	}
	// }
	

	
/*商品总价*/
	function Amount(){
		// var x=[];
		var amount = 0
		$(".shopper_main").each(function(){
			// console.log(111)
			if($(this).find('.check').prop('checked')==true){
				// console.log(222)
				var single = $(this).find('.st').html()
				// console.log(single)
				amount+=parseInt(single)
			}
		})
		// for ( var i = 0; i < x.length; i++) {
		// 	amount += parseInt(x[i])
		// }
		$('.amount').html(amount.toFixed(2))
	}
/*购物车购物总件数*/
	function SpoNum(){
		var x=[];
		var amount = 0
		$(".num").each(function(){
			// console.log(i);
			x.push($(this).val());	
			// console.log($(this).val());
		})
		for ( var i = 0; i < x.length; i++) {		
			amount += parseInt(x[i])
		}
		return $('#spoNum').html(amount)	
	}



/*刚进购物车加载当前页面  	得到商品小计合计*/
	Amount();		
	
	SpoNum();	



//改 cook 数据
//	CookNum();
//
//function CookNum(){ 
//	var lis=JSON.parse($.cookie("cart"));
//	console.log(lis[0].num);
//	$.cookie("cart",lis)
//	var num = 'num';
//	console.log($.cookie(num))
//	if($.cookie(num)){
//		$('.num').val($.cookie(num))
//	}
	
	
//	console.log("----"+goodsList[].num);
	//先判断购物车中是否存在我即将要添加的商
//	for (var i=0; i<goods.length; i++) {
//		//如果存在相同的商品, 则把数量++, 不需要重新添加新的商品
//		if ($('#goodImg').html() == goods[i].img) {
//			goods[i].num += parseInt($('.num').val());
//			var num = goodsList[i].num
//		}
//	}		
//}



/*点击“+” 添加 购物件数*/
	$('.add').on('click',function(){
		var numx = $(this).parent().find('input');
		var st = $(this).parent().parent().siblings().find('.st');
		var num = numx.attr('value');
		var price = $(this).parent().parent().siblings().find('.price');
		var goodsid = $(this).attr('goodsid')
		// num++;
		// numx.attr('value',num);
		/*根据购物件数  计算所需价格*/
		// var pics = ( parseFloat( $('.price').html() ) * ( parseFloat(numx.attr('value') ) ) ).toFixed(2) ;
		// st.html(pics);
		$.get('/addcount/',{'goodsid':goodsid},function(response){
			console.log(response)
			if(response.status == 1){
				num++;
				numx.attr('value',num);
				// console.log(num)
				// console.log(price.html())
				var pics = ( parseFloat( price.html() ) * ( parseFloat(numx.attr('value') ) ) ).toFixed(2) ;
				st.html(pics);
			}
			Amount()
		})
		/*合计*/
		// Amount()
		
		/*当前添加的件数添加到头部购物车*/
		// SpoNum();
		// CookNum();
		
		
		
		// console.log($.cookie("cart"))
		// console.log(goods.num)
	})
/*点击“-” 减少 购物件数*/	
	$('.rec').on('click',function(){
		var numx = $(this).parent().find('input');
		var st = $(this).parent().parent().siblings().find('.st');
		// var num = numx.attr('value');
		var price = $(this).parent().parent().siblings().find('.price');
		var goodsid = $(this).attr('goodsid')
		// num--;
		// numx.attr('value',num);
		/*判断购物件数   不能小于1*/
		// if(numx.attr('value') <= 1 ){
		// 	numx.attr('value',1);
		// }
		/*根据购物件数  计算所需价格*/
		$.get('/subcount/',{'goodsid':goodsid},function(response){
			console.log(response)
			if(response.status == 1){
				numx.attr('value',response.number);
				var recpics = (response.number * parseFloat( price.html())).toFixed(2);
				st.html(recpics)
			}
			Amount()
		})
		// var recPics =parseFloat( st.html() ) - parseFloat( price.html());
		// st.html(recPics);
		/*判断购物件数   价格不能小于商品的单位价格*/
		// if(numx.attr('value') <= 1 ){
		// 	st.html(parseFloat( price.html()));
		// }
		/*合计*/
		// Amount()
		// CookNum();
	})
	$('.check').click(function(){
		var cartid = $(this).attr('cartid')
		var $that = $(this)
		$.get('/changecheck/',{'cartid':cartid},function (response) {
			console.log(response)
			if(response.isselect==true){
				$that.prop('checked',true)
			}else{
				$that.prop('checked',false)
			}
			Amount()
        })
	})
	$('#checkall').click(function(){
		var isselect = $(this).attr('isselect')
		// console.log(1+isselect)
		isselect = (isselect == 'false')
		$(this).attr('isselect',isselect)
		// console.log(isselect)
		// if(isselect){
		// 	$('.check').each(function () {
		// 		$(this).prop('checked',true)
        //     })
		// }else{
		// 	$('.check').each(function(){
		// 		$(this).prop('checked',false)
		// 	})
		// }
		$.get('/changeallcheck/',{'isselect':isselect},function (response) {
			console.log(response)
			if(response.isselect==true){
				$('.check').each(function () {
				$(this).prop('checked',true)
            })
			}else{
				$('.check').each(function(){
				$(this).prop('checked',false)
			})
			}
			Amount()
        })
	})
	
/*点击购物商品中的删除按钮*/
	$(".clearCart1").click(function(){ 		
		var length = parseInt( $(".clearCart1").length) - 1;
		if(length == 0){
			/*显示空购物车  隐藏购物商品框*/
			$('#shop_cart').hide();
			$('.no_shp').show();
			$.cookie("cart", "", {expires:0, path:"/"});
		}
		$(this).closest(".shopper_main").remove();		
		/*合计*/
		Amount()
	})

/*点击全选旁的 删除按钮	*/
	$("#clearCarts").click(function(){
		/*显示空购物车  隐藏购物商品框*/
		$('#shop_cart').hide();
		$('.no_shp').show();
		//删除cookie
		// $.cookie("cart", "", {expires:0, path:"/"});
	})
		
	
})