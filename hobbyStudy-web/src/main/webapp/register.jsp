<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>注册-趣学网</title>
    <link rel="shortcut icon" href="light_favicon@32.ico">
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="common/css/reset.css">
    <link rel="stylesheet" href="css/register.css">
    <!-- 引入iconmoon图标 -->
    <link rel="stylesheet" href="lib/iconmoon/tipIco/style.css">
</head>

<body>
    <div class="register">
        <div class="header_wrapper">
            <div class="header cf">
                <div class="logo lf">
                    <a href="index.html"><img src="${pageContext.request.contextPath}/images/logo/black_logo_light.png" class="logoIco"></a>
                </div>
                <div class="register_title lf">
                    账号注册
                </div>
                <div class="login_link rt">
                    <p>已有账号，去<a href="login.jsp">登录</a></p>
                </div>
            </div>
        </div>
        <div class="main">
            <div class="content">
                <div class="content-from">

                    <div class="content-head">
                        <div class="col-sm-offset-3 col-sm-9 register_way cf">
                            <div class="way_item  active  lf" id="user_btn">
                                		用户名注册
                            </div>
                            <div class="way_item lf" id="email_btn">邮箱注册</div>
                        </div>
                    </div>

                    <div class="content-body">
                        <!-- 用户注册 -->
                        <form class="form-horizontal" id="user_way">
                            <div class="form-group">
                                <label for="username" class="col-sm-3 control-label">用户名</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="username"  name="username"  placeholder="用户名为2-20位字母,数字或下划线"
                                        required minlength="2" maxlength="20" autofocus>
                                    <div class="error" id="userAjaxRegister"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="psw" class="col-sm-3 control-label">密码</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="psw" name="password" placeholder="密码为6-20位字母,数字或下划线"
                                        required minlength="6" maxlength="20">
                                    <i class="glyphicon glyphicon-eye-open eye"></i>
                                    <div class="error"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirm_psw" class="col-sm-3 control-label">确认密码</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="confirm_psw" placeholder="再次输入密码"
                                        required maxlength="20">
                                    <i class="glyphicon glyphicon-eye-open eye"></i>
                                    <div class="error"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" class="term term1">同意并遵守<a href="javascript:;" class="service_term">《服务条款》</a>
                                            <div class="error"></div>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <button type="button" class="form-control register_btn" id="next_bindEmail">下一步</button>
                                </div>
                            </div>
                        </form>
                        <!-- 用户注册/ -->

                        <!-- 绑定邮箱 -->
                        <form class="form-horizontal" id="bind_email">
                            <div class="form-group">
                                <label for="bind_email_num" class="col-sm-3 control-label">邮箱号</label>
                                <div class="col-sm-9">
                                    <input type="email" class="form-control" name="eamil" id="bind_email_num" placeholder="请输入您的邮箱号码"
                                        required>
                                    <div class="error"  id="BindEmail"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email-code" class="col-sm-3 control-label">验证码</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" name="code"  id="email-code" placeholder="请输入6位验证码"
                                        maxlength="6" required>
                                    <div class="error"></div>
                                </div>
                                <div class="col-sm-3">
                                    <button class="btn send-code" id="send-code-bilndEmail">发送验证码</button>
                                    <div class="error"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <button type="submit" class="form-control register_btn" id="user_submit">注册</button>
                                </div>
                            </div>
                        </form>
                        <!-- 绑定邮箱/ -->

                        <!-- 邮箱注册 -->
                        <form class="form-horizontal" id="email_way">
                            <div class="form-group">
                                <label for="email_number" class="col-sm-3 control-label">邮箱号</label>
                                <div class="col-sm-9">
                                    <input type="email" class="form-control" id="email_number" placeholder="请输入您的邮箱号码"
                                        required>
                                    <div class="error" id="email_number_error"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email_psw" class="col-sm-3 control-label">登录密码</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="email_psw" placeholder="密码为6-20位字母和数字"
                                        required maxlength="20">
                                    <i class="glyphicon glyphicon-eye-open eye"></i>
                                    <div class="error"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="emailCode" class="col-sm-3 control-label">验证码</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="emailCode" placeholder="请输入6位验证码"
                                        maxlength="6" required>
                                    <div class="error"></div>
                                </div>
                                <div class="col-sm-3">
                                    <button class="btn send-code" id="bind_email_sendCode">发送验证码</button>
                                    <div class="error"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" class="term trem2" checked>同意并遵守<a href="javascript:;"
                                                class="service_term">《服务条款》</a>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <button type="submit" class="form-control register_btn" id="email_register">注册</button>
                                </div>
                            </div>
                        </form>
                        <!-- 邮箱注册/ -->
                    </div>
                </div>

            </div>
            <div class="copy-right">
                <p>趣学网版权所有 © 2018-2019 · 陕ICP备2015号-1</p>
            </div>
        </div>
    </div>

    <script src="lib/jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
    
        $(function () {
            // 点击切换注册方式的样式，为其添加active
            $('.way_item').click(function () {
                $(this).addClass('active').siblings().removeClass('active');
            });

            // 点击切换form表单
            $('#user_btn').click(function () {
                $('#bind_email').css('display', 'none');
                $('#email_way').css('display', 'none');
                $('#user_way').css('display', 'block');
            });
            $('#email_btn').click(function () {
                $('#bind_email').css('display', 'none');
                $('#user_way').css('display', 'none');
                $('#email_way').css('display', 'block');
            });

            // 查看密码
            $('.eye').click(function () {
                if ($(this).hasClass('glyphicon-eye-open')) {
                    $(this).removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close');
                    $(this).siblings('input').attr('type', 'text');
                } else {
                    $(this).removeClass('glyphicon-eye-close').addClass('glyphicon-eye-open');
                    $(this).siblings('input').attr('type', 'password');
                }
            })


            // 验证用户名表单
            var ck_username = /^[A-Za-z0-9_]{6,20}$/;
            var ck_password = /^[A-Za-z0-9_]{6,20}$/;
            var ck_email = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,5}$/;
            $('#username').blur(function () {
                //获取用户名
                var username = $("#username").val();
                if (username == '') {
                    $(this).siblings('.error').show().html("<i class='icon-error'></i>用户名不能为空");
                } else if (!ck_username.test(username)) {
                    $(this).siblings('.error').show().html(
                        "<i class='icon-error'></i>用户名不符合要求，请输入6-20位字母，数字或者下划线");
                }else if(username != ''){
          	            $.ajax({
          	            	url:"${pageContext.request.contextPath}/AjaxRegister",
          	                data: {                          //数据
          	                	'username':$('#username').val(),
          	                },
          	                type: "POST",                   //类型，POST或者GET
          	                dataType: 'json',              //数据返回类型，可以是xml、json等
          	                success: function (data) {     //成功，回调函数
          	                	 $("#userAjaxRegister").html(data.result);
          	                },
          	                error: function (er) {          //失败，回调函数
          	                    alert("fail") ;
          	                }
          	            });
                } 
                else {
                    $(this).siblings('.error').hide();
                }
            })

            $('#psw').blur(function () {
                var psw_val = $("#psw").val(); //获取密码
                if (psw_val == '') {
                    $(this).siblings('.error').show().html("<i class='icon-error'></i>密码不能为空");
                } else if (!ck_password.test(psw_val)) {
                    $(this).siblings('.error').show().html(
                        "<i class='icon-error'></i>密码不符合要求，请输入6-20位字母，数字或者下划线");
                } else {
                    $(this).siblings('.error').hide();
                }
            })

            $('#confirm_psw').blur(function () {
                var psw_val = $("#psw").val(); //获取密码
                var confirm_val = $('#confirm_psw').val(); //确认密码
                if (confirm_val == '') {
                    $(this).siblings('.error').show().html("<i class='icon-error'></i>请再次输入密码");
                } else if (!(psw_val === confirm_val)) {
                    $(this).siblings('.error').show().html("<i class='icon-error'></i>两次输入的密码不一致");
                } else {
                    $(this).siblings('.error').hide();
                }
            })

            $('#bind_email_num').blur(function () {
                var email = $(this).val();
                if (email == '') {
                    $(this).siblings('.error').show().html("<i class='icon-error'></i>请输入邮箱号");
                } else if (!ck_email.test(email)) {
                    $(this).siblings('.error').show().html(
                        "<i class='icon-error'></i>邮箱格式不正确");
                }else if(email!=''){
                	$.ajax({
      	            	url:"${pageContext.request.contextPath}/BindEmail",
      	                data: {                          //数据
      	                	'email':email,
      	                },
      	                type: "POST",                   //类型，POST或者GET
      	                dataType: 'json',              //数据返回类型，可以是xml、json等
      	                success: function (data) {     //成功，回调函数
      	                	 $("#BindEmail").html(data.BindEmailResult);
      	                },
      	                error: function (er) {          //失败，回调函数
      	                    alert("fail") ;
      	                }
      	            });
                }else {
                    $(this).siblings('.error').hide();
                }
            })

            // $('.send-code').click(function () {
            //     var email_val = $('#bind_email_num').val();
            //     if (email_val == '') {
            //         $('#bind_email_num').siblings('.error').show().html(
            //             "<i class='icon-error'></i>请输入邮箱号");
            //     }
            // })


            // 验证码
            $('#email-code').blur(function () {
                var email_code = $(this).val();
                if (email_code == '') {
                    $(this).siblings('.error').show().html("<i class='icon-error'></i>请输入验证码");
                } else if (email_code.length < 6) {
                    $(this).siblings('.error').show().html(
                        "<i class='icon-error'></i>验证码错误");
                } else {
                    $(this).siblings('.error').hide();
                }
            })

            // 点击用户名注册的下一步绑定邮箱
            $('#next_bindEmail').click(function () {
                // 判断用户是否勾选服务协议
                if ($(".term1").is(':checked') == false) {
                    $('.term1').siblings('.error').show().html("<i class='icon-error'></i>请您阅读后勾选该项");
                } else {
                    $('.term1').siblings('.error').hide();
                }
                var username = $("#username").val();
                var password = $("#psw").val();
                var confirm_val = $('#confirm_psw').val();
                if (confirm_val === password && ck_username.test(username) && ck_password.test(password) &&
                    $(".term1").is(':checked')) {
                    $('#user_way').css('display', 'none');
                    $('#bind_email').css('display', 'block')
                }

            });

            // Ajax验证邮箱
            $('#email_number').blur(function () {
                var email = $(this).val();
                if (email == '') {
                    $(this).siblings('.error').show().html("<i class='icon-error'></i>请输入邮箱号");
                } else if (!ck_email.test(email)) {
                    $(this).siblings('.error').show().html(
                        "<i class='icon-error'></i>邮箱格式不正确");
                } else if(email != '' || email !=null){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/BindEmail",
                        data: {
                            'email':email,
                        },
                        type: "POST",
                        dataType: 'json',
                        success: function (data) {
                            $("#email_number_error").html(data.BindEmailResult);
                        },
                        error: function (er) {
                            alert("fail") ;
                        }
                    });
                }else {
                    $(this).siblings('.error').hide();
                }
            })

            $('#email_psw').blur(function () {
                var psw_val = $(this).val(); //获取密码
                if (psw_val == '') {
                    $(this).siblings('.error').show().html("<i class='icon-error'></i>密码不能为空");
                } else if (!ck_password.test(psw_val)) {
                    $(this).siblings('.error').show().html(
                        "<i class='icon-error'></i>密码不符合要求，请输入6-20位字母，数字或者下划线");
                } else {
                    $(this).siblings('.error').hide();
                }
            })

            $('#emailCode').blur(function () {
                var email_code = $(this).val();
                if (email_code == '') {
                    $(this).siblings('.error').show().html("<i class='icon-error'></i>请输入验证码");
                } else if (email_code.length < 6) {
                    $(this).siblings('.error').show().html(
                        "<i class='icon-error'></i>验证码错误");
                } else {
                    $(this).siblings('.error').hide();
                }
            });

            // 点击发送验证码倒计时；
            /*$('.send-code').click(function(){
                var obj = $(this);
                var email = $('#email_number').val();
                var psw_val = $('#email_psw').val(); //获取密码
                var bind_email = $('#bind_email_num').val();
                if((email != '' && psw_val != '' && ck_email.test(email) && ck_password.test(psw_val))
                 || (bind_email != '' && ck_email.test(bind_email))){
                    settime(obj);
                }
               
            })*/
           /* var countdown=60;
            function settime(obj) { //发送验证码倒计时
                if (countdown == 0) {
                    obj.attr('disabled', false);
                    //obj.removeattr("disabled"); 
                    obj.text("获取验证码");
                    countdown = 60;
                    return;
                } else {
                    obj.attr('disabled', true);
                    obj.text("重新发送(" + countdown + ")");
                    countdown--;
                }
                setTimeout(function () {
                    settime(obj)
                }, 1000)
            }*/
        })
    </script>
    <script type="text/javascript">
	    /* 自定义获取邮箱 */
	    $(function(){
	    	$("#send-code-bilndEmail").click(function(){
	    	    alert("email1:" + $("#bind_email_num").val());
				$.ajax({
					type:"POST",
					url :"${pageContext.request.contextPath}/register2?random"+Math.random(),
					data:{
						'email':$("#bind_email_num").val(),
					},
					'success':function(data){
						alert("验证码发送成功");
					},
					'fail':function(data){
						alert("验证码发送失败 ")
					}
				})
	    	});
	    })
    /* 邮箱注册发送验证码 */
  $(function(){
        $("#bind_email_sendCode").click(function(){
            alert("email2:" + $("#email_number").val());
            $.ajax({
                type:"POST",
                url :"${pageContext.request.contextPath}/register2?random"+Math.random(),
                data:{
                    'email':$("#email_number").val(),
                },
                'success':function(data){
                    alert("验证码发送成功");
                },
                'fail':function(data){
                    alert("验证码发送失败 ")
                }
            })
        });
    })
	    //  自定义用户名注册
	 $("#user_submit").click(function(){
		 var email = $('#email_number').val();
		 var username = $("#username").val();
		 var psw = $("#psw").val();
		 var emailCode = $("#email-code").val();
		 alert(email+"==" + username + "==" + psw +"===" +emailCode);
		 $.ajax({
             'url': "${pageContext.request.contextPath}/MailVerify",
             type: "POST",                   //类型，POST或者GET
             dataType: 'json',               //数据返回类型，可以是xml、json等
             data: {                          //数据
              	'username' : username,
              	'password' : psw,
              	'email':email,
              	'emailCode':emailCode
              },
              'success':function (data) {      //成功，回调函数
                  alert("注册成功");
                  alert(data.RegisterResult+"点击确认跳转登录界面");
                  $(window).attr("location","login.jsp");
              },
              'error':function (data){          //失败，回调函数
                  alert("注册失败");
              }
          });
	});
        //  邮箱注册
        $("#email_register").click(function(){
            var email = $('#email_number').val();
            var email_psw = $("#email_psw").val();
            var emailCode = $("#emailCode").val();
            alert(email+"==" + email_psw + "===" +emailCode);
            $.ajax({
                'url': "${pageContext.request.contextPath}/MailVerify",
                data: {                          //数据
                    'email':email,
                    'password' : email_psw,
                    'emailCode':emailCode
                },
                type: "POST",                   //类型，POST或者GET
                dataType: 'text/json',               //数据返回类型，可以是xml、json等
                'success':function (data) {      //成功，回调函数
                    alert("success")
                    alert(data.RegisterResult+"点击确认跳转登录界面");
                    $(window).attr("location","login.jsp");
                },
                'error':function (data) {          //失败，回调函数
                    alert("注册失败");
                }
            });
        });
    </script>
</body>
</html>