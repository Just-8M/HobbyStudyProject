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
    <!-- 引入字体图标 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/iconmoon/adminVerify/style.css">
    <style>
        .container{
            position: relative;
            margin-top: 30px;
        }
        .content-header{
            width: 100%;
            height: 60px;
        }
        /* 清除bootstrap默认的左边距 */
        .col-sm-4{
            padding-left:0 !important; 
        }
        /* 设置表格文字居中 */
        .table-title tr th{
            font-size: 14px;
            text-align: center !important;
            border-color: #ddd;
            background-color: #f9f9f9;
        }
         /* 全选 */
         .table-title tr th span{
            padding-left:10px; 
        }
        /* 设置表格垂直居中 */
        .table>tbody>tr>td, 
        .table>tbody>tr>th, 
        .table>thead>tr>th, 
        .table>thead>tr>td{
            vertical-align: middle !important;
        }
         /* 限制课程名称的宽度，超过换行 */
         tbody tr td:nth-child(3){
            width: 220px;
            text-align: justify;
        }
        /* 限制作者的宽度 */
        tbody tr td:nth-child(4){
            width: 125px;
        }
         /* 课程价格 */
         tbody tr td:nth-child(5){
            width: 80px;
        }
        /* 调整按钮间距 */
        tbody tr td:last-child button:first-child{
            margin-right: 10px;
        }
         /* 分页 */
         .pagination{
            width: 280px;
            position: absolute;
            left: 50%;
            margin-left: -140px;
        }
        /* 设置字体图标的大小 */
        tbody tr td:last-child i{
            font-size: 60px;
        }
    </style>
</head>

<body>
    <div class="container">
        <!-- 路径导航 -->
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/adminController/mainAdminPage">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/adminController/verifyCourse?type=0">课程管理</a></li>
            <li class="active">待审核课程</li>
        </ol>
        <!-- /路径导航 -->
        <section class="content-header">
            <form action="" class="search">
                <div class="col-sm-4">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="请输入搜素内容" id="courseSearchInput">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button"  id="searchButton" ><i class="glyphicon glyphicon-search"></i></button>
                        </span>
                    </div>
                </div>
            </form>
            <!-- 按钮组 -->
            <div class="btn-group rt" role="group">
                <button type="button" class="btn btn-default" title="按最新时间排序">
                    <i class="glyphicon glyphicon-time"></i>
                </button>
                <button type="button" class="btn btn-default" title="未通过课程">
                    <i class="glyphicon glyphicon-floppy-remove"></i>
                </button>
                <button type="button" class="btn btn-default" title="已通过课程">
                    <i class="glyphicon glyphicon-floppy-saved"></i>
                </button>
            </div>
        </section>

        <section class="content">
        <c:choose>
        	 <c:when test="${totalCourse == 'failLogin'}">
        		<p style="font-size: 30px; color: red" >
                	您还未登录，请您进行登录后操作
                </p>
        	</c:when>
        	<c:otherwise>
	            <table class="table table-bordered" style="text-align:center;">
	                <thead class="table-title">
	                    <tr>
	                        <th><input type="checkbox" id="selectAll"><span>全选</span></th>
	                        <th>序号</th>
	                        <th>课程名称</th>
	                        <th>课程作者</th>
	                        <th>课程价格</th>
	                        <th>提交时间</th>
	                        <th>课程详情</th>
	                        <th>审核状态</th>
	                    </tr>
	                </thead>
	                <tbody id="course_tbody">
	                	 <c:choose>
		                	<c:when test="${totalCourse == 'noCourse'}">
		                		<p style="font-size: 30px;">
		                			没有审核通过相关课程
		                		</p>
		                	</c:when>
		                	<c:otherwise>
		                		<c:forEach items="${totalCourse}" var="tc">
				                	 <tr>
				                        <td>
				                            <input type="checkbox">
				                        </td>
				                        <td>${tc.id}</td>
				                        <td>${tc.name}</td>
				                        <td>${tc.userid}</td>
				                        <td>${tc.price}</td>
				                        <td>
				                        	<fmt:formatDate value="${tc.createTime}"  pattern="yyyy-MM-dd HH:mm:ss"/>
				                        	
				                        </td>
				                        <td><button class="btn btn-primary">查看</button></td>
				                         <td>
				                            <button class="btn btn-success verify-success">通过</button>
				                            <button class="btn btn-danger verify-fail">未通过</button>
		                       			 </td>
				                    </tr>
		               		   </c:forEach>
		                	</c:otherwise>
	                	</c:choose>
	                </tbody>
	            </table>
          </c:otherwise>
		</c:choose>
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
    <script src="${pageContext.request.contextPath}/admin/lib/bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            // 点击按钮通过或未通过显示对应的审核状态
            $('.verify-success').click(function () {
                $(this).parent().html('<i class="icon-verify-success2"></i>').css('color', 'green');
            })
            $('.verify-fail').click(function () {
                $(this).parent().html('<i class="icon-verify-fail2"></i>').css('color', 'red');
            })

             // 全选
             $('#selectAll').click(function () {
                $("tbody input:checkbox").prop("checked", $(this).prop('checked'));
            })
        })
        
      /*未审核*/
 	   $(function(){
 	        $("#searchButton").click(function () {
 	        	var courseSearchName = $("#courseSearchInput").val(); 
 	        	if (courseSearchName != " ") {
 		        	$.ajax({
 						'type':"POST",
 						'url' :"${pageContext.request.contextPath}/adminController/searchCourse",
 						'dataType': 'json',
 						data:{
 							'name':courseSearchName,
 							'type':0
 						},
 						'success':function(data){
 							if (data.searchCourseResult == "fail") {
 								alert("请你登录后进行查询")
 							}else if (data.searchCourseResult == "noCourse") {
 								alert("没有相关课程")
 							}else{
 								alert("succ" + data.searchCourseResult)
 								var data2 = eval(data.searchCourseResult);
 	 			                 $('#course_tbody').empty();
 	 			                	 for(var i in data2){
 	 				                	 $('#course_tbody').append("<tr id=tr"+i+">" +
 	 				                			 '<td><input type="checkbox"></td>'+
 	 				                			 '<td>'+data2[i].id+'</td>'+
 	 				                			 '<td>'+data2[i].name+'</td>'+
 	 				                			 '<td>'+data2[i].userid+'</td>'+
 	 				                			 '<td>'+data2[i].price+'</td>'+
 	 				                			 '<td>'+data2[i].createTime+'</td>'+
 	 				                			 '<td><button class="btn btn-primary">查看</button></td>'+
                       							 '<td><button class="btn btn-success verify-success">通过</button><button class="btn btn-danger verify-fail">未通过</button></td>'+
 	 				                			 +"</tr>");
 	 			                     } 
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