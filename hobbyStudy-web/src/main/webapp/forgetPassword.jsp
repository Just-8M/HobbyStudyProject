<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>找回密码-趣学网</title>
    <link rel="shortcut icon" href="light_favicon@32.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forgotPassword.css">
    <!-- 引入iconmoon 用于显示错误提示信息的图标-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/iconmoon/tipIco/style.css">
    <!-- 引入验证 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/verify/css/verify.css">
</head>

<body>
    <div class="forgotPsw">
        <div class="forgotPsw_header">
            <div class="header_content cf">
                <div class="header_left">
                    <div class="logo_wrap lf">
                        <a href="index.html">
                            <img src="${pageContext.request.contextPath}/images/logo/black_logo_light.png" class="logo_pic">
                        </a>
                    </div>
                    <div class="header_title lf">
                        <h3>找回密码</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="forgotPsw_body">
            <div class="content_wrap">
                <div class="content">
                    <!-- 输入绑定的邮箱 -->
                    <div class="check_email">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="set_psw_email" class="col-sm-3 control-label">邮箱号</label>
                                <div class="col-sm-9">
                                    <input type="email" class="form-control" id="set_psw_email" placeholder="请输入绑定的邮箱号"
                                        autofocus>
                                    <div class="error"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <!-- 滑块验证 -->
                                    <div id="mpanel4"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="emailCode" class="col-sm-3 control-label">验证码</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="emailCode" placeholder="请输入6位验证码"
                                        maxlength="6">
                                    <div class="error"></div>
                                </div>
                                <div class="col-sm-3">
                                    <button type="button" class="btn send-code">发送验证码</button>
                                    <div class="error"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <button type="button" class="form-control confirm_btn" id="next_reset">下一步</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- 重置密码 -->
                    <div class="reset_psw">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="psw" class="col-sm-3 control-label">重置密码</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="psw" placeholder="密码为6-20位字母,数字或下划线"
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
                                    <button type="button" class="form-control confirm_btn" id="confirm">确认修改</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
            <div class="copy_right">
                <p>趣学网版权所有 © 2018-2019 · 陕ICP备2015号-1</p>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.min.js"></script>
    <!-- 引入验证 -->
    <script src="${pageContext.request.contextPath}/lib/verify/js/verify.js"></script>
    <script>
        $(function () {
            var ck_email = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,5}$/;

            // 验证邮箱
            $('#set_psw_email').blur(function () {
                var email_num = $(this).val();
                if (email_num == '') {
                    $(this).siblings('.error').show().html("<i class='icon-error'></i>请输入邮箱号");
                } else if (!ck_email.test(email_num)) {
                    $(this).siblings('.error').show().html("<i class='icon-error'></i>邮箱号格式不正确");
                } else if (email_num === "123456@qq.com") {
                    // 后台需要在这里判断是否存在该用户
                    $(this).siblings('.error').show().html("<i class='icon-error'></i>邮箱不存在");
                } else {
                    $(this).siblings('.error').hide();
                }
            })

            // 验证码提示信息
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

            // 当邮箱号发送变化时刷新验证
            $('#set_psw_email').change(function () {

            })

            // 滑块验证
            $('#mpanel4').slideVerify({
                type: 2, //类型
                vOffset: 5, //误差量，根据需求自行调整
                vSpace: 5, //间隔
                imgName: ['1.jpg', '2.jpg', '3.jpeg'],
                imgSize: {
                    width: '350px',
                    height: '180px',
                },
                blockSize: {
                    width: '40px',
                    height: '40px',
                },
                barSize: {
                    width: '350px',
                    height: '40px',
                },
                ready: function () {},
                success: function () {
                    // 验证成功后发送验证码
                    $('.send-code').click(function () {
                        var obj = $(this);
                        var email = $('#set_psw_email').val();
                        if (email != '' && ck_email.test(email)) {
                            settime(obj);
                        }
                    })
                    // 点击下一步重置密码;
                    $('#next_reset').click(function () {
                        var email_code = $('#emailCode').val(); //验证码
                        var email_num = $('#set_psw_email').val(); //邮箱
                        // 这里还差一步判断验证码是否正确；
                        if (email_code != '' && email_num != '' && ck_email.test(email_num)) {
                            $('.check_email').css('display', 'none');
                            $('.reset_psw').css('display', 'block');
                        }
                    });
                },
                error: function () {}
            });

            // 点击发送验证码倒计时；

            var countdown = 60;

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
            };

            // 查看密码
            $('.eye').click(function () {
                if ($(this).hasClass('glyphicon-eye-open')) {
                    $(this).removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close');
                    $(this).siblings('input').attr('type', 'text');
                } else {
                    $(this).removeClass('glyphicon-eye-close').addClass('glyphicon-eye-open');
                    $(this).siblings('input').attr('type', 'password');
                }
            });

            var ck_password = /^[A-Za-z0-9_]{6,20}$/;
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

        })
    </script>
</body>
</html>