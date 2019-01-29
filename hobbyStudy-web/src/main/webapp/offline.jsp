<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>线下实训-趣学网学院</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo/light_favicon@32.ico" type="image/x-icon">
    <link rel="stylesheet" href="styles/css/reset.css">
    <link rel="stylesheet" href="styles/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="styles/css/offline.css">
    <!-- 视频背景 -->
    <link rel="stylesheet" href="lib/css/jquery.vidbacking.css">
    <link rel="stylesheet" href="lib/css/bgvideo.css">
</head>
<body>
    <!--引入公共头部-->
	<%@include file="../common/header.jsp"%>   
    <!-- 视频背景 -->
    <div class="jq22-container">	
		<div class="video-back">
	        <video poster="" autoplay muted loop class="vidbacking">
	            <source src="http://v.tiaooo.com/tiaooo-pc-1.mp4" type="video/mp4">
            </video>
            <div class="jq22-demo center">
                <h1>兴趣也可以是职业</h1>
                <h3>我的自信来自于每一分每一秒的学习</h3>
                <p>面对面快速提升实战技能</p>
		    </div>
	    </div>
    </div>
    
    <div class="location cf" data-toggle="distpicker">
        <!--定义省市区三级级联-->
        <div class="province_select lf">
            <select class="form-control" id="eprovinceName" data-province="---- 选择省 ----" name="provinceName"></select>
        </div>
        <div class="city_select lf">
            <select class="form-control" id="ecityName" data-city="---- 选择市 ----" name="cityName"></select>
        </div>
        <div class="district_select lf">
            <select class="form-control" id="edistrictName"   data-district="---- 选择区 ----" name="districtName"></select>
        </div>
    </div>

    <!-- 当前城区没有学院时 -->
    <div class="no_offline">
        <h4>抱歉，当前区域未找到相关学院，请小主移步附近区域看看</h4>
    </div>

    <!-- 当有内容时 -->
    <div class="offline_list cf">
        <ul class="offline_item_wrap">
           <!-- 动态插入li元素下及其他元素 -->
        </ul>
    </div>
    <h1 style="text-align:center">分页
    	<a href="${pageContext.request.contextPath}/common/404.jsp">back</a>
    
    </h1>

    <!--回到顶部-->
    <a href="javascript:;" class="backtop" title="回到顶部" id="backtop"></a>

    <!--底部信息栏开始-->
	<%@ include file="../common/footer.jsp"%>
	<!--底部信息栏结束-->
    <script src="script/bootstrap/jquery-3.2.1.min.js"></script>
    <script src="script/bootstrap/bootstrap.min.js"></script>
    <!-- 城市选择三级联动 -->
    <script type="text/javascript"  src="plugins/js/distpicker.min.js"></script>
    <!-- 视频背景 -->
    <script src="lib/js/jquery.vidbacking.js"></script>

    <script type="text/javascript">
        $(function(){
            $('.video-back').vidbacking();
            $('#edistrictName').change(function() {
            var district=$(this).val();
            if (district == null || district == "" ) {
					
			}else{
				alert(district);
				 $.ajax({
	 	               /*  url: "${pageContext.request.contextPath}/areaSelectCourse?district=" + district,  */       //后台url
	 	                url: "${pageContext.request.contextPath}/areaSelectCourse",        //后台url
	 	                data: {                          //数据
		                	district : district,
		                }, 
	 	                type: "POST",                   //类型，POST或者GET
	 	                dataType: 'json',              //数据返回类型，可以是xml、json等
	 	                success: function (data) {      //成功，回调函数
	 	                	if (data == '' || data == null) {
	 	                		$('.offline_item_wrap').empty();
								$('.no_offline').css('display','block');
							}else {
			 	              $('.no_offline').css('display','none');
			 	              var data2 = eval(data);
							    $('.offline_item_wrap').empty();			 	            
			 	                 for(var i in data2){
			 	                	/* alert(data2[i].id); */
			 	                	 $('.offline_item_wrap').append("<li class='offline_item' id=li"+i+">" +'<div class="item_top"><a href=${pageContext.request.contextPath}/queryInstitutionDetail?id='+data2[i].id +' class="to_offline_intro"><img class="item_img" src="./images/findTa-banner/pexels-photo-1401796.jpeg"></a></div>'+
				                			 '<div class="item_bottom"> <div class="offline_course_name"><a href="javascript:;">' + data2[i].courseName + '</a></div>'+
				                			 '<div class="institution">' + data2[i].institutionName + '</div>'+
				                			 '<div class="course_intro">' + data2[i].courseIntro + '</div>'+
				                			 '<div class="item_label"> <ul class="type_list"><li class="type_item">'+data2[i].type+'</li><li class="type_item">'+data2[i].level+'</li></ul></div>'+
				                			 '</div>'+"</li>" );
			 	                 };
							}
	 	                },
	 	                error: function (er) {          //失败，回调函数
	 	                    alert('fail');
	 	                }
	 	            });
			}
         })
        });

    </script>
</body>
</html>