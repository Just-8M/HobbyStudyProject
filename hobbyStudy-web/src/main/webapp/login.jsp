<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>欢迎加入趣学网，快来寻找你的领学者</title>
    <link rel="shortcut icon" href="light_favicon@32.ico">
    <link rel="stylesheet" type="text/css" href="common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.min.css">    
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="content">
        <div class="loginBox">
            <a href="index.html">
            <div class="login_logo">
                <img src="images/logo/black_logo_light.png" class="logoImg">
            </div>
            </a>
            <div class="loginWay">
                <div class="userLogin" id="userLogin" style="color:#FFC125">用户名密码登录</div>
                <div class="emailLogin" id="emailLogin">邮箱验证码登录</div>
                <div class="underline" id="underline"></div>
            </div>
           <form method="post" class="loginForm" id="loginForm">
                <ul>
                    <div id="user_way">
                        <li>
                            <i class="userIcon"></i>
                            <input type="text" name="username" placeholder="账户名" class="inputBox"  id='username' autofocus>
                            <span id="name_error" class="input-error"></span>
                        </li>
                        <li>
                            <i class="pswIcon"></i>
                            <input type="password" name="password" placeholder="密码"  id="password" class="inputBox">
                            <span id="psw_error"  class="input-error"></span>
                        </li>
                    </div>
                    <!--邮箱登录，默认隐藏-->
                    <div id="email_way"  style="display: none">
                        <li>
                            <i class="glyphicon glyphicon-envelope EmailIcon"></i>
                            <input type="email" name="Email" placeholder="邮箱号" class="inputBox" id="phoneNumber" autofocus>
                            <input type="button" class="getCode" value="获取验证码"  id="btn">
                            <span id="email_error"  class="input-error"></span>
                        </li>
                        <li>
                            <i class="verifyIcon"></i>
                            <input type="text" name="EmailCode" id="EmailCode" placeholder="动态验证码" class="inputBox" maxlength="6"> 
                            <span id="verify_error"  class="input-error"></span>
                        </li>
                    </div>
                    <li class="commitcode_new">
                        <a href="forgetPassword.jsp" class="forgotPsw" id="forgotTxt">忘记密码？</a>
                        <input type="checkbox" id="rememberPsw">
                        <span>下次自动登录</span>
                    </li>
                    <li class="loginBtn">
                        <input type="button" value="登录" class="loginText" id="loginButton" name="btnSubmit">
                    </li>
                    <li class="agree_document">
                        <span>登录即同意<a href="javascript:;">《趣学网使用协议》</a>和<a href="javascript:;">《隐私权条款》</a></span>
                    </li>
                    <li class="otherWay">
                        <span>——————使用其他方式进行登录——————</span><br>
                        <img src="images/login/wechat.png" class="wechat">
                        <img src="images/login/qq.png" class="qq">
                    </li>
                    <li class="back"><a href="register.jsp" class="register">没有账号，去注册</a><a href="${pageContext.request.contextPath}/getIndexPage">返回首页<i class="fa fa-chevron-circle-right"></i></a></li>
                </ul>
            </form>         
        </div>
    </div>
    <script src="lib/jquery/jquery-3.3.1.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
    <script type="text/javascript">
    /* 获取邮箱验证码 */
    $(function(){
    	$("#btn").click(function(){
    	    alert("email1:" + $("#phoneNumber").val());
			$.ajax({
				type:"POST",
				url :"${pageContext.request.contextPath}/register2?random"+Math.random(),
				  dataType: 'json',
				data:{
					'email':$("#phoneNumber").val(),
				},
				'success':function(data){
					alert(data.code_result);
				},
				'fail':function(data){
					alert("错误 ")
				}
			})
    	});
    })
    /* 登录 */
     $(function(){
    	$("#loginButton").click(function(){
    		username =  $("#username").val();    //  用户名
    		password =  $("#password").val();    //  密码
    		phoneNumber =  $("#phoneNumber").val();    //  邮箱号
    		EmailCode =  $("#EmailCode").val();    //  邮箱验证码
    	    alert("username:" + username + "password:" + password + "   邮箱号："+phoneNumber + "   验证码： " + EmailCode);
			$.ajax({
				type:"POST",
				url :"${pageContext.request.contextPath}/login",
				  dataType: 'json',
				data:{
					'username':username,
					'password':password,
					'Email':phoneNumber,
					'EmailCode':EmailCode,
				},
				'success':function(data){
					if (data.loginResult == "登录成功"  || data.loginResult =="退出成功") {
					$(window).attr("location","${pageContext.request.contextPath}/getIndexPage");
					}else if(data.loginResult =="登录失败"){
						alert(data.loginResult);
						$(window).attr("location","login.jsp");
					}
				},
				'fail':function(data){
					alert("错误 ")
				}
			})
    	});
    })
    </script>
</body>
</html>