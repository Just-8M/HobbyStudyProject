<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>添加课程</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <style>
        body{
            padding:0 30px;
        }
        .page-header{
            padding: 0 15px;
            margin-top: 20px;
        }
        /* 清除bootstrap默认的input：date的line-height */
        input[type="date"]{
            line-height: normal !important;
        }
        /* 设置提示信息的颜色 */
        .form-horizontal .form-group  .tip-info{
            color: #e5224c;
            line-height: 30px;
        }
        /* 修改二级联动select 的宽度 */
        #category select{
            width: 16.66666667%;
            margin-left: 15px;
        }
        /* 修改textarea的高度 */
        textarea{
            min-height: 120px !important;
        }
        /* 上传视频按钮 */
        .form-horizontal .form-group #uploadmv,#courseDetail{
            width: 130px;
            opacity: 0;
        }
        .form-horizontal .form-group .uploadfile{
            width: 130px;
            text-align: center;
            background: #337ab7;
            color: #fff;
            cursor: pointer;
            position: absolute;
            margin-top: -28px;
        }
        .filename{
            display: block;
            margin-top: 10px;
        }
        /* 给日期加- */
        .line{
            position: absolute;
            line-height: 34px;
            margin-left: 30%; 
        }
        /* 存放照片：课程大纲详情 */
        .onload_photo_box {
            width: 120px;
            height: 120px;
            float: left;
            margin: 5px;
        }
        .onload_photo_box img {
            width: 120px;
            height: 120px;
        }
        .onload_photo_box .delete {
            display: none;
            cursor: pointer;
            width: 100%;
            height: 25px;
            background: rgba(221, 216, 216, 0.8) url(../images/iconfont/delete.png) no-repeat center;
            background-size: 20px 20px;
            opacity: 0.8;
            margin-top: -25px;
        }
    </style>
</head>

<body>

    <div class="page-header cf">
        <h4 class="lf">课程管理 <small>添加课程</small></h4>
        <div class="btn-list rt">
            <button class="btn btn-primary" id="edit">编辑</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="container">
        <form class="form-horizontal">
            <!-- 课程名 -->
            <div class="form-group">
                <label for="courseName" class="col-sm-2 control-label">课程名称</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="courseName" placeholder="请输入课程名称" required>
                    <p class="tip-info">课程名不得包含特殊字符，仅字母和汉字;</p>
                </div>
            </div>
            <!-- 分类：二级联动 -->
            <div class="form-group">
                <label for="hobbyType" class="col-sm-2 control-label">课程分类</label>
                <div id="category">
                    <!-- 存放select -->
                </div>
            </div>
            <!-- 视频简介 -->
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">课程封面</label>
                <div class="col-sm-2">
                    <input type="file" id="uploadmv" name="courseCover">
                    <div class="uploadfile form-control">选择文件</div>
                    <!-- 存放文件名 -->
                    <span class="filename"></span>
                </div>
                <div class="col-sm-8">
                    <p class="tip-info">视频将展示在课程详情页，建议上传课程成果，大纲或介绍</p>
                </div>
            </div>
            <!-- 课程简介 -->
            <div class="form-group">
                <label for="courseIntro" class="col-sm-2 control-label">课程简介</label>
                <div class="col-sm-8">
                    <textarea id="courseIntro" class="form-control"></textarea>
                </div>
            </div>
            <!-- 开课时间 -->
            <div class="form-group">
                <label class="col-sm-2 control-label">开课时间</label>
                <div class="col-sm-2">
                    <input type="date" class="form-control" id="starTime">
                </div>
                <div class="col-sm-2">
                    <input type="date" class="form-control" id="endTime">
                </div>
                <div class="col-sm-4">
                    <p class="tip-info">因课程需要审核，建议合理安排日期</p>
                </div>
                <div class="line"><i class="glyphicon glyphicon-minus"></i></div>
            </div>
            <!-- 课程时长 -->
            <div class="form-group">
                <label for="totalTime" class="col-sm-2 control-label">课程时长</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="totalTime" placeholder="请输入该课程的总课时" required>
                </div>
                <div class="col-sm-4">
                    <p class="tip-info">请输入该课程所需的总课时数，如60h（小时）</p>
                </div>
            </div>
            <!-- 学时安排 -->
            <div class="form-group">
                <label for="schedule" class="col-sm-2 control-label">学时安排</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="schedule" placeholder="请输入课时安排" required>
                </div>
                <div class="col-sm-4">
                    <p class="tip-info">如每周一三五，每天18:00~21:00，每周2课时等</p>
                </div>
            </div>
            <!-- 售前咨询 -->
            <div class="form-group">
                <label for="conversation" class="col-sm-2 control-label">联系方式</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="conversation" placeholder="请输入QQ号，微信号或手机号等">
                </div>
                <div class="col-sm-4">
                    <p class="tip-info">（可不填）建议留下联系方式方便用户交流</p>
                </div>
            </div>
            <!-- 课程大纲 -->
            <div class="form-group">
                <label for="courseDetail" class="col-sm-2 control-label">课程详情</label>
                <div class="col-sm-2">
                    <input type="file" class="form-control" id="courseDetail" name="courseDetailCover">
                    <div class="uploadfile form-control">选择文件</div>
                </div>
                <div class="col-sm-6">
                    <p class="tip-info">课程大纲仅支持图片格式（JPG，PNG等），可以展示您在该兴趣领域的照片或者课程的教学内容大纲等；</p>
                </div>
            </div>
            <div class="form-group">
                <!-- 用于存放上传的图片 -->
                <div class="col-sm-offset-2 col-sm-8 cf" id="uploadPic">
                </div>
            </div>
            <!-- 价格 -->
            <div class="form-group">
                <label for="coursePrice" class="col-sm-2 control-label">价格</label>
                <div class="col-sm-4">
                    <!-- <input type="number" class="form-control" id="coursePrice"> -->
                    <div class="input-group">
                        <span class="input-group-addon">￥</span>
                        <input type="text" class="form-control"  id="coursePrice"  aria-label="Amount (to the nearest dollar)">
                        <span class="input-group-addon">.00</span>
                    </div>
                </div>
                <div class="col-sm-4">
                    <p class="tip-info">（输入数字）若课程免费请输入“免费”</p>
                </div>
            </div>
            <!-- 提交 -->
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-2">
                    <button type="submit" class="btn btn-default">预览</button>
                </div>
                <div class="col-sm-2">
                    <button type="button"  id="addCourseSubmit"  class="btn btn-default">提交</button>
                </div>
            </div>
        </form>
    </div>

    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.min.js"></script>
    <script>
        $(function () {
            $('input').attr('disabled', 'disabled');
            $('textarea').attr('disabled', 'disabled');
            $('select').attr('disabled', 'disabled');
            // 点击编辑才可以编辑
            $('#edit').click(function () {
                $('input').removeAttr('disabled');
                $('textarea').removeAttr('disabled');
                $('select').removeAttr('disabled');
            })

            // 获取上传本地视频的文件名
            $('.uploadfile').click(function () {
                $(this).siblings('input').click();
            })
            $("#uploadmv").change(function (e) {
                var fileName = this.files[0].name;
                $(this).siblings('.filename').text(fileName);
            });

            // 获取课程大纲图片缩略图
            $('#courseDetail').on("change", function () {
                //获取选择图片的个数
                var files = this.files;

                $.each(files, function (key, value) {
                    var div = document.createElement("div"),
                        img = document.createElement("img");
                    del = document.createElement("span");
                    div.className = "onload_photo_box";
                    del.className = "delete";


                    var fr = new FileReader();
                    fr.onload = function () {
                        img.src = this.result;
                        div.append(img);
                        //克隆新元素
                        var clone_del = del.cloneNode(true); //默认参数是false
                        div.appendChild(clone_del);
                        document.getElementById('uploadPic').appendChild(div);
                    }
                    fr.readAsDataURL(value);
                })

            })
            // 鼠标移入显示删除
            $('#uploadPic').on('mouseenter', 'div.onload_photo_box img', function () {
                $(this).siblings('.delete').css('display', 'block').parent().siblings().children(
                    '.delete').css('display', 'none');
            });
            $('#uploadPic').on('mouseleave', 'div.onload_photo_box .delete', function () {
                $(this).css('display', 'none');
            });
            $('#uploadPic').on('click', 'div.onload_photo_box .delete', function () {
                $(this).parents('.onload_photo_box').remove();
            });
        })

        window.onload = function () {
            // 兴趣类型
            var data = {
                "0": [{
                        "categoryid": "1",
                        "categoryname": "音乐乐器",
                        "pid": "0"
                    },
                    {
                        "categoryid": "2",
                        "categoryname": "美术",
                        "pid": "0"
                    },
                    {
                        "categoryid": "3",
                        "categoryname": "舞蹈",
                        "pid": "0"
                    },
                    {
                        "categoryid": "4",
                        "categoryname": "健身运动",
                        "pid": "0"
                    },
                    {
                        "categoryid": "5",
                        "categoryname": "功夫",
                        "pid": "0"
                    },
                    {
                        "categoryid": "6",
                        "categoryname": "语言表演",
                        "pid": "0"
                    },
                    {
                        "categoryid": "7",
                        "categoryname": "技能软件",
                        "pid": "0"
                    },
                    {
                        "categoryid": "8",
                        "categoryname": "其他",
                        "pid": "0"
                    }
                ],
                "1": [{
                        "categoryid": "11",
                        "categoryname": "乐理知识",
                        "pid": "1"
                    },
                    {
                        "categoryid": "12",
                        "categoryname": "钢琴",
                        "pid": "1"
                    },
                ],
                "2": [{
                        "categoryid": "21",
                        "categoryname": "书法",
                        "pid": "2"
                    },
                    {
                        "categoryid": "22",
                        "categoryname": "素描",
                        "pid": "2"
                    },
                ],
                "3": [{
                        "categoryid": "31",
                        "categoryname": "mv舞",
                        "pid": "3"
                    },
                    {
                        "categoryid": "32",
                        "categoryname": "爵士",
                        "pid": "3"
                    },
                ],
                "4": [{
                        "categoryid": "41",
                        "categoryname": "瑜伽",
                        "pid": "4"
                    },
                    {
                        "categoryid": "42",
                        "categoryname": "射箭",
                        "pid": "4"
                    },
                ],
                "5": [{
                        "categoryid": "51",
                        "categoryname": "跆拳道",
                        "pid": "5"
                    },
                    {
                        "categoryid": "52",
                        "categoryname": "散打",
                        "pid": "5"
                    },
                ],
                "6": [{
                        "categoryid": "61",
                        "categoryname": "小语种",
                        "pid": "6"
                    },
                    {
                        "categoryid": "62",
                        "categoryname": "主持",
                        "pid": "6"
                    },
                ],
                "7": [{
                        "categoryid": "71",
                        "categoryname": "办公软件",
                        "pid": "7"
                    },
                    {
                        "categoryid": "72",
                        "categoryname": "CAD",
                        "pid": "7"
                    },
                ],
                "8": [{
                        "categoryid": "81",
                        "categoryname": "魔术",
                        "pid": "8"
                    },
                    {
                        "categoryid": "82",
                        "categoryname": "插花",
                        "pid": "8"
                    }
                ]
            }
            load(data);

            function load(data) {
                var oBox = document.getElementById('category');

                createSelect(0);
                //创建新的选项
                function createSelect(pid) {
                    if (data[pid] == undefined) { //检测数据是否存在
                        return;
                    }
                    var aCurData = data[pid]; //需要加载的数据，依靠pid取得
                    var oSelect = document.createElement('select');
                    // oSelect.className =  "col-sm-2";
                    oSelect.className = " form-control";
                    oSelect.className += " lf";
                    oBox.appendChild(oSelect);
                    //创建选项列表
                    for (var i = 0; i < aCurData.length; i++) {
                        var oOption = document.createElement('option');
                        oOption.innerHTML = aCurData[i].categoryname; //添加显示内容
                        oOption.value = aCurData[i].categoryid; //添加id
                        oSelect.appendChild(oOption)
                        if (i == 0) {
                            createSelect(aCurData[i].categoryid) //加载列表第一个对应的选项
                        }
                    }

                    var aSelect = oBox.getElementsByTagName('select');
                    for (var i = 0; i < aSelect.length; i++) {
                        //切换选项
                        aSelect[i].index = i;
                        aSelect[i].onchange = function () {
                            var pid = this.value;
                            var len = aSelect.length;
                            //删除原有的节点
                            for (var n = this.index + 1; n < len; n++) {
                                oBox.removeChild(aSelect[this.index + 1]);
                            }
                            //加载新的数据
                            createSelect(pid);
                        }
                    }
                }
            }
        }
    </script>
    <script type="text/javascript">
	   $(function(){
	        $("#addCourseSubmit").click(function () {
	        	var fileObj1 = document.getElementById("uploadmv").files[0];   //  课程封面
	        	
	        	var fileObj2 = document.getElementById("courseDetail").files[0];   //  课程详情
	        	/* if (typeof (fileObj1) == "undefined" || fileObj1.size <= 0) {
	        		alert("请选择上传的图片！");
	        		return;
	        	}
	        	if (typeof (fileObj2) == "undefined" || fileObj2.size <= 0) {
	        		alert("请选择上传的图片！");
	        		return;
	        	} */
	        	var courseName = $("#courseName").val();          		/* 课程名称 */
	        	var courseIntro = $("#courseIntro").val();      		/* 课程简介 */
	        	var starTime = $("#starTime").val();        		    /* 开课时间 */
	        	var endTime = $("#endTime").val();        		        /* 结束时间 */
	        	var totalTime = $("#totalTime").val();        		    /* 课程时长 */
	        	var schedule = $("#schedule").val();        		    /* 学时安排 */
	        	var coursePrice = $("#coursePrice").val();        	    /* 课程价格 */
	        	if (courseName != "") {
		        	var formFile = new FormData();
		        	formFile.append("name", courseName);
		        	formFile.append("brief", courseIntro);
		        	formFile.append("timespanStart", starTime);
		        	formFile.append("timespanEnd", endTime);
		        	formFile.append("time", totalTime); 
		        	formFile.append("courseSchedule", schedule); 
		        	formFile.append("price", coursePrice); 
		        	formFile.append("courseCover", fileObj1); 
		        	formFile.append("courseDetailCover", fileObj2);
		        	alert("nihao ")
		        	var data = formFile;
		        	$.ajax({
		        		url : "${pageContext.request.contextPath}/CourseListCntroller/addCourse",
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