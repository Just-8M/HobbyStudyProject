<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>抱歉，您访问的页面找不到了~</title>
    <link rel="shortcut icon" href="light_favicon.ico">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/reset.css">
    <style type="text/css">
    .content{
        width: 600px;
        height: 500px;
        text-align: center;
        margin: 20px auto;
        background: url('../images/tipIco/500.jpg') no-repeat center center;
        background-size: 100%;
    }
    .content .not_found{
        padding-top: 340px;
        font-size: 20px;
        color: #666666;
    }
    .content .not_found span{
        font-size: 16px !important; 
    }
    .content .not_found a{
        color: #FFC125;
        text-decoration: none;
    }
    </style>
</head>
<body>
 <c:import url="header.jsp"></c:import>
   <div class="content">
        <div class="not_found">
            BiuBiu~服务器内部错误，页面崩溃啦！<br />
            <span>没关系，我带你回去~ 您可以<a href="javascript:history.back(-1)">返回上级</a>或者<a href="${pageContext.request.contextPath}/getIndexPage">返回首页</a></span>
        </div>
    </div>
<%--      <c:import url="footer.jsp"></c:import> --%>
</body>
</html>