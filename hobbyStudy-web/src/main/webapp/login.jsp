<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>欢迎加入趣学网，快来寻找你的领学者</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="styles/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="styles/bootstrap/font-awesome.min.css">
    <link rel="stylesheet" href="styles/css/login.css">
</head>
<body>
    <div class="content">
        <div class="loginBox">
            <div class="login_logo">
                <img src="images/logo/green-logo.png" class="logoImg">
            </div>
            <div class="loginWay">
                <div class="userLogin" id="userLogin" style="color:#35AE35">用户名密码登录</div>
                <div class="phoneLogin" id="phoneLogin">手机动态码登录</div>
                <div class="underline" id="underline"></div>
            </div>
            <form action="${pageContext.request.contextPath}/login" method="post" class="loginForm" id="loginForm">
                <ul>
                    <div id="user_way">
                        <li>
                            <i class="userIcon"></i>
                            <input type="text" name="username" placeholder="账户名" class="inputBox">
                            <span id="name_error" class="input-error"></span>
                        </li>
                        <li>
                            <i class="pswIcon"></i>
                            <input type="password" name="password" placeholder="密码" class="inputBox">
                            <span id="psw_error"  class="input-error"></span>
                        </li>
                    </div>
                    <!--手机登录，默认隐藏-->
                    <div id="phone_way"  style="display: none">
                        <li>
                            <i class="phoneIcon"></i>
                            <input type="text" name="phoneNumber" placeholder="手机号" class="inputBox">
                            <input type="button" class="getCode" value="获取验证码"  id="btn">
                            <span id="phone_error"  class="input-error"></span>
                        </li>
                        <li>
                            <i class="verifyIcon"></i>
                            <input type="text" name="phoneCode" placeholder="动态验证码" class="inputBox">
                            <span id="verify_error"  class="input-error"></span>
                        </li>
                    </div>
                    <li class="commitcode_new">
                        <a href="javascript:;" class="forgotPsw" id="forgotTxt">忘记密码？</a>
                        <input type="checkbox" id="rememberPsw">
                        <span>下次自动登录</span>
                    </li>
                    <li class="loginBtn">
                        <input type="submit" value="登录" class="loginText" name="btnSubmit">
                    </li>
                    <li class="agree_document">
                        <span>登录即同意<a href="javascript:;">《趣学网使用协议》</a>和<a href="javascript:;">《隐私权条款》</a></span>
                    </li>
                    <li class="otherWay">
                        <span>——————使用其他方式进行登录——————</span><br>
                        <img src="images/login/wechat.png" class="wechat">
                        <img src="images/login/qq.png" class="qq">
                    </li>
                    <li class="backIndex"><a href="index.jsp">返回首页<i class="fa fa-chevron-circle-right"></i></li>
                </ul>
            </form>         
        </div>
    </div>

    <script src="script/bootstrap/jquery-3.2.1.min.js"></script>
    <script src="script/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="script/login.js"></script>
</body>
</html>