$(function(){
	//背景图片
	var $imgurl = $('.imgurl').text();
	$('.homepage_wrap').css('background','url('+$imgurl +')' );
	$('.homepage_wrap').css('background-repeat','no-repeat');
	$('.homepage_wrap').css('background-size','100% 100%');
	/*$('#btn').click(function(){
		var $imgurl = $('.imgurl').text();
		$('.homepage_wrap').css('background','url('+$imgurl +')' );
		$('.homepage_wrap').css('background-repeat','no-repeat');
		$('.homepage_wrap').css('background-size','100% 100%');
	})*/

	
	
    // 鼠标划过简介，如果字数超过则显示title；
    $('.simple_introduction').hover(function() {
        var text_si = $(this).text();
        var len = $(this).text().length;
        if(len > 180){
            $(this).attr('title',text_si);
        }
    })

    //举报弹框
    $('.tip-off').click(function() {
        $('.tip-off_wrap').css('display','block');
        $('#fade').css('display','block');
    })
    $('.tip-off_wrap .submit-btn').click(function() {
        $('#fade').css('display','none');
        $('.tip-off_wrap').css('display','none');
    })
    $('.tip-off_wrap .close').click(function() {
        $('#fade').css('display','none');
        $('.tip-off_wrap').css('display','none');
    })
     
    // 关注《==》取消关注
    $('.favorite_btn').click(function() {
        var fan_num = $('.fan_num .num').text();
        var gz_text = $(this).text();
        if(gz_text == "关注Ta"){
            $('.fan_num .num').text(fan_num*1+1);
            $(this).text('已关注');
        }else{
            $(this).text('关注Ta');
            $('.fan_num .num').text(fan_num*1-1);
        }
    })

    $('.favorite_btn').hover(function() {
        var gz_text = $(this).text();
        if(gz_text == "已关注"){
            $(this).text('取消关注');
        }
    })
    $('.favorite_btn').mouseleave(function() {
        var gz_text = $(this).text();
        if(gz_text == "取消关注"){
            $(this).text('已关注');
        }
    })

    // 点击标签添加黄色箭头背景，移除同级其他元素的样式；
    $('.tab_content_left ul li a').click(function() {
        console.log( $(this).parent());
        $(this).parent('li').addClass('active').siblings().removeClass('active');
    })
    // 视频上传方式点击切换样式
    $('.upload_way a').click(function() {
        $(this).addClass('active').siblings().removeClass('active');
    })
    //点击差号关闭视频弹框；
    $('.upload_way .close').click(function() {
        $('.video_file_wrap').css('display','none');
    })
    // 点击视频弹出框
    $('.video_btn').click(function() {
        $('.video_file_wrap').css('display','block');
    })
    // 点击上传本地视频选择文件事件
    $('.onload_video_btn').click(function() {
        var $input = $('#video_file');
        $input.on('change', function() {
            $('.video_file_wrap').css('display','none');
            var files = this.files;
            
            $.each(files,function(key,value){
            var fr = new FileReader();
            var video = document.createElement("video");

            fr.onload = function(){
                video.src=this.result; 
                video.className = 'video_src';
                video.setAttribute('controls','controls');
                if($('.store_video video').length == 0){
                    $('#store_video').append(video);
                }else{
                    $('#store_video').children('.video_src').replaceWith(video);
                }            
            }
            fr.readAsDataURL(value);
            })
            $input.removeAttr('id');
            var newInput = '  <input type="file" class="input_file_video" id="video_file" accept="video/*">';
            $(this).append($(newInput));
        })
        $('.video_file_wrap').css('display','none');
    })
    // 点击删除按钮删除视频；
    $('.store_video').on('mouseenter','video',function() {
        $(this).siblings('.del').css('display','block');
    })
    $('.store_video').mouseleave(function() {
        $(this).children('.del').css('display','none');
    })

   $('.store_video .del').click(function() {
       $(this).siblings().remove();
       $(this).css('display','none');
   })

    // 获取input：file选择的文件并显示图片
    $('.img_btn').click(function() {        
        var $input = $("#photo_file");
        $input.on("change" , function(){
            $('#photo_onload').css('display','block');
            //获取选择图片的个数
            var files = this.files;
            var length = files.length;
            // 动态显示图片的数量
            var pnum = parseInt($('.photo_num .file_num').text());
            var maxlen = 9- pnum;
            var total = 0;
            if(length > maxlen){
                length = 0;
                total = pnum;
                $('.photo_num .file_num').text(total);
                $('.warn_max').css('display','inline-block');
                $('.warn_max .maxlen').text(maxlen);
            }else{
                total = pnum + length;
                $('.photo_num .file_num').text(total);
                $.each(files,function(key,value){
                // 让第9张之后的div不显示
                var div = document.createElement("div"),
                    img = document.createElement("img");
                    del = document.createElement("span");
                div.className = "onload_photo_box";
                del.className = "delete";
                

                var fr = new FileReader();
                fr.onload = function(){
                    img.src=this.result; 
                    div.append(img);
                    //克隆新元素
                    var clone_del = del.cloneNode(true);//默认参数是false
                    div.appendChild(clone_del);
                    document.getElementById('photo_onload').appendChild(div);
                }
                fr.readAsDataURL(value);
            })
              $input.removeAttr('id');
                var newInput = '<input class="input_file_photo" type="file" name="onload_photo" multiple id="photo_file">';
                $('.img_btn').append($(newInput));
            }  

        })


    })

    // 用户鼠标移入上传的图片展示上，显示删除按钮
    $('#photo_onload').on('mouseenter','div.onload_photo_box img',function() {
        $(this).siblings('.delete').css('display','block').parent().siblings().children('.delete').css('display','none');
    });
    $('#photo_onload').on('mouseleave','div.onload_photo_box .delete',function() {
        $(this).css('display','none');
    });
    // 点击删除当前图片；
    $('#photo_onload').on('click','div.onload_photo_box .delete',function() {
        $(this).parents('.onload_photo_box').remove();
        var len = $('.photo_num .file_num').text();
        $('.photo_num .file_num').text(len*1 -1);
        $('.warn_max .maxlen').text((9-len)*1 +1);
        if( $('.photo_num .file_num').text() == "0"){
            $('#photo_onload').css('display','none');
            $('.warn_max').css('display','none');
        }
    });
    
    // 点击上传视频的方式选择本地和url切换内容
    $('.local_way').click(function() {
        $('.onload_video_btn').css('display','block');
        $('.url_content').css('display','none');
    })
    $('.url_way').click(function() {
        $('.onload_video_btn').css('display','none');
        $('.url_content').css('display','block');
    })

    // 收藏
    $('.collect_btn').click(function(){
        if($(this).text() == "收藏"){
            $(this).text('已收藏');
            $(this).css('color','#fdd102');
            $(this).addClass('active');
        }else{
            $(this).text('收藏');
            $(this).css('color','#000');
            $(this).removeClass('active');
        }
    })
    $('.collect_btn').hover(function(){
        if($(this).text() == "已收藏"){
            $(this).text('取消收藏');
        }
    })
    $('.collect_btn').mouseleave(function(){ 
        if($(this).text() == "取消收藏"){
            $(this).text('已收藏');
        }
    })
   
    // 查看全部
    $('.moments_list li span.see_all').click(function() {
        var all_fold = $(this).text();
        if(all_fold == "查看全部"){
            $(this).siblings('.txt_box').css('maxHeight','none');
            $(this).text('收起');
        }else{
            $(this).siblings('.txt_box').css('maxHeight',120);
            $(this).text('查看全部');
        }
    })
    // 初始化分享
    $(".share_btn").socialShare({
        content: '',
        url:'',
        titile:''
    });
    // 给动态点赞变色
    $('.op_list .like_btn').click(function() {
        if($(this).hasClass('like_btn_yellow')){
            $(this).removeClass('like_btn_yellow');
        }else{
            $(this).addClass('like_btn_yellow');
        }
    })

    // 点击动态《==》课程切换
    $('.tab_content_left ul li:first').click(function() {
        $('.user_homepage_moments').css('display','block');
        $('.course_wrap').css('display','none');
    })
    $('.tab_content_left ul li:nth-child(2)').click(function() {
        $('.user_homepage_moments').css('display','none');
        $('.course_wrap').css('display','block');
    })

    // 用户发布的动态传值


});
