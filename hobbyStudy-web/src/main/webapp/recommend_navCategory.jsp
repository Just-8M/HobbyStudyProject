<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>{{用户选择的分类}}推荐_趣学网</title>
<link rel="shortcut icon" href="light_favicon@32.ico"
	type="image/x-icon">
<link rel="stylesheet" href="styles/css/reset.css">
<link rel="stylesheet" href="styles/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="styles/css/nav_category.css">
</head>
<body>
	<!--引入公共头部-->
	<%@include file="../common/header.jsp"%>
	<!-- 轮播图 -->
	<section class="banner_slide cf">
		<div class="wrap af4 lf">
            <ul class="slidebox">
            <!-- Recommend 页面轮番图 -->
	            <c:forEach  items="${recommendPhotoSlide}"  var="rps">
	                <li><a href="video.html"><img src="${rps.picture}" /></a></li>
	            </c:forEach>
            </ul>
        </div>
		<div class="contribute rt">
			<a href="javascript:;" class="contribute_btn">投稿</a> <span
				class="notice">点击投稿可以将您的作品分享给大家，<br>独乐乐不如众乐乐
			</span>
		</div>


	</section>
	<!-- {{用户点击的导航分类推荐}} -->
	<section class="nav_recommend_wrap">
		<div class="recommend_list cf">
			<ul class="video_list_item">
				<li>${subClassifyName}</li>
				<!-- 从此处开始循环 -->
				<c:forEach items="${NavCategoryCourse}" var="ncc">
					<li><a href="${pageContext.request.contextPath}/SingleCourseDetails?id=${ncc.id}" class="item_link"> 
							<span class="img_wrap"> 
								<img src="${ncc.picture}" class="video_img">
							</span> 
							<span class="video_title">${ncc.name}</span>
						</a> 
						<span class="play_video_num">
						<i class="glyphicon glyphicon-expand"></i> 6958</span>
					</li>
				</c:forEach>
			</ul>
		</div>
	</section>


	<!--底部信息栏开始-->
	<%@ include file="../common/footer.jsp"%>
	<!--底部信息栏结束-->
	<script src="script/bootstrap/jquery-3.2.1.min.js"></script>
	<script src="lib/js/recommend_slide.js"></script>
	<script type="text/javascript">
		$(function() {
			// 轮播初始化
			$(".af4").slide({
				affect : 4,
				time : 3000,
				speed : 400,
			});

			// 鼠标移入视频描述，播放量隐藏，文字全部显示
			$('.video_title').mouseenter(
					function() {
						$(this).css('overflow', 'none');
						$(this).css('text-overflow', 'inherit');
						$(this).css('white-space', 'inherit');
						$(this).parent().siblings('.play_video_num').css(
								'display', 'none');
					})
			$('.video_title').mouseleave(
					function() {
						$(this).css('overflow', 'hidden');
						$(this).css('text-overflow', 'ellipsis');
						$(this).css('white-space', 'nowrap');
						$(this).parent().siblings('.play_video_num').css(
								'display', 'block');
					})
		})
	</script>
</body>
</html>