$(function(){
    //点击标签切换对应登录方式的模块
    var userLogin = document.getElementById('userLogin');
    var emailLogin = document.getElementById('emailLogin');
    var underline = document.getElementById('underline');
    var userWay = document.getElementById('user_way');
    var emailWay = document.getElementById('email_way');
    userLogin.onclick = function(){
        userLogin.style.color = '#FFC125';
        emailLogin.style.color = '#000';
        underline.style.marginLeft = '0'; 
        userWay.style.display = 'block';
        emailWay.style.display = 'none';
        document.getElementById('forgotTxt').innerHTML = '忘记密码？';
    }
    emailLogin.onclick = function(){
        userLogin.style.color = '#000';
        emailLogin.style.color = '#FFC125';
        underline.style.marginLeft = '205px';
        userWay.style.display = 'none';
        emailWay.style.display = 'block';
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

    //邮箱号
    var $email= $('input[name="Email"]');
    var email_val = $.trim($email.val());
    var email_error = $('#email_error');
    // 验证邮箱正则规则
    var email_isvalid =  new RegExp(/^[a-z0-9A-Z]+[- | a-z0-9A-Z . _]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-z]{2,}$/);
    //倒计时
    var btn = document.getElementById('btn');
    var clock = '';	
    var nums = 60;	
    var btn;
    btn.onclick = function (){	    
        if($('input[name="Email"]').val() != '' && email_isvalid.test(email_val)){
            btn.style.disabled = true; //将按钮置为不可点击		
            btn.value = nums +'秒后可重新获取';		
            clock = setInterval(doLoop, 1000); //一秒执行一次
        }else{
            btn.style.disabled = true;
            email_error.text('请输入正确的邮箱号');
            $email.siblings('span').addClass('errorIco');
            $email.focus();
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

    $('input[name=Email"]').blur(function() {
        if(email_val == ""){
            email_error.text('请输入邮箱号');
            $email.siblings('span').addClass('errorIco');
            $email.focus();
            return;
        }else if(email_isvalid.test(email_val)){
            $(this).sinlings("span").css('display','none');
            email_error.text('');
            $email.next().removeClass('errorIco');
        }else{
            email_error.text('邮箱格式不正确');
            $email.next().addClass('errorIco');
            $email.focus();
            return;
        };
    });

    

    $('input[name="EmailCode"]').blur(function() {
        var $code= $('input[name="EmailCode"]'); 
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