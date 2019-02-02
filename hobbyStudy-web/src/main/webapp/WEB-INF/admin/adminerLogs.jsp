<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>待审核课程</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/common/css/reset.css">
    <style>
        .container {
            position: relative;
            margin-top: 30px;
        }

        /* 设置表格文字居中 */
        .table-title tr th {
            font-size: 14px;
            text-align: center !important;
            border-color: #ddd;
            background-color: #f9f9f9;
        }

        /* 设置表格垂直居中 */
        .table>tbody>tr>td,
        .table>tbody>tr>th,
        .table>thead>tr>th,
        .table>thead>tr>td {
            vertical-align: middle !important;
        }

        /* 分页 */
        .pagination {
            width: 280px;
            position: absolute;
            left: 50%;
            margin-left: -140px;
        }

          /* 调整搜素栏的边距 */
          .content-header{
            width: 100%;
            height: 60px;
        }
        /* 清除bootstrap默认的左边距 */
        .col-sm-4{
            padding-left:0 !important; 
        }
        /* 日期input宽度 */
        .date input{
            width: 150px;
            margin:0 5px;
        }
        .date span{
            height: 34px;
            line-height: 34px;
        }
    </style>
</head>

<body>
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="./main.html">首页</a></li>
            <li><a href="#">管理员管理</a></li>
            <li class="active">操作日志</li>
        </ol>
        <section class="content-header cf">
            <form action="" class="search">
                <div class="col-sm-4">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="请输入搜素内容">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button"><i class="glyphicon glyphicon-search"></i></button>
                        </span>
                    </div>
                </div>
            </form>
            <!-- 按钮组 -->
            <div class="date rt" role="group">
                <input type="date" class="form-control lf">
                <span class="lf"><i class="glyphicon glyphicon-minus"></i></span>
                <input type="date" class="form-control lf">
            </div>
        </section>

        <section class="content">
            <table class="table table-bordered" style="text-align:center;">
                <thead class="table-title">
                    <tr>
                        <th>序号</th>
                        <th>管理员ID</th>
                        <th>操作时间</th>
                        <th>操作记录</th>
                        <th>登录时间</th>
                    </tr>
                </thead>
                <tbody>
	                <c:forEach items="${AdminOperateLog}" var="adminlog">
	                	 <tr>
	                        <td>${adminlog.id}</td>
	                        <td>${adminlog.adminName}</td>
	                        <td>
	                        	<fmt:formatDate value="${adminlog.createtTme}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                        </td>
	                        <td>${adminlog.operateRecord}</td>
	                        <td>${adminlog.loginTime}</td>
	                    </tr>
	                </c:forEach>
                </tbody>
            </table>

            <!-- 分页 -->
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <!-- 如果当前为第一页则为向前按钮添加class为disabled；使其不可点击 -->
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /分页 -->
        </section>
    </div>

    <script src="${pageContext.request.contextPath}/admin/lib/jquery/jquery-3.3.1.min.js"></script>
</body>

</html>