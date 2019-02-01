<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>趣学网后台管理系统首页</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/admin/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/lib/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/common/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/enter.css">
	<!-- 引入字体图标 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/iconmoon/adminVerify/style.css">
</head>

<body>
	<!-- 顶部导航栏 -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<!-- logo -->
				<div class="navbar-brand cf">
					<img src="${pageContext.request.contextPath}/admin/images/logo/logo_light.png" class="logo-img lf">
					<h4 class="lf">后台管理系统</h4>
					<a href="javascript:;" class="hide_menu lf"><i class="glyphicon glyphicon-th-list"></i></a>
				</div>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">课程管理</a></li>
					<li><a href="#">用户管理</a></li>
					<li><a href="#">管理员管理</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<!-- 不带下拉框的消息通知 -->
					<!-- <li>
						<a href="#"><i class="glyphicon glyphicon-bell"></i><span class="badge">42</span></a>
					</li> -->
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							<i class="glyphicon glyphicon-bell"></i><span class="badge">42</span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#">消息内容1会不会换行呢？最大宽度为多少呢?再长点</a></li>
							<li><a href="#">消息内容2</a></li>
							<li><a href="#">消息内容3</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">全部标为已读</a></li>
						</ul>
					</li>
					<li class="adminName">
						
						<!-- 管理员名 -->
						<p class="navbar-text">${ADMIN_IN_SESSION.adminName}</p>
					</li>
					<li>
						<c:choose>
							<c:when test="${ADMIN_IN_SESSION != null}">
								<a href="${pageContext.request.contextPath}/adminController/loginOut" class="navbar-link">退出</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/adminController/adminLogin" class="navbar-link">请登录</a>
							</c:otherwise>
						</c:choose>
						
					</li>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>
	<!-- /顶部导航栏 -->

	<div class="wrapper">
		<!-- 左侧边栏 -->
		<aside class="left_menu">
			<!-- 课程管理 -->
			<ul class="sidebar-menu tree">
				<li class="tree-item active">
					<a href="javascript:;" target="menulink">
						<i class="icon-courselist"></i>
						<span>课程列表</span>
						<span class="arrow rt">
							<i class="glyphicon glyphicon-chevron-up"></i>
						</span>
					</a>
					<ul class="treeitem-menu">
						<li>
							<a href="${pageContext.request.contextPath}/adminController/publishCourse?type=2" target="menulink">已发布课程</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/adminController/verifyCourse?type=0" target="menulink">待审核课程</a>
						</li>
					</ul>
				</li>
			</ul>
			<!-- /课程管理 -->

			<!-- 用户管理 -->
			<ul class="sidebar-menu tree" style="display:none">
				<li class="tree-item active">
					<a href="javascript:;" target="menulink">
						<i class="icon-userlist"></i>
						<span>用户列表</span>
						<span class="arrow rt">
							<i class="glyphicon glyphicon-chevron-up"></i>
						</span>
					</a>
					<ul class="treeitem-menu">
						<li>
							<a href="${pageContext.request.contextPath}/adminController/userlist" target="menulink">用户列表</a>
						</li>
					</ul>
				</li>
				<li class="tree-item">
					<a href="javascript:;" target="menulink">
						<i class="icon-user-verify"></i>
						<span>用户审核</span>
						<span class="arrow rt">
							<i class="glyphicon glyphicon-chevron-down"></i>
						</span>
					</a>
					<ul class="treeitem-menu" style="display:none">
						<li>
							<a href="${pageContext.request.contextPath}/adminController/realname" target="menulink">实名认证</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/adminController/certification" target="menulink">学籍认证</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/adminController/leaderApply" target="menulink">领学者申请</a>
						</li>
					</ul>
				</li>
			</ul>
			<!-- /用户管理 -->

			<!-- 管理员管理 -->
			<ul class="sidebar-menu tree" style="display:none">
				<li class="tree-item active">
					<a href="javascript:;" target="menulink">
						<i class="icon-log"></i>
						<span>管理员管理</span>
						<span class="arrow rt">
							<i class="glyphicon glyphicon-chevron-up"></i>
						</span>
					</a>
					<ul class="treeitem-menu">
						<li>
							<a href="${pageContext.request.contextPath}/adminController/adminerLogs" target="menulink">操作日志</a>
						</li>
					</ul>
				</li>
			</ul>
			<!-- /管理员管理 -->
		</aside>
		<!-- /左侧边栏 -->

		<!-- 右侧内容 -->
		<div class="content-wrap">
			<section class="content">
				<iframe src="${pageContext.request.contextPath}/adminController/mainAdminPage" frameborder="0" name="menulink" scrolling="yes" width="100%" height="100%" style="min-height: 600px;"></iframe>
			</section>
		</div>
		<!-- /右侧内容 -->
	</div>

	<script src="${pageContext.request.contextPath}/admin/lib/jquery/jquery-3.3.1.min.js"></script>

	<script>
		$(function () {
			// 点击顶部导航，给a标签切换样式；同时显示对应的左侧边栏
			$('.navbar-nav:first-child li').click(function () {
				$(this).addClass('active').siblings().removeClass('active');
				var link_num = $(this).index();
				// alert(link_num);
				$('.left_menu .tree').eq(link_num).css('display', 'block').siblings().css('display', 'none');
			})

			// 左侧菜单子菜单点击添加active
			$('.treeitem-menu li').click(function () {
				$(this).addClass('active').siblings().removeClass('active');
			})


			// 左侧菜单栏样式及收缩展开效果
			$('.sidebar-menu .tree-item a:first-child').click(function () {
				$(this).next(".treeitem-menu").slideToggle(); //实现二级菜单的展开收缩功能
				$(this).parents().siblings().find('a:first-child').next('.treeitem-menu').hide(); //其他同类一级标题收缩
				$(this).parent().addClass('active').siblings().removeClass('active');
				$(this).find('.arrow').children().toggleClass('glyphicon-chevron-down');
				$(this).find('.arrow').children().toggleClass('glyphicon-chevron-up');
				$(this).parents().siblings().find('.arrow').children().toggleClass('glyphicon-chevron-down');
				$(this).parents().siblings().find('.arrow').children().toggleClass('glyphicon-chevron-up');
			})

			// 点击使左侧导航隐藏或显示
			$('.hide_menu i').click(function () {
				if ($('.left_menu').is(":visible") == true) {
					$('.left_menu').hide();
					$('.content-wrap').css('marginLeft', '0');
				} else {
					$('.left_menu').show();
					$('.content-wrap').css('marginLeft', '230px');
				}
			})

		})
	</script>
</body>

</html>