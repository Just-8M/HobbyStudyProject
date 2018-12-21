<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 评论页整体样式 */
/*  .comment_total{
	width: 802px;
	border:1px solid blue;
} */

.comment{
	padding: 0px 10px 20px 10px;
	border-bottom: 1px solid #eee;
	margin: 20px 0px;
	min-height: 120px;
	width: 798px;
	/*  border:1px solid blue; */  /* 每个评论内容单独边框，包含头像在内 */
}
.clearfix {
	clear: both;
}
.comment-header{
	float: left;
	width: 70px;
}
.comment-main{
	float: left;
	width: 700px;
	 /* border:1px solid red;  */   /* 每个评论内容单独边框，不包含头像在内 */
	
}
.comment-header img{
	width: 40px;
	height: 40px;
	border-radius:50%;
}
.comment-main .user-name{
	font-weight: bold;
	font-size: 14px;
}
.comment-main .comment-content{
	margin-top: 20px;
	width:500px;
}
.comment-main .comment-footer{
	margin-top: 20px;
}
.comment-main .comment-footer a{
	margin-left: 50px;
	display: inline-block;
	color: #93999f;
}
.comment-main .comment-footer a:hover{
	color: #0089D2;
}
/*
.comment_pages{
     width:600px;
	border: 1px solid red;
} */
</style>
</head>
<body>
<p>${user.collegeName}</p>
<div class="comment_total">
	<c:if test="${! empty (page.items)}">
		<c:forEach items="${page.items}" var="pi">
			<div class="comment clearfix">
				<div class="comment-header">
					<img class="lecturer-uimg" src="${pageContext.request.contextPath}/images/iconfont/header-img-comment_03.png">
				</div>
				<div class="comment-main">
					<div class="user-name">${pi.username}</div>
					<div class="comment-content">${pi.content}</div>
					<div class="comment-footer">
						<span>时间：${pi.createTime} </span>
					</div>
				</div>
			</div>
			<%-- 
		${pi.sectionTitle} --%>
		</c:forEach>
		<!-- 分页 -->
		<div class="comment_pages">
		<%@ include file="../common/pages.jsp"%>
		</div>
	</c:if>
</div>
</body>
</html>