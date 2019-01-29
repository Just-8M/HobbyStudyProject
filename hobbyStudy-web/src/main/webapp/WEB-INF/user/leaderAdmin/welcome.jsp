<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>领学者后台管理首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <style>
    .container{
        width: 520px;
        height: 350px;
       text-align: center;
       position: absolute;
       top:50%;
       left:50%;
       margin-top: -175px;
       margin-left: -260px;
    }
    img{
        width: 60%;
    }
    .container h2{
        letter-spacing: 8px;
    }
    </style>
</head>

<body>
    <div class="container">
        <img src="${pageContext.request.contextPath}/images/logo/black_logo_light.png">
        <h2>领学者管理后台,欢迎你！</h2>
    </div>
</body>

</html>