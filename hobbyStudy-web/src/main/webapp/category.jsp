<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>全部兴趣课程-趣学网</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo/light_favicon@32.ico">
    <link rel="stylesheet" type="text/css" href="styles/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="styles/bootstrap/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="styles/css/reset.css">
    <link rel="stylesheet" type="text/css" href="styles/css/category.css">
    <link rel="stylesheet" type="text/css" href="styles/css/paging.css">
    <link rel="stylesheet" type="text/css" href="styles/css/index.css">
</head>
<body>
 <!--引入公共头部-->
 
 <%@include file="../common/header.jsp" %>
    <!--分类导航栏开始-->
    <div class="classify_wrap cf">
        <div class="classify">
            <!--方向-->
            <div class="nav_title">
                <span>方向：</span>
                <ul>
		                <!-- 判断curCode不为空，并且curCode=-1 -->
		                <c:choose>
							<c:when test="${!empty curCode  && curCode=='-1'}">
								<li class="course-nav-item  cur-course-nav" ><a href="javascript:;" onClick="_queryPage(1,'-1')">全部1</a></li>
							</c:when>
							 <c:otherwise>
								<li class="course-nav-item"><a href="javascript:;" onClick="_queryPage(1,'-1')">全部4</a></li>
							</c:otherwise> 
						</c:choose>
						<!-- 判断classifys是否存在，存在在循环遍历 -->
				    <c:if test="${!empty classifys}">
						<c:forEach items="${classifys}" var="cs"> 
							<c:choose>
								<c:when test="${!empty curCode && curCode == cs.code}">
		                    		<li class="course-nav-item  cur-course-nav"><a href="javascript:;"  onClick="_queryPage(1,'${cs.code}')">${cs.title}</a></li>
								</c:when>
								<c:otherwise>
		                    		<li class="course-nav-item"><a href="javascript:;"  onClick="_queryPage(1,'${cs.code}')">${cs.title}</a></li>
								</c:otherwise>
							</c:choose>	
					   </c:forEach>
					</c:if>
                 </ul>
            </div>
            <!--分类-->
            <div class="nav_classify cf">
                <span>分类：</span>
                 <!-- 判断curCode不为空，并且curCode=-2 -->
         	   <ul> 
                <c:choose>
					<c:when test="${!empty curSubCode  && curSubCode=='-2'}">
						<li class="course-nav-item  cur-course-nav"><a href="javascript:;" onClick="_queryPage(1,'-2')">全部2</a></li>
					</c:when>
					<c:otherwise>
						<li  class="course-nav-item"><a href="javascript:;" onClick="_queryPage(1,'-2')">全部3</a></li>
					</c:otherwise>
				</c:choose> 
            <!-- foreach循环分类方向全部 -->
               <c:if test="${!empty subClassifys}">
					<c:forEach items="${subClassifys}" var="subs"> 
						<c:choose>
							<c:when test="${!empty curSubCode && curSubCode== subs.code}">
			                    <li class="course-nav-item  cur-course-nav"><a href="javascript:;" onClick="_queryPage(1,'${subs.code}')">${subs.name}</a></li>
							</c:when>
						<c:otherwise>
			                   <li class="course-nav-item"><a href="javascript:;"  onClick="_queryPage(1,'${subs.code}')">${subs.name}</a></li>
							</c:otherwise>
						</c:choose>	
					</c:forEach>
			    </c:if>
              </ul>
           </div>
            <div class="rank">
                <i class="title">排序：</i>
                <a href="javascript:;" style="display: inline-block;margin-right:20px;" onclick="_queryPage(1,undefined,'last')">
                	<c:choose>
                		<c:when test="${!empty sort && sort=='last'}">
							 <span class="new active">最新1</span>                		
                		</c:when>
                		<c:otherwise>
							 <span>最新2</span>                		
                		</c:otherwise>
                	</c:choose>
                </a>
                
                <a href="javascript:;" style="display: inline-block;" onclick="_queryPage(1,undefined,'pop')">
                	<c:choose>
                		<c:when test="${not empty sort && sort=='pop'}">
							 <span class="new active">最热1</span>                		
                		</c:when>
                		<c:otherwise>
							 <span>最热2</span>
                		</c:otherwise>
                	</c:choose>
                </a>
            </div>
        </div>
    </div>
    <!--分类导航栏结束-->

    <!--分类导航搜索结果开始-->
    <div class="recommend cf">
        <div class="addcart">
            <span class="success">
                添加购物车成功
            </span>
            <button class="sure">确定</button>
        </div>
        <div class="course">
        	<div class="courseList">
        	<c:if test="${!empty page.items}">
        		<c:forEach items="${page.items}" var="pi">
			        <a href="${pageContext.request.contextPath}/${pi.id}">
			            <div class="courseInfo">
			               <img src="${pi.picture}">
			                 <a href="course.html">
			                        <div class="courseTitle">${pi.name}</div>
			                 </a>
			                 <div class="courseDes"> ${pi.brief}<br></div>
			                  <div class="priceWrap">
			                        <span class="price">￥${pi.price}</span>
				                   <div class="like">
				                         <i class="fa fa-heart-o collect" aria-hidden="true"></i>
				                         <i class="fa fa-shopping-cart"></i>
				                   </div>
			                  </div>
			                   <div class="courseTeacher"><a href="leader.html"><img src="images/iconfont/default1.png">${pi.userid}</a><span
			                                class="school">陕西理工大学</span>
			                   </div>
			             </div>
			        </a>
        		</c:forEach>
        	</c:if>
        </div>
        </div>
    </div>
  <div class="ad ">
        <a href="javaScript:;"><img src="images/ad/cut.jpg"></a>
        <a href="javaScript:;"><img src="images/ad/cut.jpg"></a>
    </div>
    <!-- 分页 -->
       <%@ include file="../common/pages.jsp" %>

    <!--分类导航搜索结果结束-->
	 <!--底部信息栏开始-->
	 	 <%@ include file="../common/footer.jsp" %>
    <!--底部信息栏结束-->

    <!--回到顶部-->
    <a href="javascript:;" class="backtop" title="回到顶部" id="backtop"></a>

    <!--弹框背景设置透明开始-->
    <div id="fade" class="black_overlay"></div>
    <!--弹框背景设置透明结束-->

    <script type="text/javascript" src="script/bootstrap/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="script/paging.js"></script>

    <script type="text/javascript">
        $(function () {
			
            //点击排序(最新，最热)切换样式
            $('.rank span').click(function () {
                if ($(this).hasClass('active') == false) {
                    $(this).addClass('active').siblings().removeClass('active');
                }
            })


            //点击喜欢
            $('.like .collect').click(function () {
                if ($(this).hasClass('fa-heart')) {
                    $(this).removeClass('fa-heart').addClass('fa-heart-o').css('color', '#000');
                } else {
                    $(this).removeClass('fa-heart-o').addClass('fa-heart').css('color', 'red');
                }
            })

            //点击购物车弹出添加购物车成功弹框
            $('.fa-shopping-cart').click(function () {
                $('.addcart').css('display', 'block');
                $('#fade').css('display', 'block');
            })
            $('.addcart .sure').click(function () {
                $('.addcart').css('display', 'none');
                $('#fade').css('display', 'none');
            })

            //返回顶部
            var backtop = document.getElementById('backtop');
            var timer = null;
            var isTop = true;
            var clientHeight = document.documentElement.clientHeight;

            window.onscroll = function () {
                var topHeight = document.body.scrollTop || document.documentElement.scrollTop;
                if (topHeight >= clientHeight) {
                    backtop.style.display = 'block';
                } else {
                    backtop.style.display = 'none';
                }
                if (!isTop) {
                    clearInterval(timer);
                }
                isTop = false;
            }

            backtop.onclick = function () {
                timer = setInterval(function () {
                    var topHeight = document.body.scrollTop || document.documentElement.scrollTop;
                    var upspeed = Math.floor(-topHeight / 5);
                    document.documentElement.scrollTop = document.body.scrollTop = topHeight + upspeed;
                    isTop = true;
                    if (topHeight == 0) {
                        clearInterval(timer);
                    }
                }, 30);
            }

            //页码
            var setTotalCount = 200;
            $('#box').paging({
                initPageNo: 1, // 初始页码
                totalPages: 10, //总页数
                totalCount: '合计' + setTotalCount + '条数据', // 条目总数
                slideSpeed: 600, // 缓动速度,单位毫秒
                jump: true, //是否支持跳转
                callback: function (page) { // 回调函数
                    // console.log(page);
                }
            })
        })
        
        
        var _code = '${curCode}';
		var _subCode = '${curSubCode}';
		var _sort = '${sort}';
			function _queryPage(pageNum,code,sort){
				var params = '?pageNum='+pageNum;
				//分类，参数没有就用页面缓存 
				if(code == undefined){   //来自于分页按钮
					code = _code;
					if(_subCode != '-2'){
						code = _subCode; //优先使用 subCode 
					}
				}
				if(code == '-2'){//点击分类的全部
					code = _code;    //  把全部分类的-1赋值给-2
				}
				//  如果code不等于-1并且-2  就把参数加在后面
				if(code != '-1' && code != ''){  
					params += '&code='+code;
				}
				  //排序，函数参数没有就用页面缓存 
				if(sort == undefined && _sort != ''){
					sort = _sort;
				}
				if(sort != undefined){
					params += '&sort='+sort;
				} 
				 window.location.href='${pageContext.request.contextPath}/Courselist'+params;
			} 
    </script>
</body>

</html>