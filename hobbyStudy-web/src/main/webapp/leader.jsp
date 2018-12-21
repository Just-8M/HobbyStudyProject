<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${personDetail.realname}的主页</title>
    <link rel="shortcut icon" href="light_favicon@32.ico" type="image/x-icon">
    <link rel="stylesheet" href="styles/css/reset.css">
    <link rel="stylesheet" href="styles/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="styles/css/leader.css">
    <!-- emoji表情 -->
    <link rel="stylesheet" href="lib/css/jquery.mCustomScrollbar.min.css"/>
    <link rel="stylesheet" href="dist/css/jquery.emoji.css"/>
    <link rel="stylesheet" href="lib/css/railscasts.css"/>
     <!-- 社会化分享 -->
    <link rel="stylesheet" href="lib/css/share.css">
</head>
<body>
<!--引入公共头部-->
	<%@include file="../common/header.jsp"%>    
	<span class="imgurl" style="display: none">http://y.photo.qq.com/img?s=hvm43XuUI&l=y.jpg</span>
    <!-- <button id="btn" class="btn">更换背景</button> -->
    <div class="homepage_wrap">
    <!-- 更换背景图片地址 -->
        <div class="homepage_content">
            <div class="homepage_info">
                <!-- 头像 -->
                <img class="homepage_profile_photo" src="${personDetail.header}">
                <!-- 姓名 -->
                <div class="homepage_leader_name">${personDetail.realname}</div>
                <!-- username -->
                <div class="homepage_leader_username" style="display: none;">${personDetail.username}</div>> 
                
                <!-- 标签，说明精通哪个领域 2-30个字-->
                <div class="homepage_label_words">
               ${personDetail.title}
                </div>
                <!-- 关注 -->
                <div class="btns cf">
                    <span class="favorite_btn">关注Ta</span>
                    <span class="chat_sx">私信</span>
                    <span class="tip-off">投诉Ta</span>
                </div>
               
                <!-- 简介 -->
                <div class="simple_introduction">
                 ${personDetail.sign}
                </div>

                <!-- 粉丝数 -->
                <div class="fan_num">
                    <span class="num"> ${personDetail.fans}</span>
                    <span>粉丝</span>
                </div>
            </div>
            <div class="bottom-photo"></div>
        </div>
    </div>

    <!-- 课程/动态 -->
    <div class="homepage_tablist_wrap cf">
            <div class="homepage_tab_content">
                <!-- 左侧导航标签 -->
                <div class="tab_content_left">
                    <ul>
                        <li class="active"><a href="javascript:;">动态</a></li>
                        <li><a href="javascript:;"  id ="person_course";>课程</a></li>
                        <!-- <li><a href="javascript:;"></a></li>
                        <li><a href="javascript:;"></a></li>
                        <li><a href="javascript:;"></a></li> -->
                    </ul>
                </div>
                <!-- 右侧导航标签 -->
                <div class="tab_content_right">
                    <!-- 动态 -->
                    <div class="user_homepage_moments">
                        <!-- 发布动态输入框 -->
                        <div class="publish_wrap">
                            <div id="editor" contenteditable="true" class="publish_input_content"></div>
                            <!-- <textarea class="publish__input_content"></textarea> -->
                            <div class="publish_btn cf" >
                                <input type="image" class="emoji_btn" src="./images/iconfont/emoji.png">
                                <div class="video_btn"></div>
                                <div class="img_btn">
                                    <input type="file" name="onload_photo" class="input_file_photo" id="photo_file" accept="image/*"  multiple>
                                </div>
                                <input type="submit" value="发布">
                            </div> 
                        </div>
                        <!-- 上传视频的选择文件框 -->
                        <div class="video_file_wrap">
                                <div class="upload_way">
                                    <a class="local_way active" href="javascript:;">
                                        本地上传
                                    </a>
                                    <a class="url_way" href="javascript:;">
                                        添加视频地址
                                    </a>
                                    <span class="close"></span>
                                </div>
                                <div class="local_choose">
                                    <div class="onload_video_btn">从本地选择视频<input type="file" class="input_file_video" id="video_file" accept="video/*"></div>    
                                </div>
                                <form class="url_content" method="get">
                                    <input type="url"  class="input_url" >
                                    <input type="submit" value="确认" name="user_url">
                                </form>
                        </div>
                        <!-- 存放视频框 -->
                        <div class="store_video" id="store_video">
                            <!-- <video src="" class="video_src"></video> -->
                            <span class="del"></span>
                        </div>

                        <!-- 存放展示选择照片 -->
                        <div id="photo_onload" class="cf"> 
                            <!-- 
                                选择照片后动态添加展示
                                <div class="onload_photo_box">
                                    <img>
                                    <span class="delete"></span>
                                </div> 
                            -->
                            <div class="photo_num">图片(<sapn class="file_num">0</sapn>/9) <span class="warn_max">最多还能选择<i class="maxlen"></i>张图片</span></div>
                        </div>

                        <!-- 当没有动态时 -->
                        <div class="no_moments" style="display:none">
                            <img src="./images/tipIco/min_light.jpg">
                            <span>您还没有发布任何动态</span>
                        </div>

                        <!-- 当有动态时 -->
                        <ul class="moments_list">
                            <li>
                                <!-- 左边头像，用户名和时间 -->
                                <div class="profile_time_wrap cf">
                                    <img src="./images/iconfont/default1.png">
                                    <div class="username_time_wrap">
                                        <div class="username">
                                           ${personDetail.username}
                                        </div>
                                        <div class="time">
                                            <span class="y-m-d">2018-12-07</span> 
                                            <span class="o_clock">10:48</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- 右边的收藏和举报 -->
                                <div class="collect_jb_wrap cf">
                                    <div class="collect_btn">收藏</div>
                                    <div class="tip-off">举报</div>
                                </div>
                                <!-- 获取用户发表的文字 -->
                                <div class="txt_box">
                                    很想告诫你们：<br>
                                    若有朝一日你动了情<br>
                                    千万要先守住秘密<br>
                                    在没有搞清对方底细之前<br>
                                    不要交出真心<br>
                                    吃不到的醋最酸<br>
                                    先动情的人最惨.<br>
                                    ———《你就不要想起我》
                                </div>
                                <span class="see_all">查看全部</span>
                                <!-- 照片 -->
                                <div class="img_box cf">
                                    <img src="./images/findTa-banner/huaban.jpeg">
                                    <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                    <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                    <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                    <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                    <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                    <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                    <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                    <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                </div>
                                <!-- 视频 -->
                                <div class="video_box"  style="display:none">
                                    <video src="./images/video/when-it-rains-it-pours.mp4" controls></video>
                                </div>
                                <!-- 社会化分享/点赞 -->
                                
                                <div class="op_list cf">
                                    <div class="op_item like_btn"></div>  
                                    <div class="op_item share_btn"></div>
                                </div>
                               
                            </li>
                            <li>
                                    <!-- 左边头像，用户名和时间 -->
                                    <div class="profile_time_wrap cf">
                                        <img src="./images/iconfont/default1.png">
                                        <div class="username_time_wrap">
                                            <div class="username">
                                                {{name}}
                                            </div>
                                            <div class="time">
                                                <span class="y-m-d">2018-12-07</span> 
                                                <span class="o_clock">10:48</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 右边的收藏和举报 -->
                                    <div class="collect_jb_wrap cf">
                                        <div class="collect_btn">收藏</div>
                                        <div class="tip-off">举报</div>
                                    </div>
                                    <!-- 获取用户发表的文字 -->
                                    <div class="txt_box">
                                        很想告诫你们：<br>
                                        若有朝一日你动了情<br>
                                        千万要先守住秘密<br>
                                        在没有搞清对方底细之前<br>
                                        不要交出真心<br>
                                        吃不到的醋最酸<br>
                                        先动情的人最惨.<br>
                                        ———《你就不要想起我》
                                    </div>
                                    <span class="see_all">查看全部</span>
                                    <!-- 照片 -->
                                    <div class="img_box cf" style="display:none">
                                        <img src="./images/findTa-banner/huaban.jpeg">
                                        <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                        <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                        <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                        <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                        <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                        <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                        <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                        <img src="./images/findTa-banner/pexels-photo-373962.jpeg">
                                    </div>
                                    <!-- 视频 -->
                                    <div class="video_box">
                                        <video src="./images/video/when-it-rains-it-pours.mp4" controls></video>
                                    </div>
                                    <!-- 社会化分享/点赞 -->
                                    
                                    <div class="op_list cf">
                                        <div class="op_item like_btn"></div>  
                                        <div class="op_item share_btn"></div>
                                    </div>            
                                </li>
                        </ul>
                    </div>
                    <!-- 课程 -->
                    <div class="course_wrap">
                        <div class="leader_course_list">
                            <h4><img src="./images/iconfont/innovation.png">Ta的主场课程</h4>
                            <ul class="leader_course_model cf">
                                <!-- js动态添加li标签 -->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
    </div>

    <!-- 引入公共底部 -->
	<%@ include file="../common/footer.jsp"%>
	<!--底部信息栏结束-->

    
     <!-- 举报框 -->
     <div class="tip-off_wrap">
         <div class="close"><img src="./images/iconfont/close.png"></div>
        <div class="username">我要投诉的是“<span>{{name}}</span>”用户</div>
        <span class="illustrate">为防止恶意举报，请填写以下内容：</span>
        <div class="tip-off_cause">
            请选择举报原因：
            <select>
                <option value="">言语辱骂</option>
                <option value="">推广广告</option>
                <option value="">违法违规</option>
                <option value="">色情低俗</option>
                <option value="">赌博诈骗</option>
                <option value="">其他</option>
            </select>
            <span class="other-cause">其他说明:</span>
            <textarea name="tip-off_cause" id="other-supply" cols="25" rows="3" maxlength="120" placeholder="若选择其他原因，请填写该项内容，以便平台为大家提供良好的氛围！"></textarea>
        </div>
        <div class="submit-btn">提交</div>
     </div>

    <!--弹框背景设置透明开始-->
    <div id="fade" class="black_overlay"></div>
    <!--弹框背景设置透明结束-->
    
     <!--回到顶部-->
     <a href="javascript:;" class="backtop" title="回到顶部" id="backtop"></a>

    <script src="script/bootstrap/jquery-3.2.1.min.js"></script>
    <script src="script/leader.js"></script>
    <!-- 回到顶部 -->
    <script src="script/back_top.js"></script>
    <!-- emoji表情 -->
    <script src="lib/js/highlight.pack.js"></script>
    <script src="lib/js/jquery.mousewheel-3.0.6.min.js"></script>
    <script src="lib/js/jquery.mCustomScrollbar.min.js"></script>
    <script src="dist/js/jquery.emoji.min.js"></script>
    <script src="script/model/emoji.js"></script>
    <!-- 社会化分享 -->
    <script src="lib/js/share.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$("#person_course").click(function(){
           /*  alert($(".homepage_leader_username").text() );  */
    			$.ajax({
    				/* GET和POST两种方式传值问题吗，需要修改Ajax中的type类型 */
    				
 	                /* url:"${pageContext.request.contextPath}/personalCourse ?username=${personDetail.username}", */
 	                url:"${pageContext.request.contextPath}/personalCourse",
 	                 'data':{                          //数据
 	                	 username:$(".homepage_leader_username").text(), 
 	                }, 
 	                type: "POST",                   //类型，POST或者GET
 	                dataType: 'json',              //数据返回类型，可以是xml、json等
 	                success: function (data) {      //成功，回调函数
 	                	/* alert("成功"); */
 	                    var data2 = eval(data);
 	                    /* alert(data2); */
 	                     $('.leader_course_model').empty();
 	                   for(var i in data2){
		                	/* alert(data2[i].name); */ 
		                	  $('.leader_course_model').append('<li class="leader_course_item" id=li'+i+'>' +'<a href="javascript:;">'+ 
		                	   /*  '<img  class="course_img src="./images/findTa-banner/pexels-photo-1082100.jpeg">'+ */
		                	    '<img  class="course_img" src='+ data2[i].picture+'>'+ 
		                	    '<div class="course_name">'+ data2[i].name +'</a>'+
		                		'<div class="course_price_link  cf"> '+
		                		'<span class="course_price">￥'+data2[i].price+'</span>'+
		                		'<a href="course.html" class="course_link">'+"查看详情"+'</a>'+
		                		'</div></li>'); 
	                     } 
 	                },
 	                error: function (er) {          //失败，回调函数
 	                    alert("失败");
 	                }
 	            });
    		});
    	});
    </script>
</body>
</html>