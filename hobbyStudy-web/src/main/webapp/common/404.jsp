<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>抱歉，您访问的页面找不到了~</title>
    <link rel="shortcut icon" href="light_favicon.ico">
</head>
<body>
 <c:import url="common_header.jsp"></c:import>
    <div class="header"></div>
    <div class="info">
        抱歉，您访问的页面不存在/页面找不到了！
        对不起，我把您的页面弄丢了... ...
        您可以回到网站首页或联系我们
    </div>
     <c:import url="footer.jsp"></c:import>
</body>
</html>