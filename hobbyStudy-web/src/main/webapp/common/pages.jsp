<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function(){
		$('.page_div_firstPage').Attr('disabled',true);
		$('.page_div_endPage').Attr('disabled',true);
	})
</script>
<style type="text/css">
.page_div {
	width: 1100px;
	height: 50px;
	line-height: 50px;
	margin: 0 auto;
	text-align: center;
	/* border: 1px solid red;  *//*底部分页边框 */
}

.page_div a {
	padding: 0 10px;
}

.page_showNums_ps {
	color: #FFF;
	background: #FDD102;
	border-radius: 25px;
}

.page_showNums_ps:hover {
	color: #fff;
}
</style>
</head>
<body>
	<c:if  test="${!empty (page.pageTotalCount) && page.pageTotalCount gt 1}">
		<div class="page_div clearfix">
			<c:if test="${! empty (page.firstPage)}">
				<!-- 结果:True/False -->
				<!-- el表达式中，判断一个表达式${page.pageNum} == '1' -->
				<c:choose>
					<c:when test="${page.pageNum=='1'}">
						<a class="" href="javascript:void(0);">首 页</a>
						<a class="page_div_firstPage" href="javascript:void(0);">上一页</a>
					</c:when>
					<c:otherwise>
						<a class="" href="javascript:void(0);" onclick="_queryPage(1)">首
							页</a>
						<a class="" href="javascript:void(0);"
							onclick="_queryPage(${page.pageNum-1})">上一页</a>
					</c:otherwise>
				</c:choose>
			</c:if>
			<c:forEach items="${page.showNums}" var="ps">
				<c:choose>
					<c:when test="${page.pageNum == ps}">
						<a class="page_showNums_ps" href="javascript:void(0);">${ps}</a>
					</c:when>
					<c:otherwise>
						<a class="" href="javascript:void(0);" onclick="_queryPage(${ps})">${ps}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 判断(page.lastPage)值是否存在，TRUE存在，False不存在 -->
			<%-- ${page.pageNum}..${page.pageTotalCount} --%>
			<c:if test="${!empty (page.lastPage)}">
				<c:choose>
					<c:when test="${page.pageNum == page.pageTotalCount}">
						<a class="page_div_endPage" href="javascript:void(0);")">下一页</a>
						<a class="page_div_endPage" href="javascript:void(0);">尾 页</a>
					</c:when>
					<c:otherwise>
						<a class=" " href="javascript:void(0);"
							onclick="_queryPage(${page.pageNum+1})">下一页</a>
						<a class="" href="javascript:void(0);"
							onclick="_queryPage(${page.pageTotalCount})">尾 页</a>
					</c:otherwise>
				</c:choose>
			</c:if>
		</div>
	</c:if>
</body>
</html>
















