 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>趣学网-陪你寻找兴趣伙伴</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo/light_favicon@32.ico">
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/iconmoon/tipIco/style.css">
</head>
<body>
	<!--兴趣选择弹框-->
	<div class="choose">
		<div class="modal-header">
			<button type="button" class="close">
				<span aria-hidden="true">&times;</span>
			</button>
			<span class="modal-title" id="myModalLabel">选择你感兴趣的方向</span> <span
				class="choose_tip">至少选择1个，可随时调整</span>
		</div>
		<div class="choose_content"></div>
		<div class="choose_ok">
			<button type="button" class="btn btn-default skip"
				data-dismiss="modal">跳过</button>
			<button type="button" class="btn btn-primary">已选好</button>
			<a href="login.html">已选过，直接登录账号</a>
		</div>
	</div>
	<!--头部开始-->
	<header>
		<div class="w">
			<div class="location ">
				<div class="current_city" id="current_city">
					<i class="location_icon"></i> 当前城市：<span class="city_name"
						id="cityName">北京市</span>
					<div class="change_city_btn right" id="city_btn">[切换城市]</div>
				</div>
				<div data-toggle="distpicker" class="choose_city" id="distpicker">
					<select id="eprovinceName" data-province="-- 选择省 --"
						name="provinceName"></select> <select id="ecityName"
						data-city="-- 选择市 --" name="cityName"></select> <input
						type="button" value="确认" id="submit_city"> <input
						type="button" value="取消" id="cancel_city">
				</div>
			</div>
			<ul class="header_nav">
				<li><a href="#"><i class="fa fa-bell-o"></i>消息通知</a></li>
				<li><a href="#"><i class="fa fa-leanpub"></i>我的学习</a></li>
				<li><a href="#"><i class="fa fa-shopping-cart"></i>购物车<span
						class="num">10</span></a></li>
				<li><a href="#"><i class="fa fa-user-plus"></i>申请成为领学者</a></li>
				<li class="login_link">
						   <!-- 判断用户是否登录 -->
	                        <c:choose>
	                            <c:when test="${USER_IN_SESSION==null}">
									<a href="login.jsp">登录</a>/<a href="register.jsp">注册</a>
	                            </c:when>
	                            <c:otherwise>
	                                <span><a href="${pageContext.request.contextPath}/personCenter?id=${USER_IN_SESSION.id}"  style="color:#ff4e00;">${USER_IN_SESSION.userid}</a></span>
									<span><a href="${pageContext.request.contextPath}/loginOut" >退出</a></span>
	                            </c:otherwise>
	                        </c:choose>
				</li>
				<li class="avatar"><a href="javascript:;">username <img
						src="images/logo/logo_light.png"></a></li>
			</ul>
			<div class="shopcart">
				<div class="mycart">
					<span class="headline">我的购物车</span> <span class="cartnum">已加入<i
						class="total">0</i>门课程
					</span>
				</div>
				<div class="nocontent">
					<p>购物车空空如也</p>
					<p>快去这里找到你中意的课程吧</p>
					<a href="hobby.html">全部课程</a>
				</div>
				<div class="cartlist">
					<ul>
						<li><img src="images/logo/black_logo_light.png">
							<div class="courseinfo">
								<a href="course.html"></a>
								<p class="coursename">课程名</p>
								</a> <span class='price'>￥ 29.9</span> <span class="delete">删除</span>
							</div></li>
						<li><img src="images/logo/black_logo_light.png">
							<div class="courseinfo">
								<a href="course.html"></a>
								<p class="coursename">课程名</p>
								</a> <span class='price'>￥ 29.9</span> <span class="delete">删除</span>
							</div></li>
						<li><img src="images/logo/black_logo_light.png">
							<div class="courseinfo">
								<a href="course.html"></a>
								<p class="coursename">课程名</p>
								</a> <span class='price'>￥ 29.9</span> <span class="delete">删除</span>
							</div></li>
						<li><img src="images/logo/black_logo_light.png">
							<div class="courseinfo">
								<a href="course.html"></a>
								<p class="coursename">课程名</p>
								</a> <span class='price'>￥ 29.9</span> <span class="delete">删除</span>
							</div></li>
						<li><img src="images/logo/black_logo_light.png">
							<div class="courseinfo">
								<a href="course.html"></a>
								<p class="coursename">课程名</p>
								</a> <span class='price'>￥ 29.9</span> <span class="delete">删除</span>
							</div></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<!--头部结束-->

	<!--logo star-->
	<div class="logo">
		<img src="images/logo/logo_light_black.png" class="logoImg">
		<div class="search">
				<form action="${pageContext.request.contextPath}/CourseListCntroller/indexSearchCourse" method="post" accept-charset="UTF-8">
					<input type="search" placeholder="请输入课程名或者关键词，如吉他..."  name="searchInput">
					<button type="submit" class="btn btn-link">
						<i class="glyphicon glyphicon-search search-ico"></i>
					</button>
				</form>
		</div>
	</div>
	<!--logo ending-->

	<!--导航开始-->
	<div class="main_nav">
		<div class="left_nav">
			<nav class="nav_title">领学者专场 </nav>

			<c:forEach items="${classifys}" var="cs">
				<nav class="nav_menu">${cs.name}
					<i class="fa fa-chevron-right"></i>
				</nav>
			</c:forEach>

		</div>
		<div class="right_content">
			<div class="head_link">
				<ul>
					<li><a href="${pageContext.request.contextPath}/recommendIndex">推荐看点</a></li>
                    <li><a href="${pageContext.request.contextPath}/communityCourse?sort=select">精彩社区</a></li>
                    <li><a href="${pageContext.request.contextPath}/offline.jsp">XX学院</a></li>
                    <li><a href="${pageContext.request.contextPath}/queryTaBySort">XX寻Ta</a></li>
                    <li></li>
				</ul>
			</div>
			<div class="banner">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>


					<!-- Wrapper for slides 轮番区-->
					<div class="carousel-inner" role="listbox">
						<c:forEach items="${CoursePhotoSlideList}" var="cps">
							<div class="item">
								<a href="javascript:;"><img src="${cps.picture}"></a>
							</div>
						</c:forEach>
						
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="item">
				<a href="javascript:;"><img src="${cps.picture}"></a>
			</div>
			<!-- foreach循环左边导航 -->
			<c:forEach items="${classifys}" var="cs">
				<div class="menu_content" style="display: none">
					<div class="menu_detail">
					<!-- 二级导航标题 -->
						<span class="hobby_title">${cs.title}</span> 
						<c:forEach items="${cs.subClassifyList}" var="c">
							<ul>
								<li><a href="javascript:;">${c.name}</a></li>  <!-- 二级导航名称 -->
							</ul>
						</c:forEach>
					</div>
					<!-- 首页二级导航下广告 -->
					<div  class="ad">
					<c:forEach items="${cs.subClassifyList}" var="c" begin="1" end="3" step="1">
						<a href="https://detail.tmall.com/item.htm?spm=a230r.1.14.6.13dd7e2eHxRLnm&id=560724123949&cm_id=140105335569ed55e27b&abbucket=18">
							<div class="item">
								<img src="images/ad/kq.jpg">
								<span class="ad_title">${c.name}</span>
								<%-- <span class="price">￥${c} </span> --%>
							</div>
						</a>		
					</c:forEach>
					</div>
				</div>

			</c:forEach>
		</div>
	</div>
	<!--导航结束-->


	<!--推荐部分开始-->
	<div class="recommend">
	<!--加入购物车成功弹框-->
		<div class="addcart">
			<span class="success">
				添加购物车成功
			</span>
			<button class="sure">确定</button>
		</div>
		<!--精选课程-->
		<div class="course">
			<div class="title">
				<img src="images/iconfont/light.png"> 
					精 / 选 / 课 / 程 
					<img src="images/iconfont/reward.png">
			</div>
			<div class="courseList">
				<a href="course.html"> 
				<!-- foreach循环精选课程 -->
				 <c:forEach items="${CourseList}" var="courseList">
						<div class="courseInfo">
							<img src="${courseList.picture}"> 
							<a href="course.html"><div class="courseTitle">${courseList.name}</div></a>
							<div class="courseDes">
								${courseList.brief}<br>
							</div>
							<div class="priceWrap">
								<span class="price">￥ 29.9</span>
								<div class="like">
									<i class="fa fa-heart-o collect" aria-hidden="true"></i> <i
										class="fa fa-shopping-cart" aria-hidden="true"></i>
								</div>
							</div>
							<div class="courseTeacher">
								<a href="leader.html"><img
									src="images/iconfont/default1.png">鬼鬼</a><span class="school">陕西理工大学</span>
							</div>
						</div>
					</c:forEach>
				</a>
			</div>
		</div>
		<!--热门课程-->
		<div class="course">
			<div class="title">
				<img src="images/iconfont/innovation.png"> 
					热 / 门 / 课 / 程
				 <img src="images/iconfont/fdj.png">
			</div>
			<div class="courseList">
				<a href="course.html"> 
				<!-- foreach循环精选课程 -->
			 <c:forEach items="${freeCourse}" var="freeCourse">
						<div class="courseInfo">
							<img src="${freeCourse.picture}"> <a href="course.html">
							<div class="courseTitle">${freeCourse.name}</div></a>
							<div class="courseDes">
								${freeCourse.brief}<br>
							</div>
							<div class="priceWrap">
								<span class="price">￥ 29.9</span>
								<div class="like">
									<i class="fa fa-heart-o collect" aria-hidden="true"></i> <i
										class="fa fa-shopping-cart" aria-hidden="true"></i>
								</div>
							</div>
							<div class="courseTeacher">
								<a href="leader.html"><img
									src="images/iconfont/default1.png">鬼鬼</a><span class="school">陕西理工大学</span>
							</div>
						</div>
					</c:forEach>
				</a>
			</div>
		</div>
		<!--最新课程-->
		<div class="course">
			<div class="title">
				<img src="images/iconfont/earth.png"> 最 / 新 / 课 / 程<img
					src="images/iconfont/star-bar.png">
			</div>
			<div class="courseList">
			<!-- foreach循环最新课程 -->
			 <c:forEach items="${UpdateCourseList}" var="UpdateCourseList">
						<div class="courseInfo">
							<img src="${UpdateCourseList.picture}"> <a href="course.html">
							<div class="courseTitle">${UpdateCourseList.name}</div></a>
							<div class="courseDes">
								${UpdateCourseList.brief}<br>
							</div>
							<div class="priceWrap">
								<span class="price">￥ 29.9</span>
								<div class="like">
									<i class="fa fa-heart-o collect" aria-hidden="true"></i> <i
										class="fa fa-shopping-cart" aria-hidden="true"></i>
								</div>
							</div>
							<div class="courseTeacher">
								<a href="leader.html"><img
									src="images/iconfont/default1.png">鬼鬼</a><span class="school">陕西理工大学</span>
							</div>
						</div>
					</c:forEach>
			</div>
		</div>

		<!--推荐领学者-->
		<div class="leader">
			<div class="title">
				<img src="images/iconfont/vip.png"> 推 / 荐 / 领 / 学 / 者
			</div>
			<div class="leaderList">
			<!-- foreach循环精选课程 -->
			 <c:forEach items="${recommendTeacher}" var="recommendTeacher">
				<div class="leaderInfo">
				<!-- 当头像为空时，就设置为默认头像 -->
				<c:choose>
					<c:when test="${!empty recommendTeacher.header}">
						<img src="${recommendTeacher.header}" class="leaderImg">
					</c:when>
					<c:otherwise>
					<img src="images/iconfont/default1.png" class="leaderImg">
					</c:otherwise>
				</c:choose>
				<div class="teacherName">${recommendTeacher.userid}</div>
				<!-- 当title为空时，就设置为默认简介 -->
				<c:choose>
					<c:when test="${!empty recommendTeacher.title}">
						<div class="teacherDes">${recommendTeacher.title}</div>
					</c:when>
					<c:otherwise>
						<div class="teacherDes">暂无简介</div>
					</c:otherwise>
				</c:choose>
				</div>
		    </c:forEach>
			</div>
		</div>
	</div>
	<!--推荐部分结束-->
	<!--底部信息栏开始-->
	<%@ include file="../common/footer.jsp"%>
	<!--底部信息栏结束-->
	
	<!--弹框背景设置透明开始-->
	<div id="fade" class="black_overlay"></div>
	<!--弹框背景设置透明结束-->

	<a href="javascript:;" class="backtop" title="回到顶部" id="backtop"></a>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/js/distpicker.min.js"></script>
</body>
</html>