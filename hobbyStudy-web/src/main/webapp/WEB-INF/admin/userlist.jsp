<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
        .container{
            position: relative;
            margin-top: 30px;
        }
        /* 全选 */
        .table-title tr th span{
            padding-left:10px; 
        }
        /* 设置表格文字居中 */
        .table-title tr th{
            font-size: 14px;
            text-align: center !important;
            border-color: #ddd;
            background-color: #f9f9f9;
        }
        /* 设置表格垂直居中 */
        .table>tbody>tr>td, 
        .table>tbody>tr>th, 
        .table>thead>tr>th, 
        .table>thead>tr>td{
            vertical-align: middle !important;
        }
        /* 分页 */
        .pagination{
            width: 280px;
            position: absolute;
            left: 50%;
            margin-left: -140px;
        }
        .content-header{
            width: 100%;
            height: 60px;
        }
        /* 清除bootstrap默认的左边距 */
        .col-sm-4{
            padding-left:0 !important; 
        }
        /* 限制用户昵称的宽度 */
        tbody tr td:nth-child(3){
            width: 220px;
        }
    </style>
</head>

<body>
    <div class="container">
        <!-- 路径导航 -->
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/adminController/mainAdminPage">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/adminController/userlist">用户管理</a></li>
            <li class="active">用户列表</li>
        </ol>
        <!-- /路径导航 -->
        <section class="content-header">
            <form action="" class="search">
                <div class="col-sm-4">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="请输入搜素用户名" id="userSearchInput">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button"  id="searchUserButton"><i class="glyphicon glyphicon-search"></i></button>
                        </span>
                    </div>
                </div>
            </form>
            <!-- 按钮组 -->
            <div class="btn-group rt" role="group">
                <button type="button" class="btn btn-default" title="仅显示领学者">
                    <i class="glyphicon glyphicon-pawn"></i>
                </button>
                <button type="button" class="btn btn-default" title="所有用户（不包含已注销的用户）">
                    <i class="glyphicon glyphicon-user"></i>
                </button>
            </div>
        </section>

        <section class="content">
            <table class="table table-bordered" style="text-align:center;">
                <thead class="table-title">
                    <tr>
                        <th>序号</th>
                        <th>用户ID</th>
                        <th>用户昵称</th>
                        <th>性别</th>
                        <th>手机号</th>
                        <th>邮箱号</th>
                        <!-- 用户类型指普通用户or领学者 -->
                        <th>用户类型</th>
                        <th>注销用户</th>
                    </tr>
                </thead>
                <tbody id="userList_tbody">
                <c:choose>
                	<c:when test="${queryTotalUser == 'noUser'}">
                		<p>暂没有用户</p>
                	</c:when>
                	<c:otherwise>
                		<c:forEach  items="${queryTotalUser}"  var="qtu">
	                		<tr>
		                        <td>${qtu.id}</td>
		                        <td>${qtu.userid}</td>
		                        <td>${qtu.nickname}</td>
		                        <td>
		                        	<c:choose>
		                        		<c:when test="${qtu.gender == '1'}">
		                        			男
		                        		</c:when>
		                        		<c:when test="${qtu.gender == '2'}">
		                        			女
		                        		</c:when>
		                        		<c:otherwise>
		                        			保密
		                        		</c:otherwise>
		                        	</c:choose>
		                        </td>
		                        <td>${qtu.mobile}</td>
		                        <th>${qtu.email}</th>
		                        <td>
		                      
		                        	<c:choose>
		                        		<c:when test="${qtu.userCategory == '1'}">
		                        			领学者
		                        		</c:when>
		                        		<c:otherwise>
		                        			普通用户
		                        		</c:otherwise>
		                        	</c:choose>
		                        </td>
		                        <td><button class="btn btn-danger">注销</button></td>
                   			 </tr>
                         </c:forEach>
                	</c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </section>

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
    </div>

    <script src="${pageContext.request.contextPath}/admin/lib/jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
    	/* $(function(){
	 	        $("#searchUserButton").click(function () {
	 	        	var userSearchInput = $("#userSearchInput").val(); 
	 	        	alert("userSearchInput:" + userSearchInput);
	 	        	if (userSearchInput != "") {
	 		        	$.ajax({
	 						'type':"POST",
	 						'url' :"${pageContext.request.contextPath}/adminController/searchUser",
	 						'dataType': 'json',
	 						data:{
	 							'name':userSearchInput,
	 						},
	 						'success':function(data){
	 							if (data.searchUserResult == "fail") {
	 								alert("222");
	 								alert("请你登录后进行查询")
	 							}else if (data.searchUserResult == "noUser") {
	 								alert("没有用户");
	 							}else if(data.searchUserResult != null){
	 								alert("你好")
	 							}
	 							else{
	 								alert("error");
	 								}
	 			                }, 
	 						'fail':function(data){
	 							alert("系统错误 ");
	 						}
	 					});
	 	        	}else{
	 	        		alert("请输入搜索内容……")
	 	        	}
	 	        });
    	}) */
    	  $(function(){
   	        $("#searchUserButton").click(function () {
   	        	var userSearchInput = $("#userSearchInput").val(); 
   	        	alert("userSearchInput:"  + userSearchInput);
   	        	if (userSearchInput != "") {
   	        	alert("userSearchInput222:"  + userSearchInput);
   		        	$.ajax({
   						'type':"POST",
   						'url':"${pageContext.request.contextPath}/adminController/searchUser",
   						'dataType': 'json',
   						data:{
   							'name':userSearchInput
   						},
   						'success':function(data){
   							alert("aaaaaaaaaaaaaaaaaaaaaaa")
   							if (data.searchUserResult == "fail") {
 								alert("请你登录后进行查询");
 							}
   							if(data.searchUserResult == "noUser"){
   								alert("没有查到此用户");
   							}
   						},
   						'fail':function(data){
   							alert("系统错误 ");
   						}
   					});
   	        	}else{
   	        		alert("请输入搜索内容……")
   	        	}
   	        });
   	    }); 
    </script>
</body>

</html>