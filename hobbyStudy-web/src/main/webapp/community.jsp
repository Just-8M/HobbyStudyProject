<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>专属你的舞台——精彩社区</title>
    <link rel="shortcut icon" href="light_favicon@32.ico" type="image/x-icon">
    <link rel="stylesheet" href="styles/css/reset.css">
    <link rel="stylesheet" href="styles/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="styles/css/community.css">
</head>
<body>
	
    <!--引入公共头部-->
	<%@include file="../common/header.jsp"%>   
    <section class="container">
        <!-- 发布作品 -->
        <section class="rank_wrap">
            <div class="rank_left left">
                <span class="active">
	                 <a href="javascript:;" style="display: inline-block;margin-right:20px;" onclick="_queryPage(1,'select')">
		                 <c:choose>
	                		<c:when test="${!empty sort && sort=='select'}">
								 <span class="new active">精选1</span>                		
	                		</c:when>
	                		<c:otherwise>
								 <span>精选2</span>                		
	                		</c:otherwise>
	                	</c:choose>
	                 </a>
                </span>
                <span>
                	 <a href="javascript:;" style="display: inline-block;margin-right:20px;" onclick="_queryPage(1,'last')">
		                 <c:choose>
	                		<c:when test="${!empty sort && sort=='last'}">
								 <span class="new active">最新1</span>                		
	                		</c:when>
	                		<c:otherwise>
								 <span>最新2</span>                		
	                		</c:otherwise>
	                	</c:choose>
	                 </a>
                </span>
                <span>
                	<a href="javascript:;" style="display: inline-block;margin-right:20px;" onclick="_queryPage(1,'hot')">
		                 <c:choose>
	                		<c:when test="${!empty sort && sort=='hot'}">
								 <span class="new active">最热1</span>                		
	                		</c:when>
	                		<c:otherwise>
								 <span>最热2</span>                		
	                		</c:otherwise>
	                	</c:choose>
	                 </a>
                </span>
            </div>
            <div class="publish_btn right">
                <button>发布作品</button>
            </div>
        </section>

        <!-- 作品排行 -->
        <section class="works_wrap cf"> 
            <ul class="works_list">
            <c:if test="${!empty page.items}">
            <c:forEach items="${page.items}" var="pi">
                <li class="work_item">
                    <a href="${pageContext.request.contextPath}/SingleCourseDetails?id=${pi.id}">
                        <img class="work_item_img" src="./images/findTa-banner/pexels-photo-1401796.jpeg" >
                        <div class="work_item_info">
                            <span class="work_item_name">${pi.name}</span>
                        </div>
                        <!-- 鼠标移入显示视频介绍 -->
                        <div class="work_item_img_hover">
                            <span class="work_item_intro">{{视频介绍}}</span>
                        </div>
                    </a>
                    <span class="work_item_time">
                    	<!-- 转换时间格式 -->
                   		<fmt:formatDate value="${pi.updateTime}" pattern="yyyy-MM-dd"/>
                   		<%-- <fmt:formatDate value="${pi.updateTime}" pattern="yyyy-MM-dd"/>  --%>
                    </span>
                    <div class="work_user">
                         <a href="leader.html">
                            <img class="work_user_profile" src="./images/findTa-banner/pexels-photo-1262357.jpeg">
                            <span class="user_name">${pi.userid}</span>
                        </a>
                    </div> 
                  </li>
                </c:forEach>
                </c:if>
            </ul>
        </section>
 		<!-- 分页 -->
       <%@ include file="../common/pages.jsp" %>
       <%--  <!--pagehelper 分页 -->
        <a href="${pageContext.request.contextPath}/communityCourse?pageIndex=1">首页</a>
		<c:forEach begin="1" end="${pages}"  var="sc">
			<a href="${pageContext.request.contextPath}/communityCourse?pageIndex=${sc}"> ${sc}</a>
		</c:forEach>
		<a href="${pageContext.request.contextPath}/communityCourse?pageIndex=${pages}">尾页</a> --%>
		
    </section>

    <!--回到顶部-->
    <a href="javascript:;" class="backtop" title="回到顶部" id="backtop"></a>
   <!--底部信息栏开始-->
	<%@ include file="../common/footer.jsp"%>
	<!-- 底部信息结束 -->
    <script src="script/bootstrap/jquery-3.2.1.min.js"></script>
    <!-- 回到顶部 -->
    <script src="script/back_top.js"></script>
    <script type="text/javascript">
        // 点击排序切换样式
        $('.rank_left span').click(function() {
            $(this).addClass('active').siblings().removeClass('active');
        })
        // 鼠标划过视频缩略图显示视频介绍
        $('.work_item .work_item_img').mouseenter(function() {
            $(this).siblings('.work_item_img_hover').css('display','block');
        })
        $('.work_item_img_hover').mouseleave(function() {
            $(this).css('display','none');
        })
        // 课程精选部分
        var _sort = '${sort}';
        function _queryPage(pageNum,sort){
			var params = '?pageNum='+pageNum;
			  //排序，函数参数没有就用页面缓存 
			if(sort == undefined && _sort != ''){
				sort = _sort;
			}
			if(sort != undefined){
				params += '&sort='+sort;
			} 
			 window.location.href='${pageContext.request.contextPath}/communityCourse'+params;
		} 
    </script>
</body>
</html>