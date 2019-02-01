$(document).ready(function () {


    //打开页面3s后弹出兴趣选择框
    setTimeout(() => {
        // $('.choose').css('display', 'block');
    }, 3000);
    //点击关闭按钮关闭兴趣选择框
    $('.close').click(function () {
        $('.choose').css('display', 'none');
    });
    $('.skip').click(function () {
        $('.choose').css('display', 'none');
    });


    //获取选择的城市,并将城市赋值给当前城市
    $("#submit_city").click(function () {
        var province = $("#eprovinceName").find("option:selected").text();
        var city = $("#ecityName").find("option:selected").text();
        $('#cityName').text(city);
        $('#distpicker').css('display', 'none');
    });

    //点击取消选择城市隐藏选择框
    $('#cancel_city').click(function () {
        $('#distpicker').css('display', 'none');
    });

    //点击切换城市显示城市选择框
    $('#city_btn').click(function () {
        $('#distpicker').css('display', 'block');
    });

    //鼠标滑动到课程显示隐藏的元素内容
    $('.teacherDes').mouseover(function (event) {
        var $target = $(event.target);
        var target_text = $target.text();
        $target.attr('title', target_text);
    })

    $('.courseDes').mouseover(function (event) {
        var $target = $(event.target);
        var target_text = $target.text();
        $target.attr('title', target_text);
    })


    //鼠标滑至导航显示对应的导航内容
    $('.left_nav .nav_menu').hover(function () {
        var nav_index = $(this).index();
        $('.right_content').find('.menu_content').eq(nav_index - 1).css('display', 'block').siblings('.menu_content').css('display', 'none');
    })

    $('.menu_content').mouseleave(function () {
        $(this).css('display', 'none');

    })

    $('.main_nav').mouseleave(function () {
        $('.menu_content').css('display', 'none');
    })


    //bootstrap手动添加active
    $('.carousel-inner .item').each(function () {
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
        }
    })

    $('.carousel-indicators li').each(function (index) {
        if ($(this).hasClass('active')) {
            $('.carousel-inner .item').eq(index).addClass('active').siblings().removeClass('active');
        }
    })

    //点击喜欢变成红色桃心
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



    //购物车数量
    if ($('.cartlist').css('display') == 'block') {
        var cartnum = $('.cartlist ul li').length;
        $('.shopcart').find('.total').text(cartnum);
    } else {
        $('.shopcart').find('.total').text('0');
    }

    //鼠标滑动至购物车显示对应的框
    $('.header_nav li:nth-child(3)').hover(function () {
        $('.shopcart').css('display', 'block')
    })
    $('.header_nav li:nth-child(2)').hover(function () {
        $('.shopcart').css('display', 'none')
    })
    $('.header_nav li:nth-child(4)').hover(function () {
        $('.shopcart').css('display', 'none')
    })
    $('.shopcart').mouseleave(function () {
        $(this).css('display', 'none')
    })

    //点击删除课程
    $('.delete').click(function () {
        $(this).closest('li').remove();
        var cartnum = $('.cartlist ul li').length;
        $('.shopcart').find('.total').text(cartnum);
        if (cartnum == 0) {
            $('.cartlist').css('display', 'none');
            $('.nocontent').css('display', 'block');
        }
    })
    // 点击菜单连接跳转页面
    $('.menu_detail ').find('a').on('click', function () {
        var value = $(this).text();
        var parentValue = $(this).parent().parent().siblings('span').text();
        console.log(parentValue);
        // 跳转页面并传递参数
        var url = encodeURI(`./CourseListCntroller/Courselist?parentNav=${parentValue}&presentNav=${value}`);
        var enurl = encodeURI(url);
        $(location).attr('href', enurl);
    })
})