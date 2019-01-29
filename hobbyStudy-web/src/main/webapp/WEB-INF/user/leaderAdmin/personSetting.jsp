<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>领学者管理——趣学网</title>
    <link rel="shortcut icon" href="light_favicon@32.ico">
    <link rel="stylesheet" type="text/css" href="common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/leaderManage.css">
</head>

<body>
    <div class="leader_admin">
        <div class="header cf">
            <div class="row">
                <div class="col-md-2 logo_wrap">
                    <div class="logo lf">
                        <a href="index.html"><img src="./images/logo/logo_light.png" class="logoImg"></a>
                    </div>
                    <div class="title lf">
                        <p class="title_text">管理后台</p>
                    </div>
                </div>
                <div class="col-md-6 left_nav lf">
                    <ul class="manage_list">
                        <li class="manage_btn active">
                            <a href="javascript:;">首页</a>
                        </li>
                        <li class="manage_btn">
                            <a href="javascript:;">课程管理</a>
                        </li>
                        <!-- <li class="manage_btn">
                            <a href="javascript:;">装扮空间</a>
                        </li> -->
                        <li class="manage_btn">
                            <a href="javascript:;">交易管理</a>
                        </li>
                        <li class="manage_btn">
                            <a href="javascript:;">账户管理</a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4 right_nav rt">
                    <ul class="status_list">
                        <li class="status_item">
                            <!-- 退出后“用户名”改为“领学者” -->
                            <a href="javascript:;"><span class="username">{{用户名}}</span>,欢迎您！</a>
                        </li>
                        <li class="status_item">
                            <a href="index.html">前台首页</a>
                        </li>
                        <li class="status_item">
                            <a href="index.html">帮助中心</a>
                        </li>
                        <li class="status_item">
                            <a href="index.html">退出</a>
                            <!-- 退出后改为登录 -->
                            <a href="login.html" style="display:none">登录</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="content_wrap">
            <!-- 左侧导航 -->
            <div class="left_nav">
                <!-- 首页 -->
                <ul class="nav_list">
                    <li class="nav_item">
                        <a class="nav_title" href="javascript:;"><i class=""></i>管理指南</a>
                        <ul class="nav_inline">
                            <li class="inline_item">
                                <a href="javascript:;" _link="./leaderAdmin/book.html#kcgl">课程管理</a>
                                <a href="javascript:;" _link="./leaderAdmin/book.html#zbkj">装扮空间</a>
                                <a href="javascript:;" _link="./leaderAdmin/book.html#jygl">交易管理</a>
                                <a href="javascript:;" _link="./leaderAdmin/book.html#zhgl">账户管理</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- 首页/ -->
                <!-- 课程管理 -->
                <ul class="nav_list" style="display:none">
                    <li class="nav_item">
                        <a class="nav_title" href="javascript:;"><i class="">课程管理</i></a>
                        <ul class="nav_inline">
                            <li class="inline_item">
                                <a href="javascript:;" _link="./leaderAdmin/addcourse.html">添加课程</a>
                                <a href="javascript:;" _link="./leaderAdmin/courselist.html">课程列表</a>
                                <a href="javascript:;" _link="./leaderAdmin/verifyTable.html">审核状态</a>
                                <a href="javascript:;" _link="./leaderAdmin">数据统计</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- 课程管理/ -->
                <!-- 装扮空间 -->
                <!-- <ul class="nav_list" style="display:none">
                    <li class="nav_item">
                        <a class="nav_title" href="javascript:;"><i class="">装扮空间</i></a>
                        <ul class="nav_inline">
                            <li class="inline_item">
                                <a href="javascript:;">课程列表</a>
                            </li>
                        </ul>
                    </li>
                </ul> -->
                <!-- 装扮空间/ -->
                <!-- 交易管理 -->
                <ul class="nav_list" style="display:none">
                    <li class="nav_item">
                        <a class="nav_title" href="javascript:;"><i class="">交易管理</i></a>
                        <ul class="nav_inline">
                            <li class="inline_item">
                                <a href="javascript:;" _link="./leaderAdmin/order.html">订单查询</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- 交易管理/ -->
                <!-- 账户管理 -->
                <ul class="nav_list" style="display:none">
                    <li class="nav_item">
                        <a class="nav_title" href="javascript:;"><i class="">个人设置</i></a>
                        <ul class="nav_inline">
                            <li class="inline_item">
                                <a href="javascript:;" _link="./leaderAdmin/personSetting.html">个人信息</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- 账户管理/ -->
            </div>
            <div class="right_main">
                <div class="embed-responsive embed-responsive-16by9 right_content">
                    <iframe id="main" class="embed-responsive-item" src="./leaderAdmin/welcome.html"></iframe>
                </div>
            </div>
            <!-- <div class="right_main">
                <div class="right_content">
                    <iframe id="main" src="./leaderAdmin/welcome.html" frameborder="0" scrolling="yes" name="main"></iframe>
                </div>
            </div> -->
        </div>

        <!-- 底部版权 -->
        <nav class="navbar navbar-fixed-bottom">
            <p class="navbar-text">趣学网版权所有 © 2018-2019 · 陕ICP备2015号-1</p>
        </nav>
    </div>
    <script src="lib/jquery/jquery-3.3.1.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/leaderManage.js"></script>
</body>
</html>