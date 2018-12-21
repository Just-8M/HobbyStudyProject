$(document).ready(function() {
    //点击提示关闭按钮
   $('.warning img').click(function() {
       $('.warning').css('display','none');
   })

   //点击播放视频的按钮播放视频
   $('.video_btn').click(function() {
       $('.coursevideo').css('display','none');
       $('.videolink').css('display','block');
   })

   //显示课程介绍全部内容
   $('.course_notice .destination span').hover(function() {
      if($(this).text().length > 30){
        var course_val = $(this).text();
         $(this).attr('title',course_val);
      }
   })

   //报名下一次课程
   $('.sign_up a').click(function() {
       $('.sign_up').css('display','none');
       $('.sign_up_success').css('display','block');
       $('.sign_up_success').css('line-height','20px');
   })
   $('.sign_up_success a').click(function() {
        $('.sign_up_success').css('display','none');
       $('.sign_up').css('display','block');
   })

   //点击喜欢桃心变红色
   $('.love_addcart span:first-child').click(function() {
       if($(this).hasClass('love_red')){
        $(this).removeClass('love_red').addClass('love');
       }else{
        $(this).removeClass('love').addClass('love_red');
       }
   })

   //点击购物车添加动画效果
   $('.love_addcart .addcart').click(function() {
       $('.love_addcart .cart_animate').css('display','block');
       setTimeout(function(){
        $('.love_addcart .cart_animate').css('display','none');
       },1000)
   })

   //选项卡点击改变颜色
   $('.course_tab ul li').click(function() {
       $(this).addClass('active').siblings().removeClass('active');
       $(this).children('').css('color','#FFC125').parents().siblings().find('a').css('color','#555');
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
    
    //点击选项卡切换对应的内容；
    $('.nav-tabs li:first a').click(function() {
      $('.course_tab_content .courseDetail').css('display','block').siblings().css('display','none');
    })
    $('.nav-tabs li:nth-child(2) a').click(function() {
      $('.course_tab_content .mements').css('display','block').siblings().css('display','none');
    })
    $('.nav-tabs li:nth-child(3) a').click(function() {
      $('.course_tab_content .consult').css('display','block').siblings().css('display','none');
    })
    $('.nav-tabs li:last a').click(function() {
      $('.course_tab_content .evaluate').css('display','block').siblings().css('display','none');
    })

    //点击关注
    $('.profile_photo .favorite').click(function() {
        var  fan_num = parseInt($('.fan_num').text());
        if($(this).text() == '取消关注'){
            $(this).text('+ 关注Ta');
            $('.fan_num').text(fan_num - 1);
        }else{
            $(this).text('取消关注');
            $('.fan_num').text(fan_num + 1);
        }
    })

    // textarea高度自适应
    $(function () {
        $('.content').flexText();
    });

    // 点击评论创建评论条
    $('.commentAll').on('click','.plBtn',function(){
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        if(m<10) m = '0' + m;
        var s=myDate.getSeconds();
        if(s<10) s = '0' + s;
        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
        //获取输入内容
        var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
        //动态创建评论模块
        oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><img src="./images/iconfont/icons8-man-in-blue-t.png" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">course.js:133 : </a> <span class="my-pl-con">&nbsp;'+ oSize +'</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="pull-left tip-off">举报</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
        if(oSize.replace(/(^\s*)|(\s*$)/g, "") != ''){
            $(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
            $(this).siblings('.flex-text-wrap').find('.comment-input').prop('value','').siblings('pre').find('span').text('');
        }
    });

    //删除评论块
    $('.commentAll').on('click','.removeBlock',function(){
        var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
        if(oT.siblings('.all-pl-con').length >= 1){
            oT.remove();
        }else {
            $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
            oT.remove();
        }
        $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();

    })

    //点赞
    $('.comment-show').on('click','.date-dz-z',function(){
        var zNum = $(this).find('.z-num').html();
        if($(this).is('.date-dz-z-click')){
            zNum--;
            $(this).removeClass('date-dz-z-click red');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').removeClass('red');
        }else {
            zNum++;
            $(this).addClass('date-dz-z-click');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').addClass('red');
        }
    })
    
    //举报(后台判断该用户是否购买了该课程，如没有则弹出下列弹框)
    // $('.plBtn').click(function() {
    //     $('#fade').css('display','block');
    //     $('.no_qualify').css('display','block');
    // })
    // $('.no_qualify_btn').click(function() {
    //     $('#fade').css('display','none');
    //     $('.no_qualify').css('display','none');
    // })

    //举报弹框
    $('.tip-off').click(function() {
        $('.tip-off_wrap').css('display','block');
        $('#fade').css('display','block');
    })
    $('.tip-off_wrap .submit-btn').click(function() {
        $('#fade').css('display','none');
        $('.tip-off_wrap').css('display','none');
    })
  
    
})