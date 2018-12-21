$(document).ready(function (){
	//随机生成验证码
		function change() {
			//获取包裹验证码的div元素
			var verCode = document.getElementById('verCode');
			//框定验证码的取值范围
			var strRange = '0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
			//定义一个值为空的变量yzm，用来保存随后生成的验证码
			var result = '';
			//随机生成4位验证码
			for (var i = 0; i < 4 ; i++) {
				var ran = Math.round(Math.random()* 61);
				var char = strRange[ran];
				//避免生成相同的字符
				if(result.toLowerCase().indexOf(char.toLowerCase()) > -1){
					i--;
					continue;
				}
				result += char;
			}
			//将生成的验证码插入div中
			verCode.innerHTML = result;
		}
		change();
		verCode.onclick = change;


	//表单验证
	var name_psw =  new RegExp(/^[A-Z0-9a-z]{6,12}$/);

    $('input[name="adminName"]').blur(function() {
        var $name = $('input[name="adminName"]');
        var name_val = $.trim($name.val());
        var name_error = $('#name_error');
         //验证用户名
         if(name_val == ""){
            name_error.text('*用户名不能为空');
            $name.focus();
            return;
        }else if(name_psw.test(name_val)){
            name_error.text('');
        }else{
            name_error.text('*用户名必须为6-12位数字或字母');
            $name.focus();
            return;
        };
    });
    $('input[name="password"]').blur(function() {
        var $psw = $('input[name="password"]');     
        var psw_val = $.trim($psw.val());
        var psw_error = $('#psw_error');
        //验证密码；
        if(psw_val == ""){
            psw_error.text('*密码不能为空');
            $psw.focus();
            return;
        }else if(name_psw.test(psw_val)){
            psw_error.text('');
        }else{
            psw_error.text('*密码必须为6-12位数字或字母');
            $psw.focus();
            return;
        };
    });
	$('input[name="verify"]').blur(function() {
		var verCode = $('#verCode').text();
		var $verify = $('input[name="verify"]');
		var verify_txt = $.trim($verify.val());
		var verify_error = $('#verify_error');
		if(verify_txt == ""){
            verify_error.text('*验证码不能为空');
            $verify.focus();
            return;
        }else if(verify_txt.toLowerCase() === verCode.toLowerCase()){
            verify_error.text('');
        }else{
            verify_error.text('*验证码错误');
			$verify.focus();
            return;
        };
	})
	//login背景图获取页面高度
	function getHeight() {
		var bgHeight = document.getElementById('adminLogin');
		var body_height = document.documentElement.clientHeight;
		bgHeight.style.height = body_height + 'px';
	}
	getHeight();
})