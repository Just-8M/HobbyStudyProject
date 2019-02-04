<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${serrchTitle}|趣学网</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/light_favicon@32.ico" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">
</head>

<body>
<!--引入公共头部-->
 <%@include file="../common/header.jsp" %>
    <!-- 搜索条 -->
    <div id="q_search">
        <div class="col-sm-offset-3 col-lg-6">
                <form action="${pageContext.request.contextPath}/CourseListCntroller/indexSearchCourse" method="post" accept-charset="UTF-8">
		            <div class="input-group search_wrapper">
		                <span class="searchico"><i class="glyphicon glyphicon-search"></i></span>
			                <input type="text" class="search" placeholder="请输入课程关键词，领学者姓名..."  name="searchInput">
			                <span class="input-group-btn">
			                    <button class="btn search_btn" type="submit" class="btn">搜索</button>
			                </span>
		            </div><!-- /input-group -->
	            </form>
        </div><!-- /.col-lg-6 -->
        <!-- 热搜词推荐 -->
        <div class="col-sm-offset-3 col-lg-6 search_hot">
            <ul class="search_list cf">
                <li class="search_word">热搜关键词：</li>
                <li class="search_word"><a href="javascript:;">吉他</a></li>
                <li class="search_word"><a href="javascript:;">爵士舞</a></li>
                <li class="search_word"><a href="javascript:;">英语口语</a></li>
                <li class="search_word"><a href="javascript:;">石头画</a></li>
                <li class="search_word"><a href="javascript:;">滑板</a></li>
                <li class="search_word"><a href="javascript:;">轮滑</a></li>
            </ul>
        </div>
        <!-- /热搜词推荐 -->
    </div>

    <div class="container">
        <!-- 左侧显示搜索结果 -->
        <div class="col-lg-8 search_result">
            <div class="result_lists">
           		 <c:forEach items="${searchCourse}" var="sc">
	                <div class="result_item cf">
	                    <a href="course.html" class="lf course_img_link">
	                        <img src="${pageContext.request.contextPath}/images/logo/black_logo_light.png" class="course_img">
	                    </a>
	                    <div class="course_detail_wrapper lf">
	                        <a href="course.html" class="course_title">${sc.name}</a>
	                        <div class="course_leader_wrapper">
	                            <ul class="leader_info cf">
	                                <!-- 此处放兴趣分类：如吉他，爵士舞 -->
	                                <li>${sc.classifyName}</li>
	                                <li><a href="leader.html">${sc.userid}</a></li>
	                                <li>${sc.direction}</li>
	                                <li>${sc.price}</li>
	                            </ul>
	                        </div>
	                        <div class="course_introduction">
	                            <p class="introduction">${sc.brief}</p>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
        <!-- /左侧显示搜索结果 -->

        <!-- 右侧相关推荐 -->
        <div class="col-lg-4 right_content">
            <div class="search_recommend">
                <div class="title cf">
                    <h4 class="search_word lf">搜索词</h4>
                    <h4 class="lf">相关推荐</h4>
                </div>

                <div class="recommend_lists">
                    <div class="recommend_item cf">
                        <a href="leader.html" class="leaderProfile lf">
                            <img src="${pageContext.request.contextPath}/images/logo/light_logo.png">
                        </a>
                        <div class="leaderInfo lf">
                            <a href="leader.html" class="leaderName">{{leaderName}}</a>
                            <p class="school">{{领学者所在学校}}</p>
                            <p class="leaderIntro">领学者介绍</p>
                        </div>
                    </div>
                    <div class="recommend_item cf">
                        <a href="leader.html" class="leaderProfile lf">
                            <img src="./images/logo/light_logo.png">
                        </a>
                        <div class="leaderInfo lf">
                            <a href="leader.html" class="leaderName">{{leaderName}}</a>
                            <p class="school">{{领学者所在学校}}</p>
                            <p class="leaderIntro">领学者介绍</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /右侧相关推荐 -->
    </div>
    <!--底部信息栏开始-->
	 	 <%@ include file="../common/footer.jsp" %>
    <!--底部信息栏结束-->
</body>
</html>