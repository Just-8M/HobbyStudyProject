<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>comment</title>
<style type="text/css">
/* 评论页整体样式 */
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
.commentbox{
		width: 869px;
		height:101px;
		margin: 20px auto;
		border: 1px solid gray;
	}
.mytextarea {
	    width: 100%;
	    overflow: auto;
	    word-break: break-all;
	    height: 99px;
	    color: #000;
	    font-size: 1em;
	    resize: none;
	}
</style>
</head>
<body>
<!-- 评论功能 -->
<div class="commentbox">
		<textarea cols="80" rows="50" placeholder="来说几句吧......" class="mytextarea" id="content"></textarea>
		<div class="btn btn-info pull-right" id="comment">评论</div>
		<div style="display:none;" id="courseid">${courseId}</div>
</div>
<div class="comment_total">
	<c:if test="${! empty (page.items)}">
		<c:forEach items="${page.items}" var="pi">
			<div class="comment clearfix" id="commentId">
				<div class="comment-header">
					<img class="lecturer-uimg" src="${pageContext.request.contextPath}/images/iconfont/header-img-comment_03.png">
				</div>
				<div class="comment-main">
					<div class="user-name">${pi.userid}</div>
					<div class="comment-content">${pi.content}</div>
					<div class="comment-footer">
						<span>时间：
							<fmt:formatDate value="${pi.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
						 </span>
					</div>
				</div>
			</div>
		</c:forEach>
		<!-- 分页 -->
		<div class="comment_pages">
		<%@ include file="../common/pages.jsp"%>
		</div>
	</c:if>
</div>
<script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.min.js"></script>
<!-- ajax评论功能 -->
<script type="text/javascript">
$(function(){
	$("#comment").click(function(){
		 var content = $('#content').val();
		 var courseid = $('#courseid').text();
		 $.ajax({
	        'url': "${pageContext.request.contextPath}/courseCommentController/addCourseComment",
	        type: "POST",
	        dataType: 'json',
	        data: {
	         	'content' : content,
	         	'courseId':courseid,
	         },
	         'success':function (data) {
	        	 if (data.addCommentResult == 'success') {
					alert("评论成功");
				} else if(data.addCommentResult == 'loginfail'){
					alert("请登录进行评论：");
					$(window).attr("location","login");
				}else{
					alert("系统维护期间，请见谅...")
				}
	         },
	         'error':function (data){
	             alert("错误");
	         } 
	     });
	});
});
</script>
</body>
</html>