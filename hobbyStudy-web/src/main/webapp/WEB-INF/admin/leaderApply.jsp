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
    <!-- 引入字体图标 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/iconmoon/adminVerify/style.css">
    <style>
        .container{
                position: relative;
                margin-top: 30px;
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
        /* 调整搜素栏的边距 */
        .content-header{
            width: 100%;
            height: 60px;
        }
        /* 清除bootstrap默认的左边距 */
        .col-sm-4{
            padding-left:0 !important; 
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
          /* 调整按钮间距 */
          tbody tr td:last-child button:first-child{
            margin-right: 10px;
        }
        /* 限制院校名称和用户ID的宽度 */
        tbody tr td:nth-child(2),
        tbody tr td:nth-child(4){
            max-width: 150px; 
        }
        tbody tr td:nth-child(5){
            max-width: 95px;
        }
        /* 设置学籍证明的图片大小 */
        #certificationPic{
            width: 100%;
        }
    </style>
</head>

<body>
    <div class="container">
        <!-- 路径导航 -->
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/adminController/mainAdminPage">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/adminController/leaderApply">用户管理</a></li>
            <li class="active">领学者申请</li>
        </ol>
        <!-- /路径导航 -->
        <section class="content-header">
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
            <div class="btn-group rt" role="group">
                <button type="button" class="btn btn-default" title="审核通过">
                    <i class="glyphicon glyphicon-floppy-saved"></i>
                </button>
                <button type="button" class="btn btn-default" title="审核未通过">
                    <i class="glyphicon glyphicon-floppy-remove"></i>
                </button>
            </div>
        </section>

        <section class="content">
            <table class="table table-bordered" style="text-align:center;">
                <thead class="table-title">
                    <tr>
                        <th>序号</th>
                        <th>用户ID</th>
                        <th>真实姓名</th>
                        <th>所在地区</th>
                        <th>院校名称</th>
                        <th>能力证明</th>
                        <th>审核状态</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>{{用户ID}}</td>
                        <td>{{真实姓名}}</td>
                        <td>陕西省-西安市-阎良区</td>
                        <td>XXXX大学</td>
                        <td><button class="btn btn-primary" data-toggle="modal" data-target="#myModal">查看</button></td>
                        <td>
                            <button class="btn btn-success verify-success">通过</button>
                            <button class="btn btn-danger verify-fail">未通过</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <!-- 查看模态框 -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">{{用户ID}}</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-offset-2 col-sm-2 control-label">用户ID</label>
                                    <div class="col-sm-6">
                                        <p id="userId" class="form-control-static">{{用户ID}}</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-offset-2 col-sm-2 control-label">真实姓名</label>
                                    <div class="col-sm-6">
                                        <p id="realname" class="form-control-static">真实姓名</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-offset-2 col-sm-2 control-label">学籍证明</label>
                                    <div class="col-sm-6">
                                       <img src="./images/logo/black_logo_light.png" id="certificationPic">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

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
        })
    </script>
</body>

</html>