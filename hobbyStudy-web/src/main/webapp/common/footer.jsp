<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>footer</title>
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/styles/css/reset.css">
    <style type="text/css">
    /*底部信息栏*/
        footer {
        width: 100%;
        height: 80px;
        background: #000;
        position: absolute;
      /*   bottom: 0;  */
        left:0;
        box-shadow: 0 0px 7px #666666;
        }
        footer .footer_link{
            padding: 15px 30px 5px 70px;
            width: 730px;
            height: 60px;
        }
        footer .footer_link ul li {
        float: left;
        width: 100px;
        }
        footer .footer_link ul li a {
        font-size: 14px;
         color: #fff;
        }
        footer .copyright {
        line-height: 30px;
        margin-top: 10px;
        }
        footer .app {
        float: right;
        width: 370px;
        }
        footer .app span {
            display: block;
            color: #fff;
            margin-top: -40px;
        }
        footer .app img {
        height: 70px;
        position: absolute;
        margin-top: -62px;
        padding-left: 110px;
        }
    </style>
</head>
<body>
    <!--底部信息栏开始-->
	<footer>
        <div class="footer_link">
            <ul>
                <li><a href="javascript:;">商务合作</a></li>
                <li><a href="javascript:;">关于我们</a></li>
                <li><a href="javascript:;">领学者招募</a></li>
                <li><a href="javascript:;">帮助中心</a></li>
                <li><a href="javascript:;">意见反馈</a></li>
                <li><a href="javascript:;">联系我们</a></li>
            </ul>
            <br>
            <span class="copyright">Copyright © 2018 hobby.com All Rights Reserved | 京ICP备 20190701号-01</span>    
        </div>
        <div class="app">
            <span>趣学网App正在孵化...<br>敬请期待趣儿诞生</span>
            <img src="${pageContext.request.contextPath}/images/logo/logo_light_gray.png">
        </div>        
    </footer>
    <!--底部信息栏结束-->
</body>
</html>