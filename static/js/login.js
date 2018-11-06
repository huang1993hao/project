$(function(){			
	//判断是否存在该用户(匹配用户名和密码是否都一致)
	$("#submitId").click(function(){
		// console.log('hao')
		temp1 = checkingAccount()
		temp2 = checkingPassword()
		if(temp1 && temp2){
			$('form').submit()
		}
		function checkingAccount(){
			var reg = /^(13|15|18)\d{9}$/
			var accountInput = $('#haccount input')
			if (reg.test(accountInput.val())){
				$('#haccount i').html('')
				return true
			} else{
				// console.log('hao')
				$('#haccount i').html('号码格式错误,请输入11位数手机号码')
				return false
			}
		}
		function checkingPassword(){
			var reg = /^\w{6,16}$/
			var passwordInput = $('#hpassword input')
			if(reg.test(passwordInput.val())){
				$('hpassword i').html('')
				return true
			}else{
				$('#hpassword i').html('密码在6-16个字符内')
			}
		}
	})
	
})