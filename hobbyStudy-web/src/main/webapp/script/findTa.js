$(function() {
    // school
    var provinceArray = "";
    var provicneSelectStr = "";
    for(var i=0,len=province.length;i<len;i++){
        provinceArray = province[i];
        provicneSelectStr = provicneSelectStr + "<option value='"+provinceArray[0]+"'>"+provinceArray[1]+"</option>"
    }
    $("#province").html(provicneSelectStr);
    // 修改默认省为陕西省
    $("#province option:nth-child(13)").attr('selected','selected')
   
    var selectCity = $("#province").val();
    var citylist=city[selectCity];
    var cityArray = "";
    var citySelectStr = "";
    for(var i=0,len=citylist.length;i<len;i++){
        cityArray = citylist[i];
        citySelectStr = citySelectStr + "<option value='"+cityArray[0]+"'>"+cityArray[1]+"</option>"
    }
    $("#city").html(citySelectStr);
    // 修改默认城市为汉中市；
    $("#city option:nth-child(8)").attr('selected','selected')

    var selectschool = $("#city").val();
    var schoolUlStr = "";
    var schoolListStr = allschool[selectschool];
    for(var i=0,len=schoolListStr.length;i<len;i++){
        schoolUlStr = schoolUlStr + "<option >"+schoolListStr[i][2]+"</option>";
    }
    schoolUlStr = schoolUlStr + "<option value='999'>其它</option>";
    $("#school").html(schoolUlStr);
    //省切换事件
    $("#province").change(function(){
        var selectCity = $("#province").val();
        var citylist=city[selectCity];
        var cityArray = "";
        var citySelectStr = "";
        if(citylist!=null){
            for(var i=0,len=citylist.length;i<len;i++){
                cityArray = citylist[i];
                citySelectStr = citySelectStr + "<option value='"+cityArray[0]+"'>"+cityArray[1]+"</option>"
            }
        }
        //修改默认学校为陕西理工大学
        $("#city option:nth-child(1)").attr('selected','selected')

        $("#city").html(citySelectStr);
        $("#school1").show();
        $("#school2").hide();
        var selectschool = $("#city").val();
        var schoolUlStr = "";
        var schoolListStr = allschool[selectschool];
        for(var i=0,len=schoolListStr.length;i<len;i++){
            schoolUlStr = schoolUlStr + "<option >"+schoolListStr[i][2]+"</option>";
        }
        schoolUlStr = schoolUlStr + "<option value='999'>其它</option>";
        $("#school").html(schoolUlStr);
    });
    //切换城市事件
    $("#city").change(function(){
        $("#school1").show();
        $("#school2").hide();
        var selectschool = $("#city").val();
        var schoolUlStr = "";
        var schoolListStr = allschool[selectschool];
        for(var i=0,len=schoolListStr.length;i<len;i++){
            schoolUlStr = schoolUlStr + "<option >"+schoolListStr[i][2]+"</option>";
        }
        schoolUlStr = schoolUlStr + "<option value='999'>其它</option>";
        $("#school").html(schoolUlStr);
    });
    $("#school").change(function(){
        if($("#school").val()=="999"){
            $("#school1").hide();
            $("#school2").show();
        }
    });
    $("#second").show();


    //轮播
    var aa=new zturn({
        id:"zturn",
        opacity:0.9,
        width:382,
        Awidth:1024,
        scale:0.9,
        auto:true,//是否轮播 默认5000
        turning:3000//轮播时长
    })

    //点击轮播图卡片的喜欢
    $('.love_num').click(function() {
        var love_num = parseInt($(this).text());
        console.log(love_num);
        if($(this).hasClass('love_red')){
            $(this).removeClass('love_red').addClass('love_num');
            $(this).text(love_num -1);
        }else{
            $(this).addClass('love_red');
            $(this).text(love_num +1);
        }
    })

    //显示轮播图卡片介绍；
    $('.pi').hover(function(){
        // var pi_content = $(this).text();
        // if(pi_content.length > 100){
        //     $(this).next().css('display','block');
        // }else{
        //     $(this).next().css('display','none');
        // }
        $(this).css('maxHeight','none');
    })
    $('.poster-item').mouseleave(function(){  
        $(this).children('.pi').css('maxHeight',70);
        // $(this).children('.seeAll').text('查看全部...');
        // $(this).children('.seeAll').css('display','none');
    })

    // $('.seeAll').click(function() {
    //     if($(this).text() == '查看全部...'){
    //     $(this).prev().css('maxHeight','none');
    //     $(this).text('收起');
    //     }else{
    //         $(this).prev().css('maxHeight',70);
    //         $(this).text('查看全部...');
    //     }
    // })


    //获取用户选择的学校
    
    var options = $('#school option:selected');
    var choose_school = options.text();
    $('.school_name').text(choose_school);

    $('#province').click(function() {
        $('#city option:first').attr('selected','selected');
        var options = $('#school option:selected');
        var choose_school = options.text();
        $('.school_name').text(choose_school);
    })



    $('#city').click(function() {
        $('#school option:first').attr('selected','selected');
         var options = $('#school option:selected');
        var choose_school = options.text();
        $('.school_name').text(choose_school);
    })

    $('#school').click(function() {
        var options = $('#school option:selected');
        var choose_school = options.text();
        $('.school_name').text(choose_school);
    })
    //领学者卡片简介的高度自动
    $('.info-list').on("mouseenter",".person_info",function(){
        //获取简介的值传给title
        var pi_text = $(this).text();
        if(pi_text.length > 350){
            $(this).attr('title',pi_text);
        }
        // console.log( $(this).siblings('.profile_photo').children());
        $(this).siblings('.profile_photo').children().css('width',100);
        $(this).siblings('.profile_photo').children().css('height',100);
        $(this).siblings('.leader_name').css('display','none');
        $(this).siblings('.lebel-words').css('display','none');
        $(this).css('maxHeight',265);
        $(this).parent('li').css('background','#FFFFE0');
    })
   /* $('.search-list ul li').mouseleave(function() {
        $(this).children('.profile_photo').find('.profile_img').css('width',150);
        $(this).children('.profile_photo').find('.profile_img').css('height',150);
        $(this).css('background','#fff');
        $(this).children('.person_info').css('maxHeight',130);
        $(this).children('.leader_name').css('display','block');
        $(this).children('.lebel-words').css('display','block');
    })*/
     $('.info-list').on("mouseleave","li",function(){
    	 $(this).children('.profile_photo').find('.profile_img').css('width',150);
         $(this).children('.profile_photo').find('.profile_img').css('height',150);
         $(this).css('background','#fff');
         $(this).children('.person_info').css('maxHeight',130);
         $(this).children('.leader_name').css('display','block');
         $(this).children('.lebel-words').css('display','block');
     })
    //关注《==》取消关注
    /*$(".info-list").on("click","span",function(){
			 if($(this).text() == "取消关注"){
		         $(this).text('关注Ta')
		     }else{
		         $(this).text('取消关注')
		     }
		})*/

})
