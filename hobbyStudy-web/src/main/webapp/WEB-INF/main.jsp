<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台默认首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/styles/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/styles/css/style.css">
    <style>
    .jumbotron{
        width: 720px;
        margin: 100px auto;
        text-align: center;
    }
    .jumbotron .logo{
        width: 40%;
    }
    .jumbotron h1{
        letter-spacing: 7px;
    }
    </style>
</head>
<body>
    <div class="jumbotron">
        <img src="${pageContext.request.contextPath}/images/logo/black_logo_light.png" class="logo">
        <h1>后台管理系统,欢迎你！</h1>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/script/bootstrap/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/script/bootstrap/bootstrap.min.js"></script>
</body>
</html>