<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${institution.institutionName}|趣学网学院</title>
    <link rel="shortcut icon" href="light_favicon@32.ico" type="image/x-icon">
    <link rel="stylesheet" href="styles/css/reset.css">
    <link rel="stylesheet" href="styles/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="styles/css/offline_subject.css">
</head>
<body>
	<!--引入公共头部-->
	<%@include file="../common/header.jsp"%>    
    <section class="banner">
        <img class="banner_img" src="http://y.photo.qq.com/img?s=zCmc131Wx&l=y.jpg" >
        <div class="banner_bottom">
            <div class="crumbs">
                <ul class="crumbs_wrap">
                    <li>
                        <a href="offline">趣学网学院</a>
                        <span class="glyphicon glyphicon-menu-right"></span>
                    </li>
                    <li>${institution.courseName}</li>
                </ul>
            </div>
        </div>
    </section>

    <section class="container">
        <aside class="left_aside" id="left_aside">
            <ul class=" nav_left_list"  role="tablist">
                <li  class="nav_item">
                    <a href="#course_schedule" >开课安排</a>
                </li>
                <li>
                    <a class="course_intro" href="javascript:;">课程介绍</a>
                    <ul class="sub-list">
                        <li><a href="#course_intro">课程简介</a></li>
                        <li><a href="#teach_display">教学展示</a></li>
                        <li><a href="#teacher_intro">导师介绍</a></li>
                    </ul>
                </li>
                <li class="nav_item">
                    <a href="#course_setting">课程设置</a>
                </li>
                <li class="nav_item">
                    <a href="#consult">报名咨询</a>
                </li>
            </ul>
        </aside>
        <div class="right_content">
            <div class="right_item_module" id="course_schedule">
                <h1>开课安排</h1>
                <div class="item_box schedule">
                    <ul class="registration-list cf">
                        <li>
                            <!-- 第几期开课 -->
                            <span>${institution.periods}</span>
                            <!-- 开课时间 -->
                            <span>
                            <fmt:formatDate value="${institution.timespanStart}" pattern="yyyy-MM-dd"/>
                            --
                            <fmt:formatDate value="${institution.timespanEnd}" pattern="yyyy-MM-dd"/>
                            </span>
                            <!-- 招生人数 -->
                            <span>招生<i>${institution.peopleNum}</i>人</span>
                        </li>
                       <!--  <li>
                            第几期开课
                            <span>第2期</span>
                            开课时间
                            <span>2019年1月5日-2019年1月31日</span>
                            招生人数
                            <span>招生<i>{{num}}</i>人</span>
                        </li>
                        <li>
                            第几期开课
                            <span>第3期</span>
                            开课时间
                            <span>2019年1月5日-2019年1月31日</span>
                            招生人数
                            <span>招生<i>{{num}}</i>人</span>
                        </li> -->
                    </ul>
                </div>
            </div>
            <div class="right_item_module" id="course_intro">
                <h1>课程简介</h1>
                <div class="item_box">
                    <p class="public-text">${institution.courseIntro}</p>
                </div>
            </div>
            <div class="right_item_module" id="teach_display">
                <h1>教学展示</h1>
                <div class="item_box">
                    <video src="https://qiniu-xpc0.xpccdn.com/5c1714f36c09d.mp4" controls></video>
                </div>
            </div>
            <div class="right_item_module" id="teacher_intro">
                <h1>导师介绍</h1>
                <div class="item_box">
                  
                     <img src="${institution.teacherIntro}">
                </div>
            </div>
            <div class="right_item_module" id="course_setting">
                <h1>课程设置</h1>
                <div class="item_box">
                <img src=" ${institution.courseOutline}">
                    
                    
                </div>
            </div>
            <div class="right_item_module" id="consult">
                <h1>报名咨询</h1>
                <div class="item_box">
                    <P>联系电话： ${institution.telePhone}</P>
                   <P>地址： ${institution.institutionaddress}</P>
                </div>
            </div>
        </div>
    </section>
	<!-- 回到顶部 -->
	<a href="javascript:;" class="backtop" title="回到顶部" id="backtop"></a>

   <!-- 引入公共底部 -->
	<%@ include file="../common/footer.jsp"%>
	<!--底部信息栏结束-->
    <script src="script/bootstrap/jquery-3.2.1.min.js"></script>
    <script src="script/bootstrap/bootstrap.min.js"></script>
    <script src="script/back_top.js"></script>
    <script type="text/javascript">
        $(function() {
            $('.nav_left_list li:nth-child(2) .course_intro').click(function() {
                $('.sub-list').toggle();
            })

            $('.sub-list li a').click(function() {
                $('.nav_left_list li.nav_item').removeClass('active');
                $(this).parent().addClass('clicked').siblings().removeClass('clicked');
            })

            $('.nav_left_list li.nav_item a').click(function() {
                $(this).parent().addClass('active').siblings().removeClass('active');
                $('.sub-list li').removeClass('clicked');
            })
            
            var winH = $(window).height();//页面的高度
            var timer = null;
            var isTop = true;
            $(window).on("scroll",function(){
                clearTimeout(timer);
                scrollTop = $(window).scrollTop();//滚动条距离顶部的距离
                if(scrollTop > 580){
                    scrollTop =  scrollTop;
                }else{
                    scrollTop = 560;
                }

                if(winH > scrollTop){
                    $('#left_aside').removeClass('nav_fix').addClass('left_aside');
                }else{
                    $('#left_aside').removeClass('left_aside').addClass('nav_fix');
                }
                
                if (!isTop) {
                    clearInterval(timer);
                }
                isTop = false;
            })
        })
    </script>
</body>
</html>
