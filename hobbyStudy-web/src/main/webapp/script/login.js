$(function(){
    //点击标签切换对应登录方式的模块
    var userLogin = document.getElementById('userLogin');
    var phoneLogin = document.getElementById('phoneLogin');
    var underline = document.getElementById('underline');
    var userWay = document.getElementById('user_way');
    var phoneWay = document.getElementById('phone_way');
    userLogin.onclick = function(){
        userLogin.style.color = '#FFC125';
        phoneLogin.style.color = '#000';
        underline.style.marginLeft = '0'; 
        userWay.style.display = 'block';
        phoneWay.style.display = 'none';
        document.getElementById('forgotTxt').innerHTML = '忘记密码？';
    }
    phoneLogin.onclick = function(){
        userLogin.style.color = '#000';
        phoneLogin.style.color = '#FFC125';
        underline.style.marginLeft = '205px';
        userWay.style.display = 'none';
        phoneWay.style.display = 'block';
        document.getElementById('forgotTxt').innerHTML = '';
    }



    //表单验证
    var name_psw =  new RegExp(/^[A-Z0-9a-z]{6,12}$/);

    $('input[name="username"]').blur(function() {
        var $name = $('input[name="username"]');
        var name_val = $.trim($name.val());
        var name_error = $('#name_error');
         //验证用户名
         if(name_val == ""){
            name_error.text('用户名不能为空');
            $name.focus();
            $name.next().addClass('errorIco');
            return;
        }else if(name_psw.test(name_val)){
            name_error.text('');
            $name.next().removeClass('errorIco');
        }else{
            name_error.text('用户名必须为6-12位数字或字母');
            $name.focus();
            $name.next().addClass('errorIco');
            return;
        };
    });
    $('input[name="password"]').blur(function() {
        var $psw = $('input[name="password"]');     
        var psw_val = $.trim($psw.val());
        var psw_error = $('#psw_error');
        //验证密码；
        if(psw_val == ""){
            psw_error.text('密码不能为空');
            $psw.next().addClass('errorIco');
            // $psw.focus();
            // return;
        }else if(name_psw.test(psw_val)){
            psw_error.text('');
            $psw.next().removeClass('errorIco');
        }else{
            psw_error.text('密码必须为6-12位数字或字母');
            $psw.next().addClass('errorIco');
            // $psw.focus();
            // return;
        };
    });

    //手机号
    var $phone= $('input[name="phoneNumber"]');
    var phone_val = $.trim($phone.val());
    var phone_error = $('#phone_error');
    // 验证手机正则规则
    var phone_isvalid =  new RegExp(/^(13[0-9]|15[012356789]|18[0-9]|17[678]|14[57])[0-9]{8}$/);
    //倒计时
    var btn = document.getElementById('btn');
    var clock = '';	
    var nums = 60;	
    var btn;
    btn.onclick = function (){	
        if($('input[name="phoneNumber"]').val() != '' && phone_isvalid.test(phone_val)){
            btn.style.disabled = true; //将按钮置为不可点击		
            btn.value = nums +'秒后可重新获取';		
            clock = setInterval(doLoop, 1000); //一秒执行一次
        }else{
            btn.style.disabled = true;
            phone_error.text('请输入正确的手机号');
            $phone.siblings('span').addClass('errorIco');
            $phone.focus();
            return;
        }	
    }

    function doLoop(){		
        nums--;		
        if(nums > 0){			
            btn.value = nums+'秒后可重新获取';		
        }else{			
            clearInterval(clock); //清除js定时器			
            btn.disabled = false;			
            btn.value = '点击发送动态码';			
            nums = 60; //重置时间		
            }	
    }

    $('input[name="phoneNumber"]').blur(function() {
        if(phone_val == ""){
            phone_error.text('手机号不能为空');
            $phone.siblings('span').addClass('errorIco');
            $phone.focus();
            return;
        }else if(phone_isvalid.test(phone_val)){
            phone_error.text('');
            $phone.next().removeClass('errorIco');
        }else{
            phone_error.text('手机号格式不正确');
            $phone.next().addClass('errorIco');
            $phone.focus();
            return;
        };
    });

    

    $('input[name="phoneCode"]').blur(function() {
        var $code= $('input[name="phoneCode"]'); 
        var code_val = $.trim($code.val());
        var verify_error = $('#verify_error');
        var vercode = new RegExp(/^[0-9]{6}$/);  
        //验证码
        if(code_val == ""){
            verify_error.text('验证码不能为空');
            $code.next().addClass('errorIco');
            // $code.focus();
            return;
        }else if(vercode.test(code_val)){
            verify_error.text('');
            $code.next().addClass('errorIco');
        }else{
            verify_error.text('验证码错误');
            $code.next().addClass('errorIco');
            // $code.focus();
            return;
        }
    })
   

})