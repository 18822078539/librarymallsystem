<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>在线书城</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/layui.css" media="all" rel="stylesheet">
<script src="resources/js/jquery.min.js" type="text/javascript"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="resources/js/layui.js" type="text/javascript"></script>
</head>
<body>
	<!--导航栏部分-->
	<jsp:include page="include/header.jsp" />

	<!-- 中间内容 -->
	<div class="container-fluid">
		<h1 class="title center">修改个人信息</h1>
		<br />
		<div style="width:700px;height:auto;margin:0 auto;">
			<form class="layui-form" action="user/updateUserInfo" method="post">
				<input type="hidden" name="userId" value="${user.userId }">
				<div class="layui-form-item">
					<label class="layui-form-label">积分</label>
					<div class="layui-input-block">
						<label class="layui-form-label" style="width: 150px">${user.userScore }-${user.level}</label>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">贡献值</label>
					<div class="layui-input-block">
						<label class="layui-form-label">${user.userDevote }</label>
						<button type="button" class="layui-btn layui-btn-xs" onclick="seeDetail()">查看明细</button>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">
						<input type="text" name="userName" id="userName" required
							lay-verify="required" placeholder="请输入用户名" value="${user.userName }"
							class="layui-input" />
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">电话</label>
					<div class="layui-input-block">
						<input type="text" name="userPhone" id="userPhone" required
							lay-verify="required" placeholder="请输入电话号码" value="${user.userPhone }"
							class="layui-input" />
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-block">
						<input type="text" name="userEmail" id="userEmail" required
							lay-verify="required" placeholder="请输入邮箱" value="${user.userEmail }"
							class="layui-input" />
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">修改头像</label>
					<div class="layui-input-block">
						<img style="width:100px;height:100px;" src="upload/${user.userImg }">
					
						<button type="button" class="layui-btn" id="test1">
						  <i class="layui-icon">&#xe67c;</i>上传图片
						</button>
						<div class="layui-input-block" style="display:inline-block;" id="viewPic"></div>
						<div id="newUserImg"></div>
					</div>
				</div>
				<div class="layui-form-item" style="padding-left:105px;">
					<button type="submit" class="layui-btn layui-btn-normal layui-btn-radius">修改</button>
					<button type="reset" class="layui-btn layui-btn-danger layui-btn-radius">重置</button>
				</div>
			</form>
		</div>
	</div>
	<div id="addMsg" style="display:none;width:800px;padding-top:10px;">
			<div class="layui-form-item">
				<div id="finishTask">

				</div>
			</div>
	</div>
	<!--尾部-->
	<jsp:include page="include/foot.jsp" />
	<script type="text/javascript">
		layui.use([ 'form','upload','layer' ], function() {
			var form = layui.form;
			var layer=layui.layer;
			var upload = layui.upload;
			var uploadInst = upload.render({
			    elem: '#test1' //绑定元素
			    ,url: 'user/upload' //上传接口
			    ,done: function(res){
			    	layer.msg('上传成功！', {
						icon : 1,
						time : 2000
					});
			    	var str="<input type='hidden' name='userImg' value="+res.userImg+" >";
			    	$("#newUserImg").html(str);
			    	$("#viewPic").html("新头像预览：<img style='width:100px;height:100px;' src='upload/"+res.userImg+"'>");
			    }
			    ,error: function(){
			    	layer.msg('上传失败，请重试！', {
						icon : 5,
						time : 2000
					});
			    }
			  });
		});

		$(function () {
            showUserTask();
        })

        function showUserTask() {
            $.post("userTask/findBySplitPage", {
                pageSize: 30,
                pageNum: 1
            }, function (r) {
                if (r.code === 0) {
                    console.info(r.msg);
                    var html = "";
                    for (var i = 0; i < r.msg.length; i++) {
                        var item = r.msg[i];
                        var str = "<div class=\"layui-card\">" +
                            "<li class=\"dropdown\"><a href=\"#\" class=\"dropdown-toggle\"" +
                            "data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\"" +
                            "aria-expanded=\"false\"><div style=\"margin-top:-5px;float:left;width:30px; height:30px; border-radius:50%; overflow:hidden;\"><img src=\"upload/" + item.userTaskUser.userImg + "\" style=\"width:30px;height:30px;\" class=\"layui-nav-img\"></div>&nbsp;&nbsp;" + item.userTaskUser.userName + "<span class=\"caret\"></span></a></li>" +
                            "<div>" + item.userTaskTask.taskTitle +"获得："+item.userTaskTask.taskScore+"分;获取途径："+(item.type==1?"贡献图书":"借阅图书")+
                            "</div>" +
                            "</div>";
                        html += str;
                    }
                    $("#finishTask").html("").append(html);

                } else {
                }
            });
        }

        /**
         * 触发查看明细事件
         */
        function seeDetail() {
            layer.open({
                type: 1,
                title: '贡献值明细',
                shade: 0.4,  //阴影度
                fix: false,
                shadeClose: true,
                maxmin: false,
                area: ['900px;', '240px;'],    //窗体大小（宽,高）
                content: $('#addMsg'),
                success: function (layero, index) {
                    var body = layer.getChildFrame('body', index); //得到子页面层的BODY
                    // $("#receiveid").val(friendid);
                    //form.render();
                    body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                },
                btn: ['确定','取消'],
                yes: function (index, layero) {

					layer.close(index);

                }
            })
        }
	</script>
</body>
</html>