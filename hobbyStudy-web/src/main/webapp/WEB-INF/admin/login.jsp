<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>趣学后台管理系统登录</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/common/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/bootstrap/css/bootstrap.min.css">
	<!-- 验证码插件 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/verify/css/verify.css">
	<style>
		#adminLogin .loginCenter {
			width: 480px;
			margin: 70px auto;
		}

		#adminLogin .loginCenter .logo img {
			width: 230px;
		}
		#adminLogin .loginCenter .logo small{
			font-size: 32px;
		}
		#loginBtn{
			width: 100%;
		}
		.error{
			color: #e5224c;
		}
	</style>
</head>
<body>
	<div class="container">
		<form action="" id="adminLogin" class="form-horizontal" method="post">
			<div class="loginCenter">
				<div class="logo">
					<div class="page-header">
						<a href="#">
							<img src="${pageContext.request.contextPath}/admin/images/logo/black_logo_light.png">
						</a>
						<small>后台管理系统</small>
					</div>
				</div>
				<div class="form-group">
					<label for="adminUser" class="col-sm-2 control-label">登录名</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="adminUser">
						<!-- 存放错误信息的提示框,如果后台分开验证密码和登录名则将下面这个注释取消 -->
						<!-- <div class="error"></div> -->
					</div>
				</div>
				<div class="form-group">
					<label for="adminPsw" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" id="adminPsw">
						<!-- 存放错误信息的提示框,如果后台分开验证密码和登录名则将下面这个注释取消 -->
						<!-- <div class="error"></div> -->
					</div>
				</div>
				<div class="form-group">
					<label for="verifyCode" class="col-sm-2 control-label">验证码</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="verifyCode">
						<!-- 存放错误信息的提示框 -->
						<div class="error"></div>
					</div>
					<div class="col-sm-4" id="verifyBox">
						<div id="mpanel2"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<button type="button" class="btn btn-primary" id="loginBtn">登录</button>
						<!-- 存放错误信息的提示框,如果后台一起验证密码和登录名则将下面这个注释取消 -->
						<!-- <div class="error"></div> -->
					</div>
				</div>
			</div>
		</form>
	</div>


	<script src="${pageContext.request.contextPath}/admin/lib/jquery/jquery-3.3.1.min.js"></script>
	<!-- 引入验证码 -->
	<script src="${pageContext.request.contextPath}/admin/lib/verify/js/verify.js"></script>
	<script>
		$(function () {
			// 初始化验证码
			$('#mpanel2').codeVerify({
				type: 1,
				width: '80px',
				height: '34px',
				fontSize: '18px',
				codeLength: 4
			});

			// 判断验证码
			$('#verifyCode').blur(function () {
				// 获取验证码的内容
				var code = $('.verify-code').text().toLowerCase();
				// 获取用户输入的验证码
				var input_code = $(this).val();
				if (input_code == '') {
					$(this).siblings('.error').text('请输入验证码');
				} else if (input_code.toLowerCase() != code) {
					$(this).siblings('.error').text('验证码错误');
					// $(this).val('');
				} else {
					$(this).siblings('.error').text('验证码正确');
				}
			})
			/*如果后台判断后需要给前台传递信息，
			则将上面的.error注释取消，
			然后通过js给对应的信息添加text('错误信息')*/
		})
		$(function(){
			$('#loginBtn').click(function(){
				var adminUser = $('#adminUser').val();
				var adminPsw = $('#adminPsw').val();
				/* alert("账户：" + adminUser + "  adminPsw: "  + adminPsw); */
				$.ajax({
					url:'${pageContext.request.contextPath}/adminController/adminLoginImpl',
				    type:'POST',
				    dataType:'json',
				    data:{
				    	'adminName':adminUser,
				    	'password':adminPsw
				    	},
				    'success':function(data){
				    	if (data.loginResult == "loginSuccess"){
					    	$(window).attr("location","${pageContext.request.contextPath}/adminController/enterAdminPage");
						}else if(data.loginResult =="fail"){
							alert(data.loginResult);
							$(window).attr("location","${pageContext.request.contextPath}/adminController/adminLogin");
						}
				    },
				    'error': function (data) {         
	                    alert("Error") ;
	                } 
				})
			})
		})
	</script>
</body>
</html>