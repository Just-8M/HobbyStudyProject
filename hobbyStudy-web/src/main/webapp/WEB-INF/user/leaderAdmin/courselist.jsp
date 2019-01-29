<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>趣学网领学者管理后台——课程列表</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <style>
        .ck-container{
            width: 100%;
            padding: 15px 30px;
        }
        .page-header{
            margin-top: 10px !important;
        }
        .page-header .search{
            width: 230px;
        }
        .page-header .search input,
        .page-header .search button{
            height: 34px;
        }
        .course-content{
           padding: 0 70px;
        }
        .course-content .course-list .c-item{
            width: 230px;
            height: 260px;
            float: left;
            margin: 15px 10px;
            /* border:1px solid #ccc; */
        }
        .c-item .course-pic-wrap .c-img{
            width: 100%;
            height: 160px;
            /* background: #ccc; */
        }
        .c-item .course-info{
            padding: 0 10px;
        }
        .c-item .course-info .c-title .c-text{
            color: #333;
            font-size: 16px;
            min-height: 25px;
            max-height: 50px;
            overflow: hidden;
             /*去除bootstrap默认的margin：0 0 0 10px  */
             margin: 0;
        }
 
        .c-item .course-info .c-author .c-text{
            color: #333;
            width: 100%;
            height: 25px;
            line-height: 25px;
            /* text-overflow: ellipsis;
            white-space: nowrap; */
             /*去除bootstrap中p默认的margin：0 0 0 10px  */
            margin: 0;
        }
    </style>
</head>

<body>
    <div class="ck-container">
        <div class="page-header cf">
            <h4 class="lf">课程管理 <small>已发布课程</small></h4>
            <!-- 搜索框 -->
            <div class="search rt">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="请输入课程名">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">搜索</button>
                    </span>
                </div>
            </div>
            <!-- 搜索框/ -->
        </div>

        <div class="course-content cf">
            <ul class="course-list">
                <!-- 数据从此处开始循坏 -->
                <li class="c-item">
                    <div class="course-pic-wrap">
                        <a href="javascript:;">
                            <img src="${pageContext.request.contextPath}/images/logo/black_logo_light.png" class="c-img">
                        </a>
                    </div>
                    <div class="course-info">
                        <div class="c-title">
                            <a href="javascript:;">
                                <p class="c-text">{{课程名字：若名字超过一行则显示...，并且鼠标划过显示title}}</p>
                            </a>
                        </div>
                        <div class="c-author">
                            <!-- 作者:非真实姓名和用户名/昵称 -->
                            <i class="glyphicon glyphicon-user"></i>
                            <span class="c-text">{{作者}}</span>
                        </div>
                        <div class="c-time">
                            <i class="glyphicon glyphicon-time"></i>
                            <span class="c-text price-num">{{发布时间}}</span>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            // 鼠标移入显示题目的title
            $('.c-title p').hover(function () {
                var title_text = $(this).text();
                $(this).attr('title', title_text);
            })

        })
    </script>
</body>

</html>