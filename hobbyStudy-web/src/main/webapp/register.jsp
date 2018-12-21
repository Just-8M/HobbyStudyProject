<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>趣学网注册,快来加入我们吧！</title>
    <link rel="shortcut icon" href="light_favicon@32.ico">
    <link rel="stylesheet" href="styles/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="styles/bootstrap/font-awesome.min.css">
    <link rel="stylesheet" href="styles/css/reset.css">
    <link rel="stylesheet" href="styles/css/register.css">
</head>
<body>
    <div class="register_wrap">
        <h1><img src="images/logo/black_logo_light.png"></h1>    
        <form action=" " method="post">
            <div>
				<label for="username">用户名<span class="input_error"
					id="name_error"></span></label> <input type="text" name="username"
					id="username"   onblur="check()" placeholder="请输入用户名（6-12位字母和数字组合）" />
			</div>
			<!-- 接受回调信息 -->
			<div id="result"  style="color: red" ></div>
            <div> 
                <label for="usermail">密码<span class="input_error" id="psw_error"></span></label> 
                <input type="password" name="userpassword" id="password" placeholder="请输入密码（6-12位字母和数字组合）"/> 
            </div>
            <div> 
                <label for="username">确认密码<span class="input_error" id="unlike_error"></span></label> 
                <input type="password" name="confirmpassword" id="confirmpassword" placeholder="请再次输入确认密码"/> 
            </div>
    
            <!-- <div> 
                <label for="username">手机号<span class="input_error" id="phone_error"></span></label> 
                <input type="text" name="userphone" id="userphone" placeholder="请输入手机号"/> 
            </div>
            <div class="clearfix"> 
                <label for="username">验证码<span class="input_error" id="verify_error"></span></label> 
                <input type="text" name="verifycode" id="verifycode"  placeholder="请输入验证码"/> 
                <div class="verify" id="verCode"></div>
            </div> -->
           
            <input type="button" value="注册" id="submit_btn"/>	
        </form>		
    </div> 

    <script src="script/bootstrap/jquery-3.2.1.min.js"></script>
    <script>
    <!--Ajax查询用户名-->
    $(function () {
	      $('#username').on('blur',function() {
	            $.ajax({
	            	url:"${pageContext.request.contextPath}/AjaxRegister",
	                data: {                          //数据
	                	username:$("input[name='username']").val(),
	                },
	                type: "POST",                   //类型，POST或者GET
	                dataType: 'json',              //数据返回类型，可以是xml、json等
	                success: function (data) {  //成功，回调函数
	                	 /* alert(data.result) */
	                	 $("#result").html(data.result);
	                },
	                error: function (er) {          //失败，回调函数
	                    alert(er) ;
	                }
	            });
	        })
	    });
    <!--Ajax注册-->
	    $(function () {
	        $("#submit_btn").click(function () {
	        	if ( $("#password").val() == $("#confirmpassword").val()) {
	        		 $.ajax({
	 	                url: "${pageContext.request.contextPath}/Register",        //后台url
	 	                data: {                          //数据
	 	                	username : $("#username").val(),
	 	                	password : $("#confirmpassword").val(),
	 	                },
	 	                type: "POST",                   //类型，POST或者GET
	 	                dataType: 'json',              //数据返回类型，可以是xml、json等
	 	                success: function (data) {      //成功，回调函数
	 	                    alert(data.RegisterResult);
	 	                },
	 	                error: function (er) {          //失败，回调函数
	 	                    alert(er);
	 	                }
	 	            });
				 } else {
					alert("你好，两个密码不一致，请重新输入");
				} 
	           
	        })
	    });
    $(function(){
          //随机生成验证码
		/*function change() {
			//获取包裹验证码的div元素
			var verCode = $('#verCode');
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
			verCode.text(result);
		}
		change();
        verCode.onclick = change;*/
        
        //表单验证用户名提示信息
        $('#submit_btn').click(function() {
            //获取对象
            var $name= $('#username');
            var $psw = $("#password");
            var $confirmpassword = $("#confirmpassword");
            // var $userphone = $("#userphone");
            // var $verifycode= $("#verifycode"); 
            // var $verCode = $("#verCode");
           
            //获取对象的值
            var name_val= $.trim($name.val()); 
            var psw_val = $.trim($psw.val());
            var same_psw = $.trim($confirmpassword.val());
            // var phone_val =  $.trim($userphone.val());
            // var verify_val = $.trim($verifycode.val());
            // var verCode_val = $.trim($verCode.text());
            
            //错误信息
            var name_error = $('#name_error');
            var psw_error = $('#psw_error');
            var unlike_error = $('#unlike_error');
            // var phone_error = $('#phone_error');
            // var verify_error = $('#verify_error');
            // 验证手机
            // var phone_isvalid =  new RegExp(/^(13[0-9]|15[012356789]|18[0-9]|17[678]|14[57])[0-9]{8}$/);
            
            //验证用户名密码格式及长度
            var name_psw =  new RegExp(/^[A-Z0-9a-z]{6,12}$/);
            
            //验证用户名
            if(name_val == ""){
                name_error.text('用户名不能为空');
                $name.focus();
                return;
            }else if(name_psw.test(name_val)){
                name_error.text('');
            }else{
                name_error.text('用户名必须为6-12位数字或字母');
                $name.focus();
                return;
            };
            //验证密码；
            if(psw_val == ""){
                psw_error.text('密码不能为空');
                $psw.focus();
                return;
            }else if(name_psw.test(psw_val)){
                psw_error.text('');
            }else{
                psw_error.text('密码必须为6-12位数字或字母');
                $psw.focus();
                return;
            };
            
            //确认密码
            if(same_psw == "" || !(name_psw.test(same_psw))){
                unlike_error.text('密码必须为6-12位数字或字母');
                $confirmpassword.focus();
                return;
            }else if(psw_val === same_psw){
                unlike_error.text('');
            }else{
                unlike_error.text('两次输入密码不一致');
                $confirmpassword.focus();
                return;
            }
            //手机
            // if(phone_val == ""){
            //     phone_error.text('手机号不能为空');
            //     $userphone.focus();
            //     return;
            // }else if(phone_isvalid.test(phone_val)){
            //     phone_error.text('');
            // }else{
            //     phone_error.text('手机号格式不正确');
            //     $userphone.focus();
            //     return;
            // }

            //验证码
            // if(verify_val == ""){
            //     verify_error.text('验证码不能为空');
            //     $verifycode.focus();
            //     return;
            // }else if(verify_val.toLowerCase() === verCode_val.toLowerCase()){
            //     verify_error.text('');
            // }else{
            //     verify_error.text('验证码错误');
            //     $verifycode.focus();
            //     return;
            // }

        })
      
    })
    </script>
</body>
</html>