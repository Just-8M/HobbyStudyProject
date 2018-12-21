<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>专属你的舞台——精彩社区</title>
    <link rel="shortcut icon" href="light_favicon@32.ico" type="image/x-icon">
    <link rel="stylesheet" href="styles/css/reset.css">
    <link rel="stylesheet" href="styles/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="styles/css/community.css">
</head>
<body>
	
    <!--引入公共头部-->
	<%@include file="../common/header.jsp"%>   
    <section class="container">
        <!-- 发布作品 -->
        <section class="rank_wrap">
            <div class="rank_left left">
                <span class="active">精选</span>
                <span>最热</span>
                <span>最新</span>
            </div>
            <div class="publish_btn right">
                <button>发布作品</button>
            </div>
        </section>

        <!-- 作品排行 -->
        <section class="works_wrap cf"> 
            <ul class="works_list">
                <li class="work_item">
                    <a href="video.html">
                        <img class="work_item_img" src="./images/findTa-banner/pexels-photo-1401796.jpeg" >
                        <div class="work_item_info">
                            <span class="work_item_name">{{视频名字长度超出则隐藏显示...}}</span>
                        </div>
                        <!-- 鼠标移入显示视频介绍 -->
                        <div class="work_item_img_hover">
                            <span class="work_item_intro">{{视频介绍}}</span>
                        </div>
                    </a>
                    <span class="work_item_time">2018-12-18 18:21</span>
                    <div class="work_user">
                         <a href="leader.html">
                            <img class="work_user_profile" src="./images/findTa-banner/pexels-photo-1262357.jpeg">
                            <span class="user_name">{{用户名}}</span>
                        </a>
                    </div> 
                </li>
                <li class="work_item">
                    <a href="video.html">
                        <img class="work_item_img" src="./images/findTa-banner/pexels-photo-1401796.jpeg" >
                        <div class="work_item_info">
                            <span class="work_item_name">{{视频名字长度超出则隐藏显示...}}</span>
                        </div>
                        <!-- 鼠标移入显示视频介绍 -->
                        <div class="work_item_img_hover">
                            <span class="work_item_intro">{{视频介绍}}</span>
                        </div>
                    </a>
                    <span class="work_item_time">2018-12-18 18:21</span>
                    <div class="work_user">
                            <a href="leader.html">
                            <img class="work_user_profile" src="./images/findTa-banner/pexels-photo-1262357.jpeg">
                            <span class="user_name">{{用户名}}</span>
                        </a>
                    </div> 
                </li>
                <li class="work_item">
                    <a href="video.html">
                        <img class="work_item_img" src="./images/findTa-banner/pexels-photo-1401796.jpeg" >
                        <div class="work_item_info">
                            <span class="work_item_name">{{视频名字长度超出则隐藏显示...}}</span>
                        </div>
                        <!-- 鼠标移入显示视频介绍 -->
                        <div class="work_item_img_hover">
                            <span class="work_item_intro">{{视频介绍}}</span>
                        </div>
                    </a>
                    <span class="work_item_time">2018-12-18 18:21</span>
                    <div class="work_user">
                            <a href="leader.html">
                            <img class="work_user_profile" src="./images/findTa-banner/pexels-photo-1262357.jpeg">
                            <span class="user_name">{{用户名}}</span>
                        </a>
                    </div> 
                </li>
                <li class="work_item">
                    <a href="video.html">
                        <img class="work_item_img" src="./images/findTa-banner/pexels-photo-1401796.jpeg" >
                        <div class="work_item_info">
                            <span class="work_item_name">{{视频名字长度超出则隐藏显示...}}</span>
                        </div>
                        <!-- 鼠标移入显示视频介绍 -->
                        <div class="work_item_img_hover">
                            <span class="work_item_intro">{{视频介绍}}</span>
                        </div>
                    </a>
                    <span class="work_item_time">2018-12-18 18:21</span>
                    <div class="work_user">
                            <a href="leader.html">
                            <img class="work_user_profile" src="./images/findTa-banner/pexels-photo-1262357.jpeg">
                            <span class="user_name">{{用户名}}</span>
                        </a>
                    </div> 
                </li>
                <li class="work_item">
                    <a href="video.html">
                        <img class="work_item_img" src="./images/findTa-banner/pexels-photo-1401796.jpeg" >
                        <div class="work_item_info">
                            <span class="work_item_name">{{视频名字长度超出则隐藏显示...}}</span>
                        </div>
                        <!-- 鼠标移入显示视频介绍 -->
                        <div class="work_item_img_hover">
                            <span class="work_item_intro">{{视频介绍}}</span>
                        </div>
                    </a>
                    <span class="work_item_time">2018-12-18 18:21</span>
                    <div class="work_user">
                            <a href="leader.html">
                            <img class="work_user_profile" src="./images/findTa-banner/pexels-photo-1262357.jpeg">
                            <span class="user_name">{{用户名}}</span>
                        </a>
                    </div> 
                </li>
                <li class="work_item">
                    <a href="video.html">
                        <img class="work_item_img" src="./images/findTa-banner/pexels-photo-1401796.jpeg" >
                        <div class="work_item_info">
                            <span class="work_item_name">{{视频名字长度超出则隐藏显示...}}</span>
                        </div>
                        <!-- 鼠标移入显示视频介绍 默认隐藏-->
                        <div class="work_item_img_hover">
                            <span class="work_item_intro">{{视频介绍}}</span>
                        </div>
                    </a>
                    <span class="work_item_time">2018-12-18 18:21</span>
                    <div class="work_user">
                            <a href="leader.html">
                            <img class="work_user_profile" src="./images/findTa-banner/pexels-photo-1262357.jpeg">
                            <span class="user_name">{{用户名}}</span>
                        </a>
                    </div> 
                </li>
                <li class="work_item">
                        <a href="video.html">
                            <img class="work_item_img" src="./images/findTa-banner/pexels-photo-1401796.jpeg" >
                            <div class="work_item_info">
                                <span class="work_item_name">{{视频名字长度超出则隐藏显示...}}</span>
                            </div>
                            <!-- 鼠标移入显示视频介绍 -->
                            <div class="work_item_img_hover">
                                <span class="work_item_intro">{{视频介绍}}</span>
                            </div>
                        </a>
                        <span class="work_item_time">2018-12-18 18:21</span>
                        <div class="work_user">
                                <a href="leader.html">
                                <img class="work_user_profile" src="./images/findTa-banner/pexels-photo-1262357.jpeg">
                                <span class="user_name">{{用户名}}</span>
                            </a>
                        </div> 
                    </li>
                    <li class="work_item">
                        <a href="video.html">
                            <img class="work_item_img" src="./images/findTa-banner/pexels-photo-1401796.jpeg" >
                            <div class="work_item_info">
                                <span class="work_item_name">{{视频名字长度超出则隐藏显示...}}</span>
                            </div>
                            <!-- 鼠标移入显示视频介绍 -->
                            <div class="work_item_img_hover">
                                <span class="work_item_intro">{{视频介绍}}</span>
                            </div>
                        </a>
                        <span class="work_item_time">2018-12-18 18:21</span>
                        <div class="work_user">
                                <a href="leader.html">
                                <img class="work_user_profile" src="./images/findTa-banner/pexels-photo-1262357.jpeg">
                                <span class="user_name">{{用户名}}</span>
                            </a>
                        </div> 
                    </li>
                    <li class="work_item">
                        <a href="video.html">
                            <img class="work_item_img" src="./images/findTa-banner/pexels-photo-1401796.jpeg" >
                            <div class="work_item_info">
                                <span class="work_item_name">{{视频名字长度超出则隐藏显示...}}</span>
                            </div>
                            <!-- 鼠标移入显示视频介绍 默认隐藏-->
                            <div class="work_item_img_hover">
                                <span class="work_item_intro">{{视频介绍}}</span>
                            </div>
                        </a>
                        <span class="work_item_time">2018-12-18 18:21</span>
                        <div class="work_user">
                                <a href="leader.html">
                                <img class="work_user_profile" src="./images/findTa-banner/pexels-photo-1262357.jpeg">
                                <span class="user_name">{{用户名}}</span>
                            </a>
                        </div> 
                    </li>
            </ul>
        </section>

        <!-- 分页 -->
        <h1 class="page" style="text-align:center">分页</h1>
    </section>

    <!--回到顶部-->
    <a href="javascript:;" class="backtop" title="回到顶部" id="backtop"></a>
   <!--底部信息栏开始-->
	<%@ include file="../common/footer.jsp"%>
	<!-- 底部信息结束 -->
    <script src="script/bootstrap/jquery-3.2.1.min.js"></script>
    <!-- 回到顶部 -->
    <script src="script/back_top.js"></script>
    <script type="text/javascript">
        // 点击排序切换样式
        $('.rank_left span').click(function() {
            $(this).addClass('active').siblings().removeClass('active');
        })
        // 鼠标划过视频缩略图显示视频介绍
        $('.work_item .work_item_img').mouseenter(function() {
            $(this).siblings('.work_item_img_hover').css('display','block');
        })
        $('.work_item_img_hover').mouseleave(function() {
            $(this).css('display','none');
        })
    </script>
</body>
</html>