<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${SingleCourseDetalis.name}</title>
    <link rel="shortcut icon" href="light_favicon@32.ico" type="image/x-icon">
    <link rel="stylesheet" href="styles/css/reset.css">
    <link rel="stylesheet" href="styles/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="styles/css/video.css">
     <!-- 社会化分享 -->
     <link rel="stylesheet" href="lib/css/share.css">
</head>
<body>
    <!--引入公共头部-->
	<%@include file="../common/header.jsp"%>   

    <!-- 视频播放/相关推荐 -->
    <section class="video_wrap cf">
        <div class="video_box lf">
           		<div class="video_box lf">
           			 <video src="https://video.pearvideo.com/mp4/third/20181226/cont-1497439-12719568-142650-hd.mp4"  preload controls="controls"></video>
           		</div>
            <div class="video_info">
                <span class="video_title">${SingleCourseDetalis.name}</span>
                <span class="share_btn"></span>
                <a href="leader.html" class="video_user">
                    <img src="./images/iconfont/default1.png"  class="profile">
                    <span class="user_name">{{用户昵称}}</span>
                </a>
            </div>
            <!-- 评论 -->
            <div class="pl">评论区域</div>
        </div>
        <!-- 相关视频推荐 -->
        <div class="other_video rt">
            <h4>其他相关推荐</h4>
            <ul class="other_video_list">
              <c:forEach items="${classifyCourseList}"  var="classCourse">
              <!-- 根据当前课程的所属分类推荐相同类别的相关课程 -->
              	<c:if test="${SingleCourseDetalis.classifyName == classCourse.classifyName}">
              		<c:if test="${SingleCourseDetalis.name != classCourse.name}">
		                     <li>
		                        <a href="${pageContext.request.contextPath}/SingleCourseDetails?id=${classCourse.id}">
		                            <div class="video_box lf">
		                                <video src="https://video.pearvideo.com/mp4/third/20181226/cont-1497439-12719568-142650-hd.mp4" id="video_time"  preload class="video_link">
		                                </video>
		                            </div>
		                            <div class="video_info lf">
		                                <sapn class="video_name">${classCourse.name}</sapn>
		                                <span class="user_name">${classCourse.username}</span>
		                                <span class="play_num"><i class="glyphicon glyphicon-expand"></i>568</span>
		                            </div>
		                        </a>
		                    </li>
	                    </c:if>
                    </c:if>
              </c:forEach>
            </ul>
        </div>
    </section>
    <!--底部信息栏开始-->
	<%@ include file="../common/footer.jsp"%>
	<!--底部信息栏结束-->
     
     <script src="script/bootstrap/jquery-3.2.1.min.js"></script>
      <!-- 社会化分享 -->
    <script src="lib/js/share.js"></script>
     <script>
         window.onload = function(){
            //  初始分享
            $(".share_btn").socialShare({
                content: '',
                url:'',
                titile:''
            });
            // 获取视频时长
            var time;
            var pl = document.getElementById('video_time');
            time = Math.floor(pl.duration); //视频的总秒数,取整
            //alert(time);
            //获取分钟
            var minute = Math.floor(time / 60);
            // 获取秒
            var second = time % 60;
            if(minute < 10) {
                minute = '0' + minute;
            }else if(second < 10){
                second = '0' + second;
            }
            var total_time = minute + "'" + second + "''";
            console.log(total_time);
         }
     </script>
</body>
</html>