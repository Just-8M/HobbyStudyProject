<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>header</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/reset.css">
    <style type="text/css">
        .common_header{ 
            height: 80px;
            line-height: 80px;
            background:	#2e323e;
            box-shadow: 0 0 10px #737373;
        }
        .common_header .header_content{
            width: 1210px;
            margin: 0 auto;
        }
        .common_header .logo{
            float: left;
            width: 150px;
            height: 80px;
            margin-right: 20px;
            background: url('${pageContext.request.contextPath}/images/logo/logo_white.png') no-repeat left center;
            background-size: 100%;
        }
        .common_header .leftnav{
            width: 600px;
            height: 80px;
            float: left;
        }
        .common_header .leftnav ul li {
            width: 100px;
            text-align: center;
            margin-left: 10px;
            float: left;
        }
        .common_header .leftnav ul li.active a{
            color: #FFD700;
        }
        .common_header .leftnav ul li a{
            color:#fff;
            font-size: 18px;
        }
        .common_header .leftnav ul li a:hover{
            color: #FFD700;
        }
        .common_header .rightnav{
            float: right;
        }
        .common_header .rightnav li{
            width: 130px;
            float: left;
            margin-left: 30px;
        }
        .common_header .rightnav li a{
            color:#fff;
            font-size: 16px;
        }
        .common_header .rightnav li a:hover{
            color:#FFD700;
        }
        .common_header .rightnav li:first-child a{
            border: 1px solid #969696;
            padding:  10px 25px 10px 50px;
            border-radius: 25px;
            background: url('${pageContext.request.contextPath}/images/iconfont/shopcart_white.png') no-repeat 15px center;
            background-size: 20%;
        }
        .common_header .rightnav li:first-child a:hover{
            border:1px solid #FFD700;
            background: url('${pageContext.request.contextPath}/images/iconfont/carthover.png') no-repeat 15px center;
            background-size: 20%;
        }
        .common_header .rightnav li span.num {
            display: block;
            width: 20px;
            height: 20px;
            text-align: center;
            line-height: 20px;
            border-radius: 25px;
            background: #EE2C2C;
            vertical-align: middle;
            position: absolute;
            margin: -60px 30px;
        }
        .common_header .rightnav li:nth-child(2) a{
            padding: 0 10px;
        }
        .common_header .shopcart {
        z-index: 99;
        display: none;
        width: 300px;
        height: 350px;
        background: #fff;
        position: absolute;
        margin-top: 80px;
        margin-left: 740px;
        z-index: 99;
        border-radius: 0 0 8px 8px;
        padding: 5px 10px;
        }
        .common_header .shopcart .mycart {
        height: 40px;
        line-height: 40px;
        border-bottom: 1px solid #969696;
        }
        .common_header .shopcart .mycart .headline {
        font-size: 16px;
        font-weight: bold;
        }
        .common_header .shopcart .mycart .cartnum {
        float: right;
        color: #424242;
        }
        .common_header .shopcart .nocontent {
        /* display: none; */
        text-align: center;
        height: 180px;
        background: url('${pageContext.request.contextPath}/images/tipIco/min_light.jpg') no-repeat center;
        background-size: 100%;
        padding-top: 30px;
        }
        .common_header .shopcart .nocontent p {
        font-size: 16px;
        margin-top: 110px;
        }
        .common_header .shopcart .nocontent p:nth-child(2) {
        font-size: 14px;
        margin-top: -50px;
        }
        .common_header .shopcart .nocontent a {
        color: #E5224C;
        display: block;
        margin-top: -50px;
        }
        .common_header .shopcart .cartlist {
        display: none;
        margin-top: 5px;
        height: 270px;
        overflow-y: scroll;
        }
        .common_header .shopcart .cartlist ul li {
        width: 100%;
        height: 80px;
        margin-bottom: 10px;
        }
        .common_header .shopcart .cartlist ul li img {
        width: 80px;
        height: 60px;
        }
        .common_header .shopcart .cartlist ul li .courseinfo {
        width: 170px;
        float: right;
        padding-right: 10px;
        }
        .common_header .shopcart .cartlist ul li .courseinfo a:hover {
        color: #424242;
        }
        .common_header .shopcart .cartlist ul li .courseinfo  .coursename {
            width: 170px;
            height: auto;
            line-height: 25px;
            display: block;
            vertical-align: middle;
            font-size: 16px;
            max-height: 55px;
            overflow: hidden;
        }
        .common_header .shopcart .cartlist ul li .courseinfo .price {
        color: red;
        width: 50px;
        height: 30px;
        float: left;
        margin-top: -30px;
        }
        .common_header .shopcart .cartlist ul li .courseinfo .delete {
        cursor: pointer;
        float: right;
        color: red;
        height: 30px;
        margin-top: -30px;
        }
        .common_header .shopcart .cartlist ul li:hover {
        background: #FFFACD;
        }
    </style>
</head>
<body>
    <div class="common_header cf">
        <div class="header_content">
            <a href="${pageContext.request.contextPath}/getIndexPage">
                <div class="logo"></div>
            </a> 
            <div class="leftnav cf">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/recommendIndex">推荐看点</a></li>
                    <li><a href="${pageContext.request.contextPath}/communityCourse?type=0">精彩社区</a></li>
                    <li><a href="${pageContext.request.contextPath}/offline.jsp">XX学院</a></li>
                    <li><a href="${pageContext.request.contextPath}/queryTaBySort">XX寻Ta</a></li>
                </ul>
            </div>
            <div class="rightnav cf">
                <ul>
                    <li><a href="javascript:;">购物车</a><span class="num">0</span></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/login.jsp">登录</a>/
                        <a href="${pageContext.request.contextPath}/register.jsp">注册</a>
                    </li>
                </ul>
            </div>
            <div class="shopcart">
                <div class="mycart">
                    <span class="headline">我的购物车</span>
                    <span class="cartnum">已加入<i class="total">0</i>门课程</span>
                </div>
                <div class="nocontent">
                    <p>购物车空空如也</p>
                    <p>快去这里找到你中意的课程吧</p>
                    <a href="hobby.html">全部课程</a>
                </div>
                <div class="cartlist">
                    <ul>
                        <li>
                            <img src="${pageContext.request.contextPath}/images/logo/black_logo_light.png">
                            <div class="courseinfo">
                                <a href="javascript:;" class="coursename">课程名课程名课程名课程名课程名课程名课程程名课程名</a>
                                <span class='price'>￥ 29.9</span>
                                <span class="delete">删除</span>
                            </div>
                        </li>
                        <li>
                            <img src="${pageContext.request.contextPath}/images/logo/black_logo_light.png">
                            <div class="courseinfo">
                                <a href="javascript:;" class="coursename">课程名</a>
                                <span class='price'>￥ 29.9</span>
                                <span class="delete">删除</span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/script/bootstrap/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    //购物车数量
    if( $('.cartlist').css('display') == 'block'){
        var cartnum = $('.cartlist ul li').length;
        $('.shopcart').find('.total').text(cartnum);
    }else{
        $('.shopcart').find('.total').text('0');
    }

    //鼠标滑动至购物车显示对应的框
    $('.rightnav ul li:nth-child(1)').hover(function(){
        $('.shopcart').css('display','block')
    })
    $('.shopcart').mouseleave(function(){
        $(this).css('display','none')
    })
   

    //点击删除课程
    $('.delete').click(function() {
        $(this).closest('li').remove();
        var cartnum = $('.cartlist ul li').length;
        $('.shopcart').find('.total').text(cartnum);
        if(cartnum == 0){
            $('.cartlist').css('display','none');
            $('.nocontent').css('display','block');
        }
    })
    </script>
</body>
</html>