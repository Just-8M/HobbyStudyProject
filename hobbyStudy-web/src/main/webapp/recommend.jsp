<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>推荐看点-原来身边都是隐藏高手</title>
<link rel="shortcut icon" href="light_favicon@32.ico"
	type="image/x-icon">
<link rel="stylesheet" href="styles/css/reset.css">
<link rel="stylesheet" href="styles/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="styles/css/recommend.css">
</head>

<body>
	<!--引入公共头部-->
	<%@include file="../common/header.jsp"%>
	 <!-- 轮播图 START-->
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
            <a href="javascript:;" class="contribute_btn">投稿</a>
            <span class="notice">点击投稿可以将您的作品分享给大家，<br>独乐乐不如众乐乐</span>
        </div>
    </section>
    <!-- 轮播图 END-->
	<!-- 导航推荐 -->
	<section class="nav_recommend_wrap">
	 <!-- ${classifys} 循环出6个值 -->
       <c:forEach items="${classifys}" var="classifys">   <!-- 表示每一分类的详细分类和详细课程 -->
		<section class="category_item cf">
		  <!-- 二级分类导航框 -->
			<div class="nav_link_wrap lf">
		       <h4 class="nav_title">${classifys.title}</h4>
			        <ul class="nav_detail">    
		               <!-- 二级分类具体分类课程 -->
				          <c:forEach items="${classifys.subClassifyList}" var="cs">
					          <li><a href="${pageContext.request.contextPath}/recommend_navCategory?name=${cs.name}">${cs.name}</a></li>
				           </c:forEach>
			        </ul>
		       <a href="javascript:;" class="nav_detail_more">更多</a>
		    </div>
			<div class="video_list_wrap rt">
				<ul class="video_list">
				<%int count = 0; %>   <!-- 控制数量 -->
					<c:forEach items="${classifyCourseList}" var="ccl" >
						<!--判断每个课程所属板块 -->
			            <c:if test="${classifys.title == ccl.classifyName}" >
			            <% count = count+1;request.setAttribute("count", count);%>
				             <c:if test="${requestScope.count <= 7}"> 
				            	<li class="video_item">
		                       		 <a href="${pageContext.request.contextPath}/SingleCourseDetails?id=${ccl.id}">
				                         <span class="img_wrap">
				                              <img src="https://cs.xinpianchang.com/uploadfile/article/2018/12/25/5c220bc3ccf12.jpeg@540w_324h_1e_1c.jpg" class="video_img">
				                          </span>
		                            	  <span class="video_title">${ccl.name}</span>
		                        	 </a>
		                        	<span class="play_video_num"><i class="glyphicon glyphicon-expand"></i> 6958</span>
	                   		    </li>
				            </c:if>
			            </c:if>
			         </c:forEach>
				</ul>
			</div>
		</section>

	</c:forEach>
	</section>
	<!--底部信息栏开始-->
	<%@ include file="../common/footer.jsp"%>
	<script src="script/bootstrap/jquery-3.2.1.min.js"></script>
	<script src="lib/js/recommend_slide.js"></script>
	<script type="text/javascript">
		$(function() {
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

			// 如果导航传入的数据大于16个显示更多
			$('.nav_detail').mouseenter(
					function() {
						var nav_len = $(this).find('li').length;
						if (nav_len > 16) {
							$(this).siblings('.nav_detail_more').css('display',
									'block');
						} else {
							$(this).siblings('.nav_detail_more').css('display',
									'none');
						}
					})
			// 初始化轮播图
			$(".af4").slide({
				affect : 4,
				time : 3000,
				speed : 400,
			});

		})
	</script>
</body>

</html>