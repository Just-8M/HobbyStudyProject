<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>账号设置-趣学网</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo/light_favicon@32.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/personCenter.css">
</head>

<body>
<!--引入公共头部-->
 <%@include file="../../../common/header.jsp" %>
    <div class="container">
        <div class="row">
            <!-- 左侧导航栏 -->
            <div class="col-md-3 left_nav">
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading">账户管理</div>
                    <div class="panel-body">
                        <div class="profile">
                            <img class="profile_img" src="${pageContext.request.contextPath}/images/iconfont/default1.png">
                            <div class="update-avator" style="display: none">
                                <p><a href="javascript:;" data-toggle="modal" data-target="#changeProfile">更换头像</a></p>
                            </div>
                            <!-- 更换头像弹框 -->
                            <div class="modal fade bs-example-modal-sm" id="changeProfile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog modal-sm" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                                    aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">更改头像</h4>
                                        </div>
                                        <div class="modal-body ">
                                            <!-- 存放头像框 -->
                                            <div class="row">
                                                <div class="col-xs-6 col-md-3">
                                                    <img src="" id="changePhoto-img" class="changePhoto">
                                                </div>
                                            </div>
                                            <!-- 上传头像按钮 -->
                                            <div class="upload-profile">
                                                <input type="file" name="changePhoto" id="onload_change_profile" accept="img">
                                                <button class="btn btn-link onload_link">上传头像</button>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                            <button type="button" class="btn btn-primary save-profile">保存</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="user_info">
                            <h4 class=" text-center">${USER_IN_SESSION.userid}</h4>
                            <ul class="authentication">
                                <li class="auth_item">
                                    <!-- 若用户已经认证则将title改为 “你已实名认证” -->
                                    <div class="ico_wrap" data-toggle="tooltip" data-placement="bottom" title="你已实名认证"><i
                                            class="icon-shimingrenzheng active"></i></div>
                                </li>
                                <li class="auth_item">
                                    <!-- 若用户已经认证则将title改为 “你已学籍认证” -->
                                    <div class="ico_wrap" data-toggle="tooltip" data-placement="bottom" title="还未学籍认证"><i
                                            class="icon-certificate"></i></div>
                                </li>
                                <li class="auth_item">
                                    <!-- 若用户已经认证则将title改为 “你已绑定手机” -->
                                    <div class="ico_wrap" data-toggle="tooltip" data-placement="bottom" title="还未绑定手机"><i
                                            class="icon-phone"></i></div>
                                </li>
                                <li class="auth_item">
                                    <!-- 若用户已经认证则将title改为 “你已绑定邮箱” -->
                                    <div class="ico_wrap" data-toggle="tooltip" data-placement="bottom" title="还未绑定邮箱"><i
                                            class="icon-youxiang"></i></div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- List group -->
                    <div class="list-group">
                        <a href="javascript:void(0);" class="list-group-item active">
                            个人信息
                        </a>
                        <a href="javascript:void(0);" class="list-group-item">账号绑定</a>
                        <a href="javascript:void(0);" class="list-group-item">实名认证</a>
                        <a href="javascript:void(0);" class="list-group-item">学籍认证</a>
                        <a href="javascript:void(0);" class="list-group-item">领学者管理</a>
                    </div>
                </div>
            </div>
            <!-- 右侧内容区域 -->
            <div class="col-md-9  right_content_box">
                <!-- 个人信息 -->
                <div class="right_item user_data_box" id="user_data">
                    <div class="right_item_title">
                        <p>个人信息</p>
                    </div>
                    <div class="right_item_body">
                        <!-- 个人信息表单 -->
                        <form class="form-horizontal" id="infoFrom">
                            <!--HobbyStudyId  -->
                            <div class="form-group">
                                <label for="userId" class="col-sm-2 control-label">HobbyStudyId</label>
                                <div class="col-sm-8">
                                    <input class="form-control" id="userId" type="text" placeholder="${USER_IN_SESSION.userid}"
                                        disabled> 
                                </div>
                            </div>
                            <!--用户昵称  -->
                            <div class="form-group">
                                <label for="userName" class="col-sm-2 control-label">用户昵称</label>
                                <!--方便后面获取值  -->
                                <div class="userid" id="Login_userid_display" style="display: none;">${PersonCenterDetaild.userid}</div>  
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="userName" placeholder="{{随机名字}}" maxlength="10">
                                </div>
                            </div>
                            <!-- 性别 -->
                            <div class="form-group">
                                <label for="sex" class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-2 dropdown" id="sex">
                                    <select class="form-control" name="性别" id="sex">
                                        <option value="1">男</option>
                                        <option value="2">女</option>
                                        <option value="0">保密</option>
                                    </select>
                                </div>
                            </div>
                            <!--  所在地区-->
                            <div class="form-group">
                                <label for="userAdress" class="col-sm-2 control-label">所在地区</label>
                                <div class="col-sm-9">
                                    <div class="location cf" data-toggle="distpicker">
                                        <!--定义省市区三级级联-->
                                        <div class="province_select lf">
                                            <select class="form-control" id="eprovinceName" data-province="---- 选择省 ----"
                                                name="provinceName"></select>
                                        </div>
                                        <div class="city_select lf">
                                            <select class="form-control" id="ecityName" data-city="---- 选择市 ----" name="cityName"></select>
                                        </div>
                                        <div class="district_select lf">
                                            <select class="form-control" id="edistrictName" data-district="---- 选择区 ----"
                                                name="districtName"></select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--个性签名  -->
                            <div class="form-group">
                                <label for="signature" class="col-sm-2 control-label">个性签名</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="signature" placeholder="最多可输入20字"
                                        maxlength="20"> </div>

                            </div>
                            <!-- 个人简介 -->
                            <div class="form-group">
                                <label for="PI" class="col-sm-2 control-label">个人简介</label>
                                <div class="col-sm-8">
                                    <textarea name="signature" id="PI" maxlength="200" placeholder="最多可输入200字"></textarea>
                                </div>
                            </div>
                             <!-- 提交按钮：保存 -->
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-3 cf">
                                    <button type="button" class="btn  btn-danger saveInfo lf" id="user_data_btn">保存</button>
                                    <button type="button" class="btn btn-primary edit lf">编辑</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!--账户绑定  -->
                <div class="right_item account_box" id="security" style="display:none">
                    <div class="right_item_title">
                        <p>账户绑定</p>
                    </div>
                    <div class="right_item_body">
                        <!-- 邮箱绑定 -->
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="${pageContext.request.contextPath}/images/iconfont/ic_email.png">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">邮箱 <span class="status status-red">未绑定/绑定的邮箱号</span></h4>
                                <p>可用邮箱加密码登录趣学网，可用邮箱找回密码</p>
                            </div>
                            <div class="media-right">
                                <button class="btn btn-default" data-toggle="modal" data-target="#EmailModal">更改</button>
                            </div>
                        </div>

                        <!-- 邮箱模态框 -->

                        <div class="modal fade" id="EmailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                                aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">绑定邮箱</h4>
                                    </div>
                                    <div class="modal-body">
                                        <!-- 如果已绑定邮箱则显示 -->
                                        <div class="changeEmail">
                                            你当前已绑定邮箱<span class="bindEmail">XXXXXXXX@xx.com</span>
                                            <button type="button" class="btn changeEmail_btn">更改</button>
                                        </div>
                                        <!-- 更改邮箱 -->
                                        <form class="form-horizontal" id="emailForm" style="display:none">
                                            <div class="form-group">
                                                <label for="email" class="col-sm-2 control-label">邮箱</label>
                                                <div class="col-sm-10">
                                                    <input type="email" class="form-control" id="email" placeholder="请输入您的邮箱"
                                                        required>
                                                    <button type="button" class="sendBtn" id="sendCode">
                                                       			 发送验证码
                                                    </button>
                                                    <div class="error"></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="emailCode" class="col-sm-2 control-label">验证码</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="emailCode" placeholder="请输入验证码"
                                                        required>
                                                        <div class="error"></div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                        <button type="submit" class="btn btn-primary">确定</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- 手机绑定 -->
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="./images/iconfont/phone.png" alt="...">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">手机 <span class="status status-red">未绑定/绑定的手机号</span></h4>
                                <p>可用手机号加密码登录趣学网，可通过手机号找回密码</p>
                            </div>
                            <div class="media-right">
                                <button class="btn btn-default" data-toggle="modal" data-target="#phoneModal">立即绑定/更改</button>
                            </div>
                        </div>
                        <!-- 手机绑定模态框 -->
                        <div class="modal fade" id="phoneModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                                aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">绑定手机</h4>
                                    </div>
                                    <div class="modal-body">
                                        <!-- 绑定手机号 -->
                                        <form class="form-horizontal" id="phoneForm">
                                            <div class="form-group">
                                                <label for="phone" class="col-sm-2 control-label">手机号</label>
                                                <div class="col-sm-10">
                                                    <input type="phone" class="form-control" id="phone" placeholder="请输入您的手机号"
                                                        required>
                                                    <button type="button" class="sendBtn" id="sendPhoneCode">
                                                        		发送验证码
                                                    </button>
                                                    <div class="error"></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="phoneCode" class="col-sm-2 control-label">验证码</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="phoneCode" placeholder="请输入验证码"
                                                        required>
                                                    <div class="error"></div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                        <button type="submit" class="btn btn-primary">确定</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- 密码修改 -->
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="${pageContext.request.contextPath}/images/iconfont/password.png" alt="...">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">密码 <span class="status">已设置</span></h4>
                                <p>用于保护账号信息和登录安全</p>
                            </div>
                            <div class="media-right">
                                <button class="btn btn-default" data-toggle="modal" data-target="#passwordModal">更改</button>
                            </div>
                        </div>
                        <!-- 密码Modal -->
                        <div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                                aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">修改密码</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" id="passwordForm">
                                            <div class="form-group">
                                                <label for="formerPassword" class="col-sm-2 control-label">原始密码</label>
                                                <div class="col-sm-10">
                                                    <input type="password" class="form-control" id="formerPassword"
                                                        placeholder="输入原始密码" required>
                                                    <div class="error"></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="newPassword" class="col-sm-2 control-label">新密码</label>
                                                <div class="col-sm-10">
                                                    <input type="password" class="form-control" id="newPassword"
                                                        placeholder="输入新密码" required>
                                                        <div class="error"></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="confirm_newPassword" class="col-sm-2 control-label">确认密码</label>
                                                <div class="col-sm-10">
                                                    <input type="password" class="form-control" id="confirm_newPassword"
                                                        placeholder="确认新密码" required>
                                                    <div class="error"></div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="forgetPassword.jsp" class="col-sm-3 forgetPsw" style="text-align:left">忘记密码？</a>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                        <button type="submit" class="btn btn-primary" id="updatePasswordbutton">确定</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- 社交软件：qq，微信 -->
                        <div class="media cf">
                            <div class="media-left">
                                <img class="media-object" src="${pageContext.request.contextPath}/images/iconfont/society.png" alt="...">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">社交账号</h4>
                                <p>绑定第三方账号，可以直接登录，还可以将内容同步到以下平台，与更多好友分享</p>
                            </div>
                            <!-- 绑定qq -->
                            <div class="media media-soceity">
                                <div class="media-left">
                                    <a href="#">
                                        <i class="media-object  icon-QQ"></i>
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">qq<span class="status status-red">未绑定</span></h4>
                                    <button class="btn btn-default">立即绑定</button>
                                </div>
                            </div>
                            <!-- 绑定微信 -->
                            <div class="media media-soceity">
                                <div class="media-left">
                                    <a href="#">
                                        <i class="media-object  icon-wechat"></i>
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">微信<span class="status status-red">未绑定</span></h4>
                                    <button class="btn btn-default">立即绑定</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 实名认证 -->
                <div class="right_item authenticate_box" id="authenticate" style="display:none">
                    <div class="right_item_title">
                        <p>实名认证</p>
                    </div>
                    <div class="right_item_body">
                        <div class="authentic_wrap">
                            <button class="btn star_authentic" data-toggle="modal" data-target="#authentic">开始认证</button>
                        </div>
                        <!-- 点击开始认证弹出上传身份证弹框 -->
                        <div class="modal fade" id="authentic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                                aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">实名认证</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal"  method="Post"  action="${pageContext.request.contextPath}/addFormAuthentic"  enctype="multipart/form-data" >
                                            <div class="form-group">
                                                <label for="authenticName" class="col-sm-3 control-label">真实姓名</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="authenticName"
                                                        placeholder="请输入您的真实姓名" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="authenticIdCard" class="col-sm-3 control-label">身份证号码</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="authenticIdCard"
                                                        placeholder="请输入您的身份证号码" maxlength="18" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="authenticIdPhoto" class="col-sm-3 control-label">身份证照片</label>
                                                <div class="col-sm-4">
                                                    <input type="file" class="form-control upload_IdPhoto" id="IdPhoto_front">
                                                    <div class="authenticIdPhoto_box photo_front">
                                                        <i class="glyphicon glyphicon-plus"></i>
                                                        <p>上传身份证正面照片</p>
                                                    </div>
                                                    <!-- 用于存放照片 -->
                                                    <img src="" id="front_img" name="front_img" class="ID_img front-img" >
                                                </div>
                                                <div class="col-sm-4">
                                                    <input type="file" class="form-control upload_IdPhoto" id="IdPhoto_reverse">
                                                    <div class="authenticIdPhoto_box photo_reverse">
                                                        <i class="glyphicon glyphicon-plus"></i>
                                                        <p>上传身份证反面照片</p>
                                                    </div>
                                                    <img src="" id="reverse_img" name="reverse_img" class="ID_img reverse-img">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                        <button type="button" class="btn btn-primary"  id="Certification_submit">提交审核</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 点击开始认证模态框结束 -->
                        <h4>认证须知</h4>
                        <ol class="authentic_notice" start="1">
                            <li>申请成为领学者需要完成实名认证</li>
                            <li>我们将在你提交身份证信息后的5个工作日（不包含节假日）内完成审核，审核结果将会以短信和系统通知的形式发送给你；</li>
                            <li>如若账号还未绑定手机，建议你提前绑定手机；</li>
                            <li>实名认证审核完成后，将无法修改和删除，请谨慎填写；</li>
                            <li>你需要准备身份证照片（需正反两面），请确保证件照片清晰可见</li>
                            <li>我们会确保你所提供的信息均处于严格的保密状态，不会泄露；</li>
                            <li>如存在恶意乱填写姓名，身份证号码，及上传与身份证证件无关图片者，一经发现将冻结趣学网账号。</li>
                        </Ol>
                    </div>
                </div>
                <!-- 学籍认证 -->
                <div class="right_item certificate_box" id="certificate" style="display:none">
                    <div class="right_item_title">
                        <p>学籍认证</p>
                    </div>
                    <div class="right_item_body">
                        <form class="form-horizontal col-sm-8 certificForm" id="certificForm">
                            <div style="color: #ffd102;margin-bottom: 20px">所有填写信息必须与学籍证明相同，如填写错误将无法通过 </div>
                            <div class="form-group">
                                <label for="realName" class="col-sm-2 control-label">真实姓名</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="realName"  required="required" placeholder="请输入真实姓名"
                                        >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="schoolName" class="col-sm-2 control-label">院校名称</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="schoolName"  required="required"  placeholder="请输入院校名称"
                                        >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="enterTime" class="col-sm-2 control-label">入学时间</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="enterTime"  required="required"  placeholder="请输入您的入学时间，如2015"
                                        >
                                </div>
                            </div>
                            <!--0：specialized、      1：collage、      2：postgraduate  -->
                            <div class="form-group">
                                <label for="degree" class="col-sm-2 control-label">学历层次</label>
                                <div class="col-sm-7">
                                    <select name="degree" id="degree" class="form-control">
                                        <option value="专科">专科</option>
                                        <option value="本科">本科</option>
                                        <option value="研究生">研究生</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="materia" class="col-sm-2 control-label">学籍证明</label>
                                <div class="col-sm-7">
                                    <input type="file" id="materia" name="file">
                                    <div class="file_box">选择上传文件</div>
                                    <a href="help.html" class="help_application">怎样申请学籍证明</a>
                                    <span id="img_name"></span>
                                </div>
                            </div>
                            <div class="form-group cf">
                                <button type="button" class="btn certificate_btn lf" id="certificate_btn">提交审核</button>
                                <button type="button" class="btn btn-primary edit lf">编辑</button>
                            </div>
                        </form>
                        <div class="col-sm-4">
                            <h4>认证须知</h4>
                            <ul class="certific_notice">
                                <li>• 你提交学籍证明后的5个工作日（不包含节假日）内完成审核，审核结果将会以系统通知的形式发送给你;</li>

                                <li>• 学籍证明中的身份证号码必须与实名认证中身份证信息保持一致。如有误，将无法通过审核。</li>

                                <li>• 上传学籍证明文件格式最好为PDF或JPG格式。</li>

                                <li>• 如存在恶意乱填写姓名，上传假信息，改动学籍证明内容或上传无关图片者，一经发现将冻结趣学网账号。</li>

                                <li>• 我们会确保你所提供的信息均处于严格的保密状态，不会泄露；</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- 领学者管理 -->
                <div class="right_item leader_manage" id="leader_manage" style="display:none">
                    <div class="right_item_title">
                        <p>领学者管理</p>
                    </div>
                    <div class="right_item_body">
                        <div class="right_item_body">
                            <div class="leaderManage_wrap">
                                <a href="${pageContext.request.contextPath}/courseManger?id=${USER_IN_SESSION.id}" class="btn publish_course">课程管理</a>
                            </div>
                            <!-- 点击开始认证模态框结束 -->
                            <h4>发布须知</h4>
                            <ol class="authentic_notice" start="1">
                                <li>发布课程功能仅供认证通过的领学者可使用</li>
                                <li>完成实名认证和学籍认证才可申请成为领学者</li>
                                <li>我们将在你提交课程后的5个工作日（不包含节假日）内完成审核，审核结果将会以短信和系统通知的形式发送给你；</li>
                                <li>如若账号还未绑定手机，建议你提前绑定手机；</li>
                                <li>我们会确保你所提供的信息均处于严格的保密状态，不会泄露；</li>
                                <li>如发布过程涉嫌不良内容者，一经发现将冻结趣学网账号。</li>
                            </Ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- 引入底部 -->
	 <%@ include file="../../../common/footer.jsp" %>
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <!-- 引入地区插件 -->
    <script src="${pageContext.request.contextPath}/plugins/js/distpicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/personCenter.js"></script>
    <!-- 修改个人信息 -->
    <script type="text/javascript">
    $(function () {
    	$('#user_data_btn').click(function() {
    	var userid = $('#Login_userid_display').text();
    	alert("userid" + userid);
    	var userName = $('#userName').val();
    	var gender = $('#sex  option:selected').val();
    	var eprovinceName = $('#eprovinceName  option:selected').val();
    	var ecityName = $('#ecityName  option:selected').val();
    	var edistrictName = $('#edistrictName  option:selected').val();
    	var signature = $('#signature').val();
    	var PI = $('#PI').val();
    	alert(userid +" == " +userName+"--" + gender+"--" + eprovinceName+"--" + ecityName+"--" + edistrictName+"--" + signature+"--" + PI+"--");
    	  $.ajax({
				url:'${pageContext.request.contextPath}/updatePersonInfor',
			    type:'POST',
			    dataType:'json',
			    data:{
			    	'userid':userid,
			    	'nickname':userName,
			    	'gender':gender,
			    	'province':eprovinceName,
			    	'city':ecityName,
			    	'district':edistrictName,
			    	'title':signature,
			    	'sign':PI
			    	},
			    success:function(data){
			    	alert('保存成功');
			    },
			    'error': function (data) {          // 失败，回调函数
                    alert("保存失败") ;
                } 
			});
    	});
    })
    </script>
    <!-- 修改密码 -->
    <script type="text/javascript">
    $(function () {
    	$('#updatePasswordbutton').click(function() {
        var userid = $('.userid').val();
    	var oldPassword = $('#formerPassword').val();   /* 原始密码 */
    	var newPassword = $('#newPassword').val();        /* 新密码 */
    	var confirm_newPassword = $('#confirm_newPassword').val();   /* 确认密码 */
    	/* alert(oldPassword+"--" +  newPassword+"--" +  confirm_newPassword+"--" +userid); */
    	  $.ajax({
				url:'${pageContext.request.contextPath}/updatePersonPsw',
			    type:'POST',
			    dataType:'json',
			    data:{
			    	'userid':userid,
			    	'oldPassword':oldPassword,
			    	'newPassword':newPassword
			    	},
			    'success':function(data){
			    	/* alert("data" + data); */
			    	if (data==true) {
				    	alert('修改成功');
				    	$('#passwordModal').modal('hide');
					}else{
						 $('#formerPassword').siblings('.error').show().html("<i class='icon-error'></i>原密码错误");
					}
			    },
			    'error': function (data) {         
                    alert("修改失败") ;
                } 
			});
    	});
    });
    </script>
    <!-- Ajax进行实名认证 -->
    <script type="text/javascript">
    	 $(function(){
    		  $("#Certification_submit").click(function () {
    			var front_img = document.getElementById("IdPhoto_front").files[0];       //  js 获取文件对象
    			var reverse_img = document.getElementById("IdPhoto_reverse").files[0];   //  js 获取文件对象
    			  alert("front_img:" + front_img + "reverse_img:" + reverse_img);
  	        	if (typeof (front_img) == "undefined" || front_img.size <= 0) {
  	        		alert("请选择上传的图片！");
  	        		return;
  	        	}
  	        	if (typeof (reverse_img) == "undefined" || reverse_img.size <= 0) {
  	        		alert("请选择上传的图片！");
  	        		return;
  	        	}
    			  var realName = $("#authenticName").val();   
    			  var Identity = $("#authenticIdCard").val();  
    			  if (realName != "" && Identity != "") {
    				alert("进入if");
    				var formFile = new FormData();
  		        	formFile.append("realname", realName);
  		        	formFile.append("Identity", Identity);
  		        	formFile.append("front_img", front_img);         //   图片对象
  		        	formFile.append("reverse_img", reverse_img);     //   图片对象 
  		        	var data = formFile;
  		        	$.ajax({
		        		url : "${pageContext.request.contextPath}/addFormAuthentic",
		        		type : 'post',
		        		dataType : 'json',
		        		data : data,
		        		cache: false,    //上传文件无需缓存
		        		processData: false,   // 用于对参数进行序列化处理，这里必须设为false
		        		contentType:false, // 必须
		        		success : function(data) {
		        			console.log(data);
		        			 if (data.state == 200) {
		        				alert(data.message);
		        			}
		        			if(data.state == 300){
		        				alert("图片上传失败！");
		        				return;
		        			}
		        		}
		        	}); 
    			  }else{
    				  if (realName == "") {
  						alert("请填写真实姓名");
  					}
    				 if (Identity == "") {
    					alert("请填写身份证号");
    				}
    			  }
    		  })
    	}) 
       /* 学籍认证 */
	   $(function(){
	        $("#certificate_btn").click(function () {
	        	var fileObj = document.getElementById("materia").files[0];   //  js 获取文件对象
	        	if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
	        		alert("请选择上传的图片！");
	        		return;
	        	}
	        	var realName = $("#realName").val();          		/* 真实姓名 */
	        	var schoolName = $("#schoolName").val();      		/* 院校名称 */
	        	var enterTime = $("#enterTime").val();        		/* 入学时间 */
	        	var degree = $('#degree  option:selected').val();   /* 学历 */
	        	if (realName != "" && schoolName != "" && enterTime != "") {
		        	var formFile = new FormData();
		        	formFile.append("realname", realName);
		        	formFile.append("collegeName", schoolName);
		        	formFile.append("enterTime", enterTime);
		        	formFile.append("education", degree);
		        	formFile.append("file", fileObj);     //  图片对象
		        	var data = formFile;
		        	$.ajax({
		        		url : "${pageContext.request.contextPath}/addForm",
		        		type : 'post',
		        		dataType : 'json',
		        		data : data,
		        		cache: false,   //上传文件无需缓存
		        		processData: false,   // 用于对参数进行序列化处理，这里必须设为false
		        		contentType:false, // 必须
		        		success : function(data) {
		        			console.log(data);
		        			 if (data.state == 200) {
		        				alert(data.message);
		        				/* var to = "${pageContext.request.contextPath}/picture/pictureList.do"; */   /* 进行再次请求 */
		        				/* doPost(to); */
		        			}
		        			if(data.state == 300){
		        				alert("图片上传失败！");
		        				return;
		        			}
		        		}
		        	}); 
	        	}else{
	        		if (realName == "") {
						alert("请填写真实姓名");
					}
	        		if (schoolName == "") {
						alert("请填写院校名称");
					}
	        		if (enterTime == "") {
						alert("请填写入学时间");
					}
	        	}
	        });
	    });
	</script>
</body>

</html>