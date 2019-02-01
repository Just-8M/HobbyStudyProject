$(function () {
    // 点击导航添加样式
    $('.manage_btn').click(function () {
        $(this).addClass('active').siblings().removeClass('active');
    })

    // 点击左侧导航添加样式（背景和右边框）
    $('.nav_inline .inline_item a').click(function () {
        $(this).addClass('active').siblings().removeClass('active');
    })

    // 点击头部导航显示对应的左侧导航栏
    $('.manage_list .manage_btn').click(function () {
        var item_index = $(this).index(); //获取点击头部链接的索引；
        // alert(item_index);
        $('.left_nav .nav_list').eq(item_index).css('display', 'block').siblings().css('display', 'none');
    })


    // 更换iframe的src
    $('.nav_inline .inline_item a').click(function () {
        var _src = $(this).attr('_link');
        $('#main').attr('src', _src);
    })

})