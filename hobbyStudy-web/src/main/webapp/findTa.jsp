<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>茫茫人海只为寻找Ta</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo/light_favicon@32.ico">
	<link rel="stylesheet" type="text/css" href="styles/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="styles/css/reset.css">
    <link rel="stylesheet" href="styles/css/findTa.css">
    <link rel="stylesheet" href="styles/css/findTa-banner.css">
</head>
<body>
	<!--引入公共头部-->
	<%@include file="../common/header.jsp"%>    
    <!-- 推荐领学者轮播 -->
    <div class="lb_gl">
		<div class="container">
                <!-- <h1 class="turn_3d">听听这些老前辈的分享，你会获得信心</h1> -->
				<div class="pictureSlider poster-main">
					<div class="poster-btn poster-prev-btn"></div>
					<ul id="zturn" class="poster-list">
					<c:forEach items="${userFansList}" var="ufs"> 
						<li class="poster-item  zturn-item" >
                            <img src="${ufs.header}">
                            <a href="${pageContext.request.contextPath}/queryPersonDetail?id=${ufs.id}"><div class="findTa-name">${ufs.realname}</div></a>
                            <div class="c|ollege">${ufs.collegeName}</div>
                            <!-- 当登录永和和被点赞者不是同一个userid时 -->
                            <c:choose>
                            	<c:when test="${USER_IN_SESSION != null && USER_IN_SESSION.id !=ufs.id}">
                            		
                            		<div class="login_userid"  style="display: none;">${USER_IN_SESSION.userid}</div>
                            		<div class="user_id"  style="display: none;">${ufs.userid}</div>
                            		<div class="love_num"  onclick="dianzan(1)">
                                		${ufs.likeCount}
                            		</div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="user_id" style="display: none" >${ufs.userid}</div>
                            		<div class="login_userid"  style="display: none;">${USER_IN_SESSION.userid}</div>
                            		<div class="love_num" onclick="dianzan(-1)">
                                		${ufs.likeCount}
                            		</div>
                            	</c:otherwise>
                            </c:choose>
                            <div class="person_label">
                                <span>摄影师</span>
                                <span>喜欢街拍的女孩纸</span>
                            </div>
                            <div class="pi">${ufs.sign} </div>
                        </li>
                        </c:forEach>
					</ul>
				</div>
		</div>
    </div>

    <!-- 选择学校 -->
    <div class="choose_school">
        <div class="school_content cf">
            <div class="rows">
                <div class="label">省份</div>
                <div class="text"><select id="province" name="province"  onchange="show_sub()"></select></div>
            </div>
            <div class="rows">
                <div class="label">城市</div>
                <div class="text"><select id="city" name="city" onchange="show_sub2()"></select></div>
            </div>
            <div class="rows">
                <div class="label">学校</div>
                <div class="text">
                	<select id="school" name="school" selected = "selected"  onchange="show_sub3()"></select>
                </div>
            </div>
        </div>
    </div>
	
    <!-- 搜索列表 -->
    <div class="search-list-wrap">
        <div class="search-list cf">
            <!-- 趣学网领学者推荐 -->
            <div class="school_name"></div>
            <div class="school_team"><img src="./images/iconfont/earth.png">精/英/领/学/者<img src="./images/iconfont/earth.png"></div>
            <ul class="info-list">
               <!-- 动态插入代码 -->
            </ul>
        </div>
        <!-- 页码 -->
    </div>

    <!--底部信息栏开始-->
    <!-- 引入公共底部 -->
	<%@ include file="../common/footer.jsp"%>
	<!--底部信息栏结束-->

    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.1.1.min.js"></script>
    
    <script type="text/javascript">
    $(function() {
    	  //点击轮播图卡片的喜欢
  	    $('.love_num').click(function(e) {
  	    var love_num = parseInt($(this).text());
  	    var userid = $(this).siblings('.user_id').text();  /* 被点赞用户的userid */
  	    var loginUserid = $(this).siblings('.login_userid').text(); /* 登录用户的userid */
  	    alert("love_num：" +love_num + "---" + "userid:" + userid +"---" + "login_userid:" + loginUserid);
  	    console.log(love_num);
  	        // 在这里判断是否登录
  	        if($(this).hasClass('love_red')){
  	            alert(loginUserid);
  	            $(this).removeClass('love_red').addClass('love_num');
  	            $(this).text(love_num -1);
	  	            $.ajax({
	  				url:'${pageContext.request.contextPath}/xunTaLikeCount',
	  			    type:'POST',
	  			    dataType:'json',
	  			    data:{
	  			    	'likeCount':love_num,
	  			    	'userid':userid,
	  			    	'login_userid':loginUserid
	  			    	},
	  			    success:function(data){
	  			    	alert('你好，点赞成功');
	  			    }
	  			});
  	        }else{
  	            $(this).addClass('love_red');
  	            $(this).text(love_num +1);
  	            $.ajax({
	  				url:'${pageContext.request.contextPath}/xunTaLikeCount',
	  			    type:'POST',
	  			    dataType:'json',
	  			  data:{
	  			    	'likeCount':$(this).text(),
	  			    	'userid':userid,
	  			    	'login_userid':loginUserid
	  			    	},
	  			    success:function(resp){
	  			    	alert('点赞成功');
	  			    }
	  			});
  	        }
  	    })
    })
    </script>
    <script type="text/javascript">
	    function dianzan(type,userid){
	    	alert(type);
	    	 if(type==-1){
	    		alert("您还没有登录,请登录！");
	    		 window.location.href='${pageContext.request.contextPath}/login.jsp'
	    	 }
	    	 if(type==1){
	    		alert("点赞成功");
	    	 }
	    } 
    </script>
    <script type="text/javascript">
     //判断用户是否已经收藏
    /* $(function(){
		 var userId = ${(ufs.id)}
 			alert("用户存在，可以收藏");
		if(courseId){
			var url = '${pageContext.request.contextPath}/UserCollections/isCollection';
			doCollect(userId,url);
		}
		//判断是否已经关注教师 
		var followId = ${(courseTeacher.id)};
		if(followId){
			var url = '${s.base}/follow/isFollow.html';
			doFollow(followId,url);
		} 
     });
 	//收藏 
		function doCollect(userId,url){
			if(url == undefined){
				url = '${s.base}/collections/doCollection.html';
			}
			//处理收藏 
			$.ajax({
				url:url,
			    type:'POST',
			    dataType:'json',
			    data:{"courseId":courseId},
			    success:function(resp){
			    	if(resp.errcode == 1){//已收藏 
			    		$('#collectionSpan').attr('class','followed');
			    	}else if(resp.errcode == 0){//未收藏  
			    		$('#collectionSpan').attr('class','following');
			    	}
			    } 
			});
		} */
		
	    
     </script>
    <script type="text/javascript">
    window.onload=function(){
    	// 关注《==》取消关注
		$(".info-list").on("click",".favarite_gz",function(){
			 if($(this).text() == "取消关注"){
		         $(this).text('关注Ta')
		     }else{
		         $(this).text('取消关注')
		     }
		});
		/* Ajax结束 */
    	let events = $("#school").val();
	          $.ajax({
	            	'url':"Test",
	                'data': {                          //数据
	                	schoolName: events
	                },
	                'type': "POST", 				//类型，POST或者GET
	                'dataType': 'json',              //数据返回类型，可以是xml、json等
	                'success': function (data) {     //   成功，回调函数
	                var data2 = eval(data);
	                 $('.info-list').empty();
	                	 for(var i in data2){
		                	/* alert(data2[i].realname);  */
		                	 $('.info-list').append("<li id=li"+i+">" +'<a href="javascript:;" class="profile_photo"><img class="profile_img" src="./images/iconfont/default1.png"></a>'+
		                			 '<a href="javascript:;" class="leader_name">' + data2[i].realname + '<span class="favarite_gz">'+'关注Ta'+'</span>' +'</a>'+
		                			 '<div class="lebel-words"><span>'+data2[i].education+'</span><span>'+data2[i].collegeCode+'</span><span>' +data2[i].title+'</span></div>'+
		                			 '<div class="person_info">'+data2[i].sign+'</div>'+"</li>" );
	                     } 
	                }, 
	                'error': function (er) {          // 失败，回调函数
	                    alert("fail") ;
	                } 
	            	});
       };
       
       function show_sub(){
    	   setTimeout(function() {
    		   let event = $("#school").val();
    		   alert(event);
    	   		 $.ajax({
    	            	'url':"Test",
    	                'data': {                          //数据
    	                	schoolName: event,
    	                },
    	                'type': "POST", 				//类型，POST或者GET
    	                'dataType': 'json',              //数据返回类型，可以是xml、json等
    	                'success': function (data) {     //   成功，回调函数
    	                var data2 = eval(data);
    	                 $('.info-list').empty();
    	                	 for(var i in data2){
    		                /* 	alert(data2[i].realname);  */
    		                	 $('.info-list').append("<li id=li"+i+">" +'<a href="javascript:;" class="profile_photo"><img class="profile_img" src="./images/iconfont/default1.png"></a>'+
    		                			 '<a href="javascript:;" class="leader_name">' + data2[i].realname + '<span class="favarite_gz">'+'关注Ta'+'</span>' +'</a>'+
    		                			 '<div class="lebel-words"><span>'+data2[i].education+'</span><span>'+data2[i].collegeCode+'</span><span>' +data2[i].title+'</span></div>'+
    		                			 '<div class="person_info">'+data2[i].sign+'</div>'+"</li>" );
    	                     } 
    	                }, 
    	                'error': function (er) {          // 失败，回调函数
    	                    alert("fail") ;
    	                } 
    	            	});
    	   }, 1000)
   		
   	}
       function show_sub2(){
    	   setTimeout(function() {
    		   let event = $("#school").val();
    		   alert(event);
    	   		 $.ajax({
    	            	'url':"Test",
    	                'data': {                          //数据
    	                	schoolName: event,
    	                },
    	                'type': "POST", 				//类型，POST或者GET
    	                'dataType': 'json',              //数据返回类型，可以是xml、json等
    	                'success': function (data) {     //   成功，回调函数
    	                var data2 = eval(data);
    	                 $('.info-list').empty();
    	                	 for(var i in data2){
    		                	/* alert(data2[i].realname);  */
    		                	 $('.info-list').append("<li id=li"+i+">" +'<a href="javascript:;" class="profile_photo"><img class="profile_img" src="./images/iconfont/default1.png"></a>'+
    		                			 '<a href="javascript:;" class="leader_name">' + data2[i].realname + '<span class="favarite_gz">'+'关注Ta'+'</span>' +'</a>'+
    		                			 '<div class="lebel-words"><span>'+data2[i].education+'</span><span>'+data2[i].collegeCode+'</span><span>' +data2[i].title+'</span></div>'+
    		                			 '<div class="person_info">'+data2[i].sign+'</div>'+"</li>" );
    	                     } 
    	                }, 
    	                'error': function (er) {          // 失败，回调函数
    	                    alert("fail") ;
    	                } 
    	            	});
    				  
    	   }, 1000)
   	}
       function show_sub3(){
    	   setTimeout(function() {
    		   let event = $("#school").val();
    		   alert(event);
    	   		 $.ajax({
    	            	'url':"Test",
    	                'data': {                          //数据
    	                	schoolName: event,
    	                },
    	                'type': "POST", 				//类型，POST或者GET
    	                'dataType': 'json',              //数据返回类型，可以是xml、json等
    	                'success': function (data) {     //   成功，回调函数
    	                var data2 = eval(data);
    	                 $('.info-list').empty();
    	                	 for(var i in data2){
    		                	/* alert(data2[i].realname);  */
    		                	 $('.info-list').append("<li id=li"+i+">" +'<a href="javascript:;" class="profile_photo"><img class="profile_img" src="./images/iconfont/default1.png"></a>'+
    		                			 '<a href="javascript:;" class="leader_name">' + data2[i].realname + '<span class="favarite_gz">'+'关注Ta'+'</span>' +'</a>'+
    		                			 '<div class="lebel-words"><span>'+data2[i].education+'</span><span>'+data2[i].collegeCode+'</span><span>' +data2[i].title+'</span></div>'+
    		                			 '<div class="person_info">'+data2[i].sign+'</div>'+"</li>" );
    	                     } 
    	                }, 
    	                'error': function (er) {          // 失败，回调函数
    	                    alert("fail") ;
    	                } 
    	            	});
    	   }, 1000)
   	}
    </script>
    <script src="script/findTa.js"></script>
    <script src="script/model/school.js"></script>
    <script src="script/model/findTa-banner.js"></script>
</body>
</html>