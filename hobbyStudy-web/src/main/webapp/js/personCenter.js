$(function () {
    // 初始化提示标签
    $('[data-toggle="tooltip"]').tooltip();

    $('.list-group .list-group-item').click(function () {
        $(this).addClass('active').siblings().removeClass('active');
    })

    // 鼠标滑动到头像显示更换头像的链接
    $('.profile .profile_img').mouseenter(function () {
        $('.update-avator').css('display', 'block');
    })

    $('.profile').mouseleave(function () {
        $('.update-avator').css('display', 'none');
    })
    // 点击左边的框显示对应的右边的内容

    $('.list-group .list-group-item').click(function () {
        var anum = $(this).index();
        $('.right_content_box .right_item').eq(anum).css('display', 'block').siblings().css(
            'display', 'none');
    })

    // 点击上传学籍证明
    $('.file_box').click(function () {
        $('#materia').click();
    })


    var img = document.getElementById('materia');
    img.onchange = function () {
        var imgName = this.files[0].name;
        // console.log(imgName);
        var store_img = document.getElementById('img_name');
        store_img.innerHTML = imgName;
    }

    // 点击上传身份证触发上传文件input框的点击事件
    $('.photo_front').click(function () {
        $('#IdPhoto_front').click();
    })
    $('.photo_reverse').click(function () {
        $('#IdPhoto_reverse').click();
    })
    // 点击图片可以更换图片
    $('#front_img').click(function () {
        $('#IdPhoto_front').click();
    })
    $('#reverse_img').click(function () {
        $('#IdPhoto_reverse').click();
    })


    //获取上传的身份证正面
    $("#IdPhoto_front").change(function (e) {
        //获取目标文件
        var file = e.target.files || e.dataTransfer.files;
        //如果目标文件存在
        if (file) {
            //定义一个文件阅读器
            var reader = new FileReader();
            //文件装载后将其显示在图片预览里
            reader.onload = function () {
                $("#front_img").attr("src", this.result);
            }
            //装载文件
            reader.readAsDataURL(file[0]);
            $('.photo_front').css('display', 'none');
            $('#front_img').css('display', 'block');
        } else {
            $('#front_img').css('display', 'none');
            $('.photo_front').css('display', 'block');
        }
    });
    // 获取上传的身份证反面
    $("#IdPhoto_reverse").change(function (e) {
        //获取目标文件
        var file = e.target.files || e.dataTransfer.files;
        //如果目标文件存在
        if (file) {
            //定义一个文件阅读器
            var reader = new FileReader();
            //文件装载后将其显示在图片预览里
            reader.onload = function () {
                $("#reverse_img").attr("src", this.result);
            }
            //装载文件
            reader.readAsDataURL(file[0]);
            $('.photo_reverse').css('display', 'none');
            $('#reverse_img').css('display', 'block');
        } else {
            $('#reverse_img').css('display', 'none');
            $('.reverse_front').css('display', 'block');
        }
    });

    //将用户原来的头像src赋给更改头像框的img
    var originPhoto = $('.profile_img').attr('src');
    // console.log(originPhoto);
    $('#changePhoto-img').attr('src', originPhoto);

    // 点击上传头像
    $('.onload_link').click(function() {
        $('#onload_change_profile').click();
    });
    // 获取用户上传的头像
    $("#onload_change_profile").change(function (e) {
        //获取目标文件
        var file = e.target.files || e.dataTransfer.files;
        //如果目标文件存在
        if (file) {
            //定义一个文件阅读器
            var reader = new FileReader();
            //文件装载后将其显示在图片预览里
            reader.onload = function () {
                $("#changePhoto-img").attr("src", this.result);
            }
            //装载文件
            reader.readAsDataURL(file[0]);
        }
    });

    // 邮箱模态框验证
    var ck_email = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,5}$/;

    // 手机号验证
    var ck_phone = /^[1][3,4,5,7,8][0-9]{9}$/;

    // 当输入邮箱失去焦点进行验证
    $('#email').blur(function() {
        var email_val = $(this).val();
        if (email_val == '') {
            $(this).siblings('.error').show().html("<i class='icon-error'></i>请输入邮箱号");
        } else if (!ck_email.test(email_val)) {
            $(this).siblings('.error').show().html(
                "<i class='icon-error'></i>邮箱格式不正确");
        } else {
            $(this).siblings('.error').hide();
        }
    });

    // 发送验证码倒计时;
    // 邮箱倒计时
    $('#sendCode').click(function(){
        var obj = $(this);
        var email = $('#email').val();
        if(email != '' && ck_email.test(email)){
            settime(obj);
        }
       
    })
    // 手机号验证码倒计时
    $('#sendPhoneCode').click(function(){
        var obj = $(this);
        var _phone= $('#phone').val();
        if(_phone != '' && ck_phone.test(_phone)){
            settime(obj);
        }
       
    })
    var countdown=60; 
    function settime(obj) { //发送验证码倒计时
        if (countdown == 0) {
            obj.attr('disabled', false);
            obj.text("获取验证码");
            countdown = 60;
            return;
        } else {
            obj.attr('disabled', true);
            obj.text("重新发送(" + countdown + ")");
            countdown--;
        }
        setTimeout(function () {
            settime(obj)
        }, 1000)
    };

    // 邮箱验证码
    $('#emailCode').blur(function () {
        var email_code = $(this).val();
        if (email_code == '') {
            $(this).siblings('.error').show().html("<i class='icon-error'></i>请输入验证码");
        } else if (email_code.length < 6) {
            $(this).siblings('.error').show().html(
                "<i class='icon-error'></i>验证码错误");
        } else {
            $(this).siblings('.error').hide();
        }
    })

    // 点击更改邮箱按钮隐藏当前绑定邮箱弹框，使更改邮箱弹框出现；
    $('.changeEmail_btn').click(function() {
        $(this).parent().hide();
        $('#emailForm').css('display','block');
    })

    // 手机号模态框验证

    $('#phone').blur(function() {
        var _phone = $(this).val();
        if (_phone  == '') {
            $(this).siblings('.error').show().html("<i class='icon-error'></i>请输入手机号");
        } else if (!ck_phone.test(_phone)) {
            $(this).siblings('.error').show().html(
                "<i class='icon-error'></i>手机号格式不正确");
        } else {
            $(this).siblings('.error').hide();
        }
    })

    // 手机验证码
    $('#phoneCode').blur(function () {
        var email_code = $(this).val();
        if (email_code == '') {
            $(this).siblings('.error').show().html("<i class='icon-error'></i>请输入验证码");
        } else if (email_code.length < 6) {
            $(this).siblings('.error').show().html(
                "<i class='icon-error'></i>验证码错误");
        } else {
            $(this).siblings('.error').hide();
        }
    })

    // 更改密码验证
    var ck_password = /^[A-Za-z0-9_]{6,20}$/;
    // 原密码
    $('#formerPassword').blur(function () {
        var psw= $(this).val(); //获取密码
        if (psw == '') {
            $(this).siblings('.error').show().html("<i class='icon-error'></i>请输入原密码");
        } else if (!ck_password.test(psw)) {
            $(this).siblings('.error').show().html(
                "<i class='icon-error'></i>密码不符合要求，请输入6-20位字母，数字或者下划线");
        }/*else if(psw != '{{数据库存放的原密码}}') {
            $(this).siblings('.error').show().html("<i class='icon-error'></i>原密码错误");
        }*/else {
            $(this).siblings('.error').hide();
        }
    })
    // 新密码
    $('#newPassword').blur(function () {
        var psw_val = $(this).val(); //获取密码
        if (psw_val == '') {
            $(this).siblings('.error').show().html("<i class='icon-error'></i>请设置新密码");
        } else if (!ck_password.test(psw_val)) {
            $(this).siblings('.error').show().html(
                "<i class='icon-error'></i>密码不符合要求，请输入6-20位字母，数字或者下划线");
        } else {
            $(this).siblings('.error').hide();
        }
    })
    // 确认密码
    $('#confirm_newPassword').blur(function () {
        var psw_val = $("#newPassword").val(); //获取密码
        var confirm_val = $(this).val(); //确认密码
        if (confirm_val == '') {
            $(this).siblings('.error').show().html("<i class='icon-error'></i>请再次输入密码");
        } else if (!(psw_val === confirm_val)) {
            $(this).siblings('.error').show().html("<i class='icon-error'></i>两次输入的密码不一致");
        } else {
            $(this).siblings('.error').hide();
        }
    });

    // 身份证
    var idcardReg = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;

    $('#authenticIdCard').blur(function() {
        var _ID = $(this).val();
        if (_ID  == '') {
            $(this).siblings('.error').show().html("<i class='icon-error'></i>请输入身份证号");
        } else if (!idcardReg.test(_ID)) {
            $(this).siblings('.error').show().html(
                "<i class='icon-error'></i>身份证格式不正确");
        } else {
            $(this).siblings('.error').hide();
        }
    })
})