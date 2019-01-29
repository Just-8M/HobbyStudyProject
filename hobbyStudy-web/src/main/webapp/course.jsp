<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>课程名称</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo/light_favicon@32.ico">
<link rel="stylesheet" type="text/css"
	href="styles/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="styles/bootstrap/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="styles/css/reset.css">
<link rel="stylesheet" type="text/css" href="styles/css/course.css">
<link rel="stylesheet" href="styles/css/style.css">
<link rel="stylesheet" href="styles/css/comment.css">
<style type="text/css">
/* 简介、评论、问答    START*/
.course_tab_wrap_first{
   width: 880px;
   /* height:200px; */
   min-height:auto;
   background: rgb(255, 255, 255);
   display:inline-block;
  /*  border:1px solid red; */   /*   整个评论区的边框在内 */
  }
 .course_tab_wrap_first  .commentment   .courseDetail .course_intro_text{
  text-align: justify;
  margin: 20px 0;
  border-radius: 8px;
  height: auto;
  line-height: 30px;
  font-size: 16px;
  min-height: 80px;
  padding: 20px;
  background: #fffacd;
 }
.course_tab_wrap_first  .commentment .courseDetail .course_intro_pic img {
  display: block;
  width: 100%;
  margin: 10px 0;
}
.course-menu {
	width: 800px;
	padding: 30px 20px;
   /*  border:1px solid green;  */  /* 简介、评论、问答单独边框 */
  }

.course-menu .menu-item {
	font-size: 16px;
	font-weight: bold;
	float: left;
	width: 100px;
	display: inline-block;
  }
  /*每个课程整体宽度 */
 .comment{
  width: 800px;
 /*  border:1px solid blue; */
  background: #FFFFFF; 
  }  
/* END */
</style>
</head>
<body>
	<!--引入公共头部-->
	<%@include file="../common/header.jsp"%>

	<!-- 说明:私下交易平台不负责 -->
	<div class="warning">
		与领学者私下交易造成的任何损失与纠纷，趣学网不承担任何责任，如若有领学者向你提出私下交易，请立即<a href="javascript:;">投诉</a>。
		<img src="images/iconfont/close_gray.png">
	</div>
	<!--课程详情页开始-->
	<div class="coursewrap cf">
		<div class="courseDetail">
			<!-- 课程图片或视频缩略图 -->
			<div class="coursevideo">
				<img src="images/ad/dance.jpg">
				<div class="video_btn">播放视频简介</div>
			</div>
			<!-- 视频链接  默认隐藏 -->
			<div class="videolink">
				<video muted width="600" height="370" controls>
					<source src="images/video/when-it-rains-it-pours.mp4"
						type="video/mp4">
					抱歉，该视频暂时无法观看，请您下载最新版浏览器！
				</video>
			</div>

			<div class="course_right">
				<!-- 课程名称 -->
				<div class="course_title">${course.name}</div>
				<!-- 价格 -->
				<div class="course_price">
					价格：<span>￥${course.price}</span>
				</div>

				<!-- 喜欢/加入购物车 -->
				<div class="love_addcart">
					<span class="love">喜欢</span> <span class="addcart">加入购物车</span>
					<div class="cart_animate"></div>
				</div>
				<!-- 课程公告栏 -->
				<div class="notice">课程公告栏</div>
				<div class="course_notice">
					<div class="star_time">
						开课时间：<span>2018年11月28日</span><span>~2019年1月18日</span>
					</div>
					<div class="class_hour">
						课程时长：<span>${course.time}</span>
					</div>
					<div class="week_hour">
						学时安排：<span>每周2-4学时</span>
					</div>
					<div class="destination">
						学习内容：<span>《咏春》是七朵组合的中国风舞蹈，在30天的时间里将教你跳会这首舞蹈</span>
					</div>
					<!-- <div class="introduced">课程介绍：<span>课程介绍最多输入四行，课程介绍最多输入四行，课程介绍最多输入四行，课程介绍最多输入四行，课程介绍最多输入四行，课程介绍最多输入四行，课程介绍最多输入四行，课程介绍最多输入四行，课程介绍最多输入四行，课程介绍最多输入四行，课程介绍最多输入四行，课程介绍最多输入四行，课程介绍最多输入四行，课程介绍最多输入四行，课程介绍最多输入四行，</span></div> -->
				</div>
				<!-- 购买课程按钮 -->
				<div class="buy cf">
					<div class="btn">购买课程</div>
					<div class="next_course">
						<div class="sign_up">
							怕错过精彩内容？ <a href="javascript:;">报名下一次开课</a>
						</div>
						<div class="sign_up_success" style="display: none">
							恭喜你已提前报名下一次开课，开课信息会第一时间提醒你哦~ <a href="javascript:;">取消报名</a>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<!--课程详情页结束-->

	<!-- 课程选项卡开始 -->
	<div class="course_tab_wrap cf"> 
		<div class="course_tab_wrap_first">
			<div class="course-menu"> 
				<a href="javascript:void(0)"> 
					<span onclick="showTab(this,'courseSection')" class="menu-item cur">简介</span>
				</a>
				 <a href="javascript:void(0)"> 
				 	<span onclick="showTab(this,'commentQA',0)" class="menu-item">评论</span>
				 </a> 
				 <a href="javascript:void(0)">
				 	 <span onclick="showTab(this,'commentQA',1)" class="menu-item">问答</span>
				</a>
			</div>
			<!-- 简介 start -->
			<div id="courseSection"  class="commentment">
				   <div class="courseDetail active" id="courseDetail">
                    	<div class="course_intro_text">
					                        课程简介<br>
					                        课程运用模具、服装、图文并茂，通俗易懂。依据女生不同的身材、肤色、个性等方面讲授服装搭配的方法和技巧，提高服饰审美和穿着搭配能力。课程受众面广，实用性强，不仅让女生变得穿着得体、端庄雅致、青春靓丽，甚至改变了她们的生活态度，让她们更加沉稳自信。本课程为江西省精品在线开放课程。
					                        —— 课程团队
                    	</div>
                    	<div class="course_intro_pic">
	                        <img src="images/ad/artist-guitar-guitarist-33597.jpg" >
	                        <img src="images/ad/blonde-blur-close-up-164826.jpg" >
                  	  </div>
                  </div>
			</div>
			<!-- 简介 END -->
			<!-- 评论区 START  -->
			<div id="commentQA"  class="commentment"></div>
			<!-- 评论区 END -->
		</div>
		
		<div class="course_leader">
			<!-- 领学者信息 -->
			<c:forEach items="${recomdCourseList}" var="recl">
				<div class="leader_visiting_card">领学者简介</div>
				<div class="profile_photo cf">
					<a href="javascript:;"><img
						src="${user.header}"></a>
					<div class="name_school">
						<a href="javascript:;"><div class="leader_name">${user.realname}</div></a>
						<div class="leader_school">${user.collegeName}</div>
					</div>
					<div class="favorite">+ 关注Ta</div>
				</div>
				<div class="course_comment cf">
					<ul>
						<li>粉丝数<span class="fan_num">98</span></li>
						<li><a href="javascript:;">课程数<span class="course_num">3</span></a></li>
						<li>学习人次<span>${course.studyCount}</span></li>
					</ul>
				</div>
				<div class="introduction">${user.sign}</div>
			</c:forEach>
		</div>
		
	</div>
	<!-- 课程选项卡结束 -->

	<!-- 回到顶部 -->
	<a href="javascript:;" class="backtop" title="回到顶部" id="backtop"></a>

	<!-- 弹出框背景透明 -->
	<div id="fade" class="black_overlay"></div>

	<!-- 举报框 -->
	<div class="tip-off_wrap">
		<span class="illustrate">为防止恶意举报，请填写以下内容：</span>
		<div class="tip-off_cause">
			请选择举报原因： <select>
				<option value="">言语辱骂</option>
				<option value="">推广广告</option>
				<option value="">违法违规</option>
				<option value="">色情低俗</option>
				<option value="">赌博诈骗</option>
				<option value="">其他</option>
			</select> <span class="other-cause">其他说明:</span>
			<textarea name="tip-off_cause" id="other-supply" cols="25" rows="3"
				maxlength="120"
				placeholder="若选择其他原因，请填写该项内容，以便平台为大家提供良好的氛围！非常感谢您的意见"></textarea>
		</div>
		<div class="submit-btn">提交</div>
	</div>

	<!-- 引入公共底部 -->
	<%@ include file="../common/footer.jsp"%>
	<script src="script/bootstrap/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="script/model/jquery.flexText.js"></script>
	<script type="text/javascript" src="script/course.js"></script>
	<!-- 评论效果 -->
	<script type="text/javascript">
		/**
		 *展示tab commentQA
		 **/
		function showTab(el, divId, type) {
			$('.course-menu').find('span').each(function(i, item) {
				$(item).removeClass('cur');
			});
			$(el).addClass('cur');
			if (divId == 'courseSection') {
				$('#courseSection').show();
				$('#commentQA').hide();
			} else {
				$('#commentQA').show();
				$('#courseSection').hide();
				_queryPage(1, type);//默认加载 第 1 页
			}
		}
		/**
		 *加载 课程评论 & 问答 
		 * courseId：课程id
		 * sectionId: 章节id
		 * type : 类型 0-评论；1-答疑 
		 */
		var _type = 0; //全局变量 
		function _queryPage(pageNum, type) {
			if (type == undefined)
				type = _type;
			else
				_type = type;
			//加载评论或者QA
			if (pageNum == undefined)
				pageNum = 1;
			var courseId = ${(course.id)}
			/* alert("123"); */
			;//课程id
			var url = '${pageContext.request.contextPath}/courseComment';
			$("#commentQA").load(url, {
				'courseId' : courseId,
				'type' : type,
				'pageNum' : pageNum
			}, function() {
			});
		};
	</script>
</body>
</html>