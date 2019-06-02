<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="resources/css/layui.css" rel="stylesheet">
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="resources/js/layui.js" type="text/javascript"></script>
    <script src="resources/js/ajaxfileupload.js" type="text/javascript"></script>
    <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
    <style type="text/css">
        a {
            text-decoration: none;
            color: #333;
            out-line: none;
        }

        .layui-form-label {
            width: 100px;
        }
    </style>
</head>
<body>
<!--导航栏部分-->
<jsp:include page="include/header.jsp"/>
<!-- 中间内容 -->
<div class="container-fluid">
    <div class="row">
        <!-- 控制栏 -->
        <div class="col-sm-3 col-md-2 sidebar sidebar-1">
            <ul class="nav nav-sidebar">
                <li class="list-group-item-diy"><a
                        href="view/usercenter/#section1">收藏中心<span class="sr-only">(current)</span></a></li>
                <li class="list-group-item-diy"><a
                        href="view/usercenter/#section2">我的订单</a></li>
                <li class="list-group-item-diy"><a
                        href="view/usercenter/#section3">地址管理</a></li>
                <li class="list-group-item-diy"><a
                        href="view/usercenter/#section4">猜你喜欢</a></li>
                <li class="list-group-item-diy"><a
                        href="view/usercenter/#section5">账户安全</a></li>
                <li class="list-group-item-diy"><a
                        href="view/usercenter/#section6">书友圈</a></li>
                <li class="list-group-item-diy"><a
                        href="view/usercenter/#section7">好友申请<span class="layui-badge">${user.applyNum}</span></a></li>
                <li class="list-group-item-diy"><a
                        href="view/usercenter/#section8">我的预约</a></li>
                <li class="list-group-item-diy"><a
                        href="view/usercenter/#section9">联系客服</a></li>
                <li class="list-group-item-diy"><a
                        href="view/usercenter/#section9">我的贡献</a></li>
            </ul>
        </div>
        <!-- 控制内容 -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="col-md-12">
                <hr/>
                <h1>
                    <a name="section1">收藏中心</a>
                </h1>
                <hr/>
                <div class="col-lg-12 col-md-12 col-sm-12" id="productArea"></div>
                <br/>
            </div>

            <div class="col-md-12">
                <h1>
                    <a name="section2">我的订单</a>
                </h1>
                <hr/>
                <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                    <ul class="layui-tab-title">
                        <li class="layui-this">待付款</li>
                        <li>待发货</li>
                        <li>待收货</li>
                        <li>待评价</li>
                        <li>待归还</li>
                        <li>待确认</li>
                        <li>已完成</li>
                    </ul>
                    <div class="layui-tab-content" style="height: auto;">
                        <div class="layui-tab-item layui-show" id="state1">
                        </div>
                        <div class="layui-tab-item" id="state2"></div>
                        <div class="layui-tab-item" id="state3"></div>
                        <div class="layui-tab-item" id="state4"></div>
                        <div class="layui-tab-item" id="state5"></div>
                        <div class="layui-tab-item" id="state6"></div>
                        <div class="layui-tab-item" id="state7"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <hr/>
                <h1>
                    <a name="section3">地址管理</a>
                </h1>
                <hr/>
                <div class="col-sm-offset-2 col-md-offest-2" style="margin-left:0%;">
                    <div id="addrData">
                        <table class="layui-table">
                            <colgroup>
                                <col width="100">
                                <col width="150">
                                <col width="300">
                                <col width="340">
                                <col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th>收货人</th>
                                <th>电话</th>
                                <th>所在地区</th>
                                <th>详细地址</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>贤心</td>
                                <td>2016-11-29</td>
                                <td>人生就像是一场修行</td>
                                <td>人生就像是一场修行</td>
                                <td>
                                    <button class="layui-btn layui-btn-xs layui-btn-warm">编辑</button>
                                    <button class="layui-btn layui-btn-xs layui-btn-danger">删除</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <button onclick="addAddress()"
                            class="layui-btn layui-btn-normal layui-btn-lg layui-btn-fluid layui-btn-radius">添加地址
                    </button>
                </div>
            </div>

            <div class="col-md-12">
                <h1>
                    <a name="section4">猜你喜欢</a>
                </h1>
                <hr/>
                <table class="table table-hover center" id="recentViewArea">
                </table>
            </div>
            <div class="col-md-12">
                <h1>
                    <a name="section5">账户安全</a>
                </h1>
                <hr/>
                <table class="table table-hover center" id="acountSafeArea">
                    <div class="layui-card" style="margin-left: -20px;">
                        <div class="layui-card-header">修改密码</div>
                        <div class="layui-card-body" pad15="">

                            <div class="layui-form" lay-filter="">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">当前密码</label>
                                    <div class="layui-input-inline">
                                        <input type="password" name="oldPassword" lay-verify="required"
                                               lay-vertype="tips" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">新密码</label>
                                    <div class="layui-input-inline">
                                        <input type="password" name="password" lay-verify="required|pass"
                                               lay-vertype="tips" autocomplete="off" id="LAY_password"
                                               class="layui-input">
                                    </div>
                                    <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">确认新密码</label>
                                    <div class="layui-input-inline">
                                        <input type="password" name="repassword" lay-verify="required|repass"
                                               lay-vertype="tips" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit="" lay-filter="setmypass">确认修改</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </table>
            </div>
            <div class="col-md-12">
                <h1>
                    <a name="section6">书友圈</a>
                </h1>
                <hr/>
                <table class="table table-hover center" id="friendArea">
                    <div class="layui-tab">
                        <ul class="layui-tab-title">
                            <li class="layui-this">读书感想</li>
                            <li>留言板</li>
                            <li>我的好友</li>
                        </ul>
                        <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show">
                                <form class="layui-form" action="feels/saveFeel">
                                    <div class="layui-card">
                                        <div class="layui-card-body">
                                            <div class="layui-form-item layui-form-text">
                                                <label class="layui-form-label">我的感想</label>
                                                <div class="layui-input-block">
                                                    <textarea placeholder="请输入内容" class="layui-textarea"
                                                              name="feelcontent"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <button class="layui-btn" type="submit">发表</button>
                                        </div>
                                    </div>
                                </form>
                                <div id="readSay">

                                </div>
                            </div>
                            <div class="layui-tab-item">
                                <div id="readMsg">

                                </div>
                            </div>
                            <div class="layui-tab-item">
                                <div id="readFriend">

                                </div>
                            </div>
                        </div>
                    </div>

                </table>
            </div>
            <div class="col-md-12">
                <h1>
                    <a name="section7">好友申请</a>
                </h1>
                <hr/>
                <table class="table table-hover center" id="applyfriend">
                    <div class="layui-card" style="margin-left: -20px;">
                        <div class="layui-card-header">好友申请</div>
                        <div class="layui-card-body" pad15="">

                            <div class="layui-form" lay-filter="">
                                <div id="readApplyFriend">

                                </div>
                            </div>

                        </div>
                    </div>
                </table>
            </div>
            <div class="col-md-12">
                <hr/>
                <h1>
                    <a name="section8">我的预约</a>
                </h1>
                <hr/>
                <div class="col-lg-12 col-md-12 col-sm-12" id="subscribeBooks"></div>
                <br/>
            </div>
            <div class="col-md-12">
                <h1>
                    <a name="section6">联系客服</a>
                </h1>
                <hr/>
                <table class="table table-hover center">
                    <div class="layui-tab">
                        <ul class="layui-tab-title">
                            <li class="layui-this">联系客服</li>
                        </ul>
                        <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show">
                                <form class="layui-form" action="sysmsg/saveSysMsg">
                                    <div class="layui-card">
                                        <div class="layui-card-body">
                                            <div class="layui-form-item layui-form-text">
                                                <label class="layui-form-label">我的问题</label>
                                                <div class="layui-input-block">
                                                    <textarea placeholder="请输入内容" class="layui-textarea"
                                                              name="askMsg"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <button class="layui-btn" type="submit">发表</button>
                                        </div>
                                    </div>
                                </form>
                                <div id="sysmsg">

                                </div>
                            </div>

                        </div>
                    </div>

                </table>
            </div>
            <div class="col-md-12">
                <h1>
                    <a name="section9">我的贡献</a>
                </h1>
                <hr/>
                <table class="table table-hover center">
                    <div class="layui-tab">
                        <ul class="layui-tab-title">
                            <li class="layui-this">贡献任务</li>
                            <li>贡献图书</li>
                            <li>已完成任务</li>
                        </ul>


                        <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show">
                                <div id="devoteTask">

                                </div>
                            </div>
                            <div class="layui-tab-item">
                                <form class="layui-form" action="shareBook/share">
                                    <div class="layui-card">
                                        <div class="layui-card-body">
                                            <div class="layui-form-item layui-form-text">
                                                <label class="layui-form-label">图书名称</label>
                                                <div class="layui-input-block">
                                                    <textarea placeholder="请输入内容" class="layui-textarea"
                                                              name="bookName"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <button class="layui-btn" type="submit">上传</button>
                                        </div>
                                    </div>
                                </form>
                                <div id="devoteBooks">

                                </div>
                            </div>
                            <div class="layui-tab-item layui-show">
                                <div id="finishTask">

                                </div>
                            </div>

                        </div>
                    </div>

                </table>
            </div>
        </div>
    </div>
</div>

<div id="addMsg" style="display:none;width:800px;padding-top:10px;">
    <form id="formData" class="layui-form">
        <input type="hidden" name="receiveid" id="receiveid">
        <div class="layui-form-item">
            <label class="layui-form-label">留言内容</label>
            <div class="layui-input-block">
                <input type="text" name="content" id="content" required lay-verify="required" placeholder="请输入留言内容"
                       value="" class="layui-input"/>
            </div>
        </div>
    </form>
</div>

<div id="wuliu" style="display:none;width:800px;padding-top:10px;">
        <div class="layui-form-item">
            <label class="layui-form-label">提问内容</label>
            <div class="layui-input-block">
                <input type="text"  required lay-verify="required" placeholder="请输入提问内容"
                       value="" class="layui-input"/>
            </div>
        </div>
</div>

<div id="changeB" style="display:none;width:800px;padding-top:10px;">
    <div class="layui-form-item">
        <label class="layui-form-label">更换图书名称</label>
        <div class="layui-input-block">
            <input type="text"  required lay-verify="required" placeholder="请输入图书名称"
                   value="" class="layui-input"/>
        </div>
    </div>
</div>

<div id="tuikuanA" style="display:none;width:800px;padding-top:10px;">
    <div class="layui-form-item">
        <label class="layui-form-label">申请退款</label>
        <div class="layui-input-block">
            <input type="text"  required lay-verify="required" placeholder="请输入退款理由"
                   value="" class="layui-input"/>
        </div>
    </div>
</div>

<!-- 尾部 -->
<jsp:include page="include/foot.jsp"/>
<div class="layui-form" id="addrForm" style="display:none;padding-top:10px;">
    <form id="addrFormData">
        <input type="hidden" name="addrId" id="addrId"/>
        <div class="layui-form-item">
            <label class="layui-form-label">收货人名称</label>
            <div class="layui-input-inline">
                <input type="text" name="addrNickname" id="addrNickName" required lay-verify="required"
                       placeholder="请输入收货人名称" value="" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">收货人电话</label>
            <div class="layui-input-inline">
                <input type="text" name="addrPhone" id="addrPhone" required lay-verify="required" placeholder="请输入收货电话"
                       value="" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">请选择地区</label>
            <div class="layui-input-inline">
                <select name="addrProvince" id="proData" lay-filter="province" required lay-verify="required">
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="addrCity" id="cityData" lay-filter="city" required lay-verify="required">
                    <option value="">请选择市</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="addrArea" id="areaData" required lay-verify="required">
                    <option value="">请选择县/区</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">详细地址</label>
            <div class="layui-input-inline">
                <input style="width:590px;" type="text" name="addrDetail" id="addrDetail" placeholder="请输入详细地址" required
                       lay-verify="required" value="" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮政编码</label>
            <div class="layui-input-inline">
                <input type="text" name="addrZipcode" id="addrZipcode" required lay-verify="required"
                       placeholder="请输入邮政编码" value="" class="layui-input"/>
            </div>
        </div>
        <button style="display:none;" type="reset" id="resetBtn">重置</button>
    </form>
</div>
<div id="evaData" style="width:600px;padding-top:15px;display:none;">
    <form id="evaForm">
        <input type="hidden" id="evaOrderId" name="evaOrderId"/>
        <div class="layui-form-item">
            <label class="layui-form-label" style="padding-top:15px;">评分</label>
            <div class="layui-input-inline">
                <input type="hidden" name="evaLevel" required lay-verify="required" id="evaStar"/>
                <div id="evaLevel"></div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">评论图</label>
            <div class="layui-input-block">
                <button type="button" class="layui-btn" id="test2">多图片上传</button>
                <button type="button" class="layui-btn" id="test6">开始上传</button>
                <button type="button" class="layui-btn layui-danger" onclick="cleanImgsPreview()" id="cleanImgs">清空预览
                </button>
                预览图：
                <div class="layui-upload-list" id="demo2"></div>
            </div>
        </div>
        <input type="text" id="imgUrls" name="imgUrls" style="display: none;" class="layui-input">
        <div class="layui-form-item">
            <label class="layui-form-label">评价内容</label>
            <div class="layui-input-inline">
                <textarea rows="8" cols="50" required lay-verify="required" name="evaContent"></textarea>
            </div>
        </div>
        <button type="reset" style="display:none;" id="evaReset"></button>
    </form>
</div>
<script type="text/javascript">
    var layer;
    var element;
    var form;
    var rate;
    var upload;
    var success = 0;
    var fail = 0;
    var imgurls = "";
    layui.use(['layer', 'element', 'form', 'rate', 'upload'], function () {
        layer = layui.layer;
        element = layui.element;
        form = layui.form;
        rate = layui.rate;
        upload = layui.upload;
        form.render();
        element.render();
        form.verify({
            pass: function (value, item) { //value：表单的值、item：表单的DOM对象
                if (!/^[\S]{6,12}$/.test(value)) {
                    return '密码必须6到12位，且不能出现空格';
                }
            }
            //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
            //repass: [
            //  /^[\S]{6,12}$/,'密码必须6到12位，且不能出现空格'
            //]
            , repass: function (value, item) {
                var newpass = $("#LAY_password").val();
                if (newpass != value) {
                    return '两次密码输入不一致';
                }
            }
        });
        upload.render({
            elem: '#test2'
            , url: 'evaluate/uploadEvaImg'
            , multiple: true
            , number: 5
            , size: 10240
            , auto: false
            , bindAction: '#test6'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo2').append('<img style="width:70px;height:70px;" src="' + result + '" alt="' + file.name + '" class="layui-upload-img">')
                });
            }, done: function (res, index, upload) {
                //每个图片上传结束的回调，成功的话，就把新图片的名字保存起来，作为数据提交
                console.log(res.code);
                if (res.code == "1") {
                    fail++;
                } else {
                    success++;
                    imgurls = imgurls + "" + res.src + ",";
                }
                $('#imgUrls').val(imgurls);
            },
            allDone: function (obj) {
                layer.msg("总共要上传图片总数为：" + (fail + success) + "\n"
                    + "其中上传成功图片数为：" + success + "\n"
                    + "其中上传失败图片数为：" + fail
                )
            }
        });
        var ins1 = rate.render({
            elem: '#evaLevel',  //绑定元素
            theme: '#FF5722',
            choose: function (value) {
                $("#evaStar").val(value);
            }
        });
        form.on('submit(setmypass)', function (data) {
            $.ajax({
                type: "post",
                url: "user/modifyUserPass",
                data: "oldPass=" + data.field.oldPassword + "&newPass=" + data.field.password + "&rePass=" + data.field.repassword,
                success: function (data) {
                    if (data == "success") {
                        layer.alert('修改密码成功！请重新登陆！', {icon: 1}, function (index) {
                            window.location.href = "view/login";
                            layer.close(index);
                        });
                    } else {
                        layer.msg('修改密码失败！请重试！', {
                            icon: 5,
                            time: 2000
                        });
                    }
                }
            });
        });
        form.on('select(province)', function (data) {
            $.ajax({
                type: "post",
                url: "proCityArea/findCityByProId",
                data: "provinceId=" + data.value,
                dataType: "json",
                success: function (data) {
                    var str = "<option value=''>请选择市</option>"
                    for (var i = 0; i < data.length; i++) {
                        str = str + "<option value='" + data[i].cityId + "'>" + data[i].cityName + "</option>";
                    }
                    $("#cityData").html(str);
                    //form.render();
                }
            });
        });
        form.on('select(city)', function (data) {
            $.ajax({
                type: "post",
                url: "proCityArea/findAreaByCityId",
                data: "cityId=" + data.value,
                dataType: "json",
                success: function (data) {
                    var str = "<option value=''>请选择县/区</option>"
                    for (var i = 0; i < data.length; i++) {
                        str = str + "<option value='" + data[i].areaId + "'>" + data[i].areaName + "</option>";
                    }
                    $("#areaData").html(str);
                    // form.render();
                }
            });
        });
    });
    $(function () {
        showFavorite();
        showSubscribe();
        showReadyPayOrder();
        findReadyToDeliverOrder();
        findReadyToReceiveOrder();
        findReadyToEvaluateOrder();
        findFinishOrder();
        showUserAddress();
        showRecentView();
        showProvince();
        showAllFeels();
        showAllMessages();
        showAllFriends();
        showAllApply();
        showAllSysMsg();
        findSureOrder();
        findFinishSecOrder();
        showAllTask();
        showShareBooks();
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
                        "<div>" + item.userTaskTask.taskTitle +"获得："+item.userTaskTask.taskScore+"分"+
                        "</div>" +
                        "</div>";
                    html += str;
                }
                $("#finishTask").html("").append(html);

            } else {
            }
        });
    }

    function showShareBooks() {
        $.post("shareBook/findBySplitPage", {
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
                        "aria-expanded=\"false\"><div style=\"margin-top:-5px;float:left;width:30px; height:30px; border-radius:50%; overflow:hidden;\"><img src=\"upload/" + item.shareBookUser.userImg + "\" style=\"width:30px;height:30px;\" class=\"layui-nav-img\"></div>&nbsp;&nbsp;" + item.shareBookUser.userName + "<span class=\"caret\"></span></a></li>" +
                        "<div>" + item.shareBookName +
                        "</div>" +
                        "</div>";
                    html += str;
                }
                $("#devoteBooks").html("").append(html);

            } else {
            }
        });
    }

    function showAllTask() {
        $.post("devoteTask/findBySplitPage", {
            pageSize: 30,
            pageNum: 1
        }, function (r) {
            if (r.code === 0) {
                console.info(r.msg);
                var html = "";
                for (var i = 0; i < r.msg.length; i++) {
                    var item = r.msg[i];
                    var str = "<div class=\"layui-card\">" +
                        "<div>任务描述：" + item.taskTitle +
                        "</div>" +
                        "<div>任务分值：" + item.taskScore + " <button class=\"layui-btn layui-btn-xs\" onclick='finishtask(" + item.taskId +","+item.taskScore+ ")'>完成</button>" +
                        "</div>" +
                        "</div>";
                    html += str;
                }
                $("#devoteTask").html("").append(html);

            } else {
            }
        });
    }

    function finishtask(taskId,taskScore) {
        $.post("userTask/finishTask", {
            taskId: taskId,
            taskScore:taskScore
        }, function (r) {
            if (r === 'success') {
                parent.layer.msg('已完成，贡献值更新成功', {icon: 1, shade: 0.4, time: 1000});
                location.reload();
            } else {
                parent.layer.msg('操作异常', {icon: 1, shade: 0.4, time: 1000});
            }
        })
    }

    function showAllApply() {
        $.post("friendMap/findBySplitPage", {
            pageSize: 30,
            pageNum: 1,
            state: 0
        }, function (r) {
            if (r.code === 0) {
                console.info(r.msg);
                var html = "";
                for (var i = 0; i < r.msg.length; i++) {
                    var item = r.msg[i];
                    var str = "<div class=\"layui-card\">" +
                        "<div style=\"margin-top:-5px;float:left;width:30px; height:30px; border-radius:50%; overflow:hidden;\"><img src=\"upload/" + item.users.userImg + "\" style=\"width:30px;height:30px;\" class=\"layui-nav-img\"></div>&nbsp;&nbsp;" + item.users.userName +
                        "<div>" + item.ctime + " <button class=\"layui-btn layui-btn-xs\" onclick='agree(" + item.friendmapid + ")'>同意</button>" +
                        "</div>" +
                        "</div>";
                    html += str;
                }
                $("#readApplyFriend").html("").append(html);

            } else {
            }
        });
    }

    function agree(friendmapid) {
        $.post("friendMap/agree", {
            friendmapid: friendmapid
        }, function (r) {
            if (r.code === 0) {
                parent.layer.msg('已同意', {icon: 1, shade: 0.4, time: 1000});
                location.reload();
            } else {
                parent.layer.msg('操作异常', {icon: 1, shade: 0.4, time: 1000});
            }
        })
    }

    function cleanImgsPreview() {
        success = 0;
        fail = 0;
        $('#demo2').html("");
        $('#imgUrls').val("");
    }

    function showAllFeels() {
        $.post("feels/findBySplitPage", {
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
                        "aria-expanded=\"false\"><div style=\"margin-top:-5px;float:left;width:30px; height:30px; border-radius:50%; overflow:hidden;\"><img src=\"upload/" + item.users.userImg + "\" style=\"width:30px;height:30px;\" class=\"layui-nav-img\"></div>&nbsp;&nbsp;" + item.users.userName + "<span class=\"caret\"></span></a><ul class=\"dropdown-menu\"><li><a href=\"javascript:void(0)\" onclick='addFriend(" + item.users.userId + ")'>加好友</a></li></ul></li>" +
                        "<div>" + item.feelcontent +
                        "</div>" +
                        "<div>" + item.ctime +
                        "</div>" +
                        "</div>";
                    html += str;
                }
                $("#readSay").html("").append(html);

            } else {
            }
        });
    }

    function showAllSysMsg() {
        $.post("sysmsg/findAllByUser", {
            pageSize: 30, pageNum: 1
        }, function (r) {
            if (r.code === 0) {
                console.info(r.msg);
                var html = "";
                for (var i = 0; i < r.msg.length; i++) {
                    var item = r.msg[i];
                    var ans = item.answerMsg == null ? "暂无" : item.answerMsg;
                    var str = "<div class=\"layui-card\">" +
                        "<li class=\"dropdown\"><a href=\"#\" class=\"dropdown-toggle\"" +
                        "data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\"" +
                        "aria-expanded=\"false\"><div style=\"margin-top:-5px;float:left;width:30px; height:30px; border-radius:50%; overflow:hidden;\"><img src=\"upload/" + item.sendUser.userImg + "\" style=\"width:30px;height:30px;\" class=\"layui-nav-img\"></div>&nbsp;&nbsp;" + item.sendUser.userName + "<span class=\"caret\"></span></a></li>" +
                        "<div>" + item.askMsg +
                        "</div>" +
                        "<div>管理员答复：" + ans +
                        "</div>" +
                        "</div>";
                    html += str;
                }
                $("#sysmsg").html("").append(html);

            } else {
            }
        });
    }

    function showAllMessages() {
        $.post("messages/findBySplitPage", {
            pageSize: 30,
            pageNum: 1
        }, function (r) {
            if (r.code === 0) {
                console.info(r.msg);
                var html = "";
                for (var i = 0; i < r.msg.length; i++) {
                    var item = r.msg[i];
                    var str = "<div class=\"layui-card\">" +
                        "<div style=\"margin-top:-5px;float:left;width:30px; height:30px; border-radius:50%; overflow:hidden;\"><img src=\"upload/" + item.sendUsers.userImg + "\" style=\"width:30px;height:30px;\" class=\"layui-nav-img\"></div>&nbsp;&nbsp;" + item.sendUsers.userName +
                        "<div>" + item.content +
                        "</div>" +
                        "<div>" + item.ctime +
                        "</div>" +
                        "</div>";
                    html += str;
                }
                $("#readMsg").html("").append(html);

            } else {
            }
        });
    }

    function addFriend(friendId) {
        $.post("friendMap/addFriend", {
            friendid: friendId
        }, function (r) {
            if (r.code === 0) {
                parent.layer.msg('好友申请发送成功', {icon: 1, shade: 0.4, time: 1000});
            } else {
                parent.layer.msg(r.msg, {icon: 1, shade: 0.4, time: 1000});
            }
        })
    }

    function showAllFriends() {
        $.post("friendMap/findBySplitPage", {
            pageSize: 30,
            pageNum: 1,
            state: 1
        }, function (r) {
            if (r.code === 0) {
                console.info(r.msg);
                var html = "";
                for (var i = 0; i < r.msg.length; i++) {
                    var item = r.msg[i];
                    var str = "<div class=\"layui-card\">" +
                        "<div style=\"margin-top:-5px;float:left;width:30px; height:30px; border-radius:50%; overflow:hidden;\"><img src=\"upload/" + item.users.userImg + "\" style=\"width:30px;height:30px;\" class=\"layui-nav-img\"></div>&nbsp;&nbsp;" + item.users.userName +
                        "<div>" + item.ctime + " <button class=\"layui-btn layui-btn-xs\" onclick='addMsgEvent(" + item.friendid + ")'>留言</button>" +
                        "</div>" +
                        "</div>";
                    html += str;
                }
                $("#readFriend").html("").append(html);

            } else {
            }
        });
    }

    /**
     * 触发留言事件
     */
    function addMsgEvent(friendid) {
        layer.open({
            type: 1,
            title: '新增留言',
            shade: 0.4,  //阴影度
            fix: false,
            shadeClose: true,
            maxmin: false,
            area: ['900px;', '240px;'],    //窗体大小（宽,高）
            content: $('#addMsg'),
            success: function (layero, index) {
                var body = layer.getChildFrame('body', index); //得到子页面层的BODY
                $("#receiveid").val(friendid);
                //form.render();
                body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
            },
            btn: ['留言', '取消'],
            yes: function (index, layero) {
                $.post('messages/saveMessage', $('#formData').serialize(), function (data) {
                    if (data.code == 0) {
                        parent.layer.msg('留言成功', {icon: 1, shade: 0.4, time: 1000});
//                            this.widows.location.href = "view/usercenter";
                    }
                    else {
                        parent.layer.msg('留言失败', {icon: 5, shade: 0.4, time: 1000});
                    }
//                        $("#newImg").html("");
                    layer.close(index);
                });
            }
        })
    }

    function showUserAddress() {
        $.ajax({
            type: "post",
            url: "address/findAddrByUserId",
            dataType: "json",
            success: function (data) {
                if (data != null && data != "") {
                    str = "<table class='layui-table'><colgroup><col width='100'><col width='150'>" +
                        "<col width='300'><col width='340'><col></colgroup><thead><tr><th>收货人</th>" +
                        "<th>电话</th><th>所在地区</th><th>详细地址</th><th>操作</th></tr></thead><tbody>";
                    for (var i = 0; i < data.length; i++) {
                        str = str + "<tr><td>" + data[i].addrNickname + "</td><td>" + data[i].addrPhone + "</td>" +
                            "<td>" + data[i].addrProvince + data[i].addrCity + data[i].addrArea + "</td>" +
                            "<td>" + data[i].addrDetail + "</td><td>" +
                            "<button onclick='modifyAddress(" + data[i].addrId + ")' class='layui-btn layui-btn-xs layui-btn-warm'>编辑</button>" +
                            "<button onclick='deleteAddress(" + data[i].addrId + ")' class='layui-btn layui-btn-xs layui-btn-danger'>删除</button>" +
                            "</td></tr>";
                    }
                    str = str + "</tbody></table>";
                } else {
                    str = "<h3>暂无收货地址！</h3>";
                }
                $("#addrData").html(str);
            }
        });
    }

    function publishEva(id) {
        layer.open({
            type: 1,
            title: '发表评价',
            shade: 0.4,  //阴影度
            fix: false,
            shadeClose: true,
            maxmin: false,
            area: ['700px;', '500px;'],    //窗体大小（宽,高）
            content: $('#evaData'),
            btn: ['发布', '取消'],
            success: function (layero, index) {
                layero.addClass('layui-form');//添加form标识
                layero.find('.layui-layer-btn0').attr('lay-filter', 'fromContent').attr('lay-submit', '');//将按钮弄成能提交的
                $("#evaOrderId").val(id);
                //form.render();
            },
            yes: function (index, layero) {
                form.on('submit(fromContent)', function (data) {
                    $.post("evaluate/addEvaluate", $("#evaForm").serialize(), function (data) {
                        if (data == 'success') {
                            parent.layer.msg('发表评价成功！', {icon: 1, shade: 0.4, time: 1000});
                        } else {
                            parent.layer.msg('发表评价失败！,请重试！', {icon: 5, shade: 0.4, time: 1000});
                        }
                        layer.close(index);
                        findReadyToEvaluateOrder();
                        findFinishOrder();
                        $("#evaReset").click();
                        cleanImgsPreview();
                    });

                })
            }
        });
    }

    function modifyAddress(id) {
        $.ajax({
            type: "post",
            url: "address/findAddressById",
            data: "addrId=" + id,
            dataType: "json",
            success: function (data) {
                layer.open({
                    type: 1,
                    title: '修改地址',
                    shade: 0.4,  //阴影度
                    fix: false,
                    shadeClose: true,
                    maxmin: false,
                    area: ['800px;', '500px;'],    //窗体大小（宽,高）
                    content: $('#addrForm'),
                    btn: ['修改', '取消'],
                    success: function (layero, index) {
                        $("#addrId").val(data.addrId);
                        $("#addrNickName").val(data.addrNickname);
                        $("#addrPhone").val(data.addrPhone);
                        $("#proData").val(data.addrProvince);
                        reloadCity(data.addrProvince, data.addrCity);
                        reloadArea(data.addrCity, data.addrArea);
                        $("#addrDetail").val(data.addrDetail);
                        $("#addrZipcode").val(data.addrZipcode);
                        layero.addClass('layui-form');//添加form标识
                        layero.find('.layui-layer-btn0').attr('lay-filter', 'fromContent').attr('lay-submit', '');//将按钮弄成能提交的
                        //form.render();
                    },
                    yes: function (index, layero) {
                        form.on('submit(fromContent)', function (data) {
                            $.post("address/modifyAddress", $("#addrFormData").serialize(), function (data) {
                                if (data == 'success') {
                                    parent.layer.msg('修改地址成功！', {icon: 1, shade: 0.4, time: 1000});
                                    showUserAddress();
                                } else {
                                    parent.layer.msg('修改地址失败！,请重试！', {icon: 5, shade: 0.4, time: 1000});
                                }
                                layer.close(index);
                                $("#resetBtn").click();
                            });

                        })
                    }
                });
            }
        });
    }

    function reloadCity(id, cityId) {
        $.ajax({
            type: "post",
            url: "proCityArea/findCityByProId",
            data: "provinceId=" + id,
            dataType: "json",
            success: function (data) {
                var str = "<option value=''>请选择市</option>"
                for (var i = 0; i < data.length; i++) {
                    str = str + "<option value='" + data[i].cityId + "'>" + data[i].cityName + "</option>";
                }
                $("#cityData").html(str);
                $("#cityData").val(cityId);
                //form.render();
            }
        });
    }

    function reloadArea(id, areaId) {
        $.ajax({
            type: "post",
            url: "proCityArea/findAreaByCityId",
            data: "cityId=" + id,
            dataType: "json",
            success: function (data) {
                var str = "<option value=''>请选择县/区</option>"
                for (var i = 0; i < data.length; i++) {
                    str = str + "<option value='" + data[i].areaId + "'>" + data[i].areaName + "</option>";
                }
                $("#areaData").html(str);
                $("#areaData").val(areaId);
                //form.render();
            }
        });
    }

    function deleteAddress(id) {
        layer.confirm("确定要删除该地址吗？", function () {
            $.ajax({
                type: "post",
                url: "address/deleteAddress",
                data: "addrId=" + id,
                success: function (data) {
                    if (data == "success") {
                        layer.msg('删除地址成功！', {
                            icon: 1,
                            time: 2000
                        });
                    } else {
                        layer.msg('删除地址失败！请重试！', {
                            icon: 5,
                            time: 2000
                        });
                    }
                    showUserAddress();
                }
            });
        });
    }

    function addAddress() {
        layer.open({
            type: 1,
            title: '添加地址',
            shade: 0.4,  //阴影度
            fix: false,
            shadeClose: true,
            maxmin: false,
            area: ['800px;', '500px;'],    //窗体大小（宽,高）
            content: $('#addrForm'),
            btn: ['添加', '取消'],
            success: function (layero, index) {
                layero.addClass('layui-form');//添加form标识
                layero.find('.layui-layer-btn0').attr('lay-filter', 'fromContent').attr('lay-submit', '');//将按钮弄成能提交的
                $("#resetBtn").click();
                //form.render();
            },
            yes: function (index, layero) {
                form.on('submit(fromContent)', function (data) {
                    $.post("address/addAddress", $("#addrFormData").serialize(), function (data) {
                        if (data == 'success') {
                            parent.layer.msg('添加地址成功！', {icon: 1, shade: 0.4, time: 1000});
                            showUserAddress();
                        } else {
                            parent.layer.msg('添加地址失败！,请重试！', {icon: 5, shade: 0.4, time: 1000});
                        }
                        layer.close(index);
                        $("#resetBtn").click();
                    });

                })

            }
        });
    }

    function addToFavorite(id) {
        $.ajax({
            type: "post",
            url: "guess/addToFavorite",
            data: "goodsId=" + id,
            success: function (data) {
                if (data == "success") {
                    layer.msg('收藏成功！', {
                        icon: 1,
                        time: 2000
                    });
                } else {
                    layer.msg('收藏失败！', {
                        icon: 5,
                        time: 2000
                    });
                }
                showRecentView();
                showFavorite();
            }
        });
    }

    function removeFavorite(id) {
        layer.confirm("确定取消收藏吗？", function () {
            $.ajax({
                type: "post",
                url: "guess/removeFavorite",
                data: "goodsId=" + id,
                success: function (data) {
                    if (data == "success") {
                        layer.msg('取消收藏成功！', {
                            icon: 1,
                            time: 2000
                        });
                        showFavorite();
                    } else {
                        layer.msg('取消收藏失败！', {
                            icon: 5,
                            time: 2000
                        });
                    }
                    showFavorite();
                    showRecentView();
                }
            });
        })
    }

    function showFavorite() {
        $.ajax({
            type: "post",
            url: "guess/findFavorite",
            dataType: "json",
            success: function (arr) {
                var str = "<div style='padding-left:16px;' class='span16'><ul>";
                for (var i = 0; i < arr.length; i++) {
                    if ((i + 1) % 4 != 0) {
                        str = str
                            + "<li><a href='goods/detail?goodsId="
                            + arr[i].guessGoods.goodsId
                            + "'>"
                            + "<img style='margin-bottom:2px;margin-top:10px;' src='upload/" + arr[i].guessGoods.goodsImg + "' /><p class='goods-title'>"
                            + arr[i].guessGoods.goodsName
                            + "</p>"
                            + "<p class='goods-desc'>"
                            + arr[i].guessGoods.goodsDesc
                            + "</p></a><p><span class='newprice'>"
                            + arr[i].guessGoods.goodsPrice
                            + "元</span>&nbsp;"
                            + "</p><button onclick='addToCart("
                            + arr[i].guessGoods.goodsId
                            + ")'  class='layui-btn layui-btn-sm'>加入借书单</button>"
                            + "<button onclick='removeFavorite("
                            + arr[i].guessGoods.goodsId
                            + ")' class='layui-btn layui-btn-sm'>取消收藏</button></li>";
                    } else {
                        str = str
                            + "<li class='brick4'><a href='goods/detail?goodsId="
                            + arr[i].guessGoods.goodsId
                            + "'>"
                            + "<img style='margin-bottom:2px;margin-top:10px;' src='upload/" + arr[i].guessGoods.goodsImg + "' /><p class='goods-title'>"
                            + arr[i].guessGoods.goodsName
                            + "</p>"
                            + "<p class='goods-desc'>"
                            + arr[i].guessGoods.goodsDesc
                            + "</p></a><p><span class='newprice'>"
                            + arr[i].guessGoods.goodsPrice
                            + "元</span>&nbsp;"
                            + "</p><button onclick='addToCart("
                            + arr[i].guessGoods.goodsId
                            + ")' class='layui-btn layui-btn-sm'>加入借书单</button>"
                            + "<button onclick='removeFavorite("
                            + arr[i].guessGoods.goodsId
                            + ")' class='layui-btn layui-btn-sm'>取消收藏</button></li>";
                    }
                }
                var str = str + "</ul></div>";
                $("#productArea").html(str);
            }
        });
    }

    /**
     * 显示预约信息
     */
    function showSubscribe() {
        $.ajax({
            type: "post",
            url: "subscribe/findSubscribes",
            dataType: "json",
            success: function (arr) {
                var str = "<div style='padding-left:16px;' class='span16'><ul>";
                for (var i = 0; i < arr.length; i++) {
                    if ((i + 1) % 4 != 0) {
                        str = str
                            + "<li><a href='goods/detail?goodsId="
                            + arr[i].subscribeGoods.goodsId
                            + "'>"
                            + "<img style='margin-bottom:2px;margin-top:10px;' src='upload/" + arr[i].subscribeGoods.goodsImg + "' /><p class='goods-title'>"
                            + arr[i].subscribeGoods.goodsName
                            + "</p>"
                            + "<p class='goods-desc'>"
                            + arr[i].subscribeGoods.goodsDesc
                            + "</p></a><p><span class='newprice'>"
                            + arr[i].subscribeGoods.goodsPrice
                            + "元</span>&nbsp;"
                            + "</p>";
                        if (arr[i].subscribeGoods.goodsNum > 0) {
                            str += "<button onclick='addToCart("
                                + arr[i].subscribeGoods.goodsId
                                + ")'  class='layui-btn layui-btn-sm'>加入借书单</button>";
                        }

                        str += "</li>";
                    } else {
                        str = str
                            + "<li class='brick4'><a href='goods/detail?goodsId="
                            + arr[i].subscribeGoods.goodsId
                            + "'>"
                            + "<img style='margin-bottom:2px;margin-top:10px;' src='upload/" + arr[i].subscribeGoods.goodsImg + "' /><p class='goods-title'>"
                            + arr[i].subscribeGoods.goodsName
                            + "</p>"
                            + "<p class='goods-desc'>"
                            + arr[i].subscribeGoods.goodsDesc
                            + "</p></a><p><span class='newprice'>"
                            + arr[i].subscribeGoods.goodsPrice
                            + "元</span>&nbsp;"
                            + "</p>";
                        if (arr[i].subscribeGoods.goodsNum > 0) {
                            str += "<button onclick='addToCart("
                                + arr[i].subscribeGoods.goodsId
                                + ")'  class='layui-btn layui-btn-sm'>加入借书单</button>";
                        }

                        str += "</li>";
                    }
                }
                var str = str + "</ul></div>";
                $("#subscribeBooks").html(str);
//                element.render();
            }
        });
    }

    function showRecentView() {
        $.ajax({
            type: "post",
            url: "guess/findRecentGoods",
            dataType: "json",
            success: function (arr) {
                var str = "<div style='padding-left:0px;margin-left:-40px' class='span16'><ul>";
                for (var i = 0; i < arr.length; i++) {
                    if ((i + 1) % 4 != 0) {
                        str = str
                            + "<li><a href='goods/detail?goodsId="
                            + arr[i].guessGoods.goodsId
                            + "'>"
                            + "<img style='margin-bottom:2px;margin-top:10px;' src='upload/" + arr[i].guessGoods.goodsImg + "' /><p class='goods-title'>"
                            + arr[i].guessGoods.goodsName
                            + "</p>"
                            + "<p class='goods-desc'>"
                            + arr[i].guessGoods.goodsDesc
                            + "</p></a><p><span class='newprice'>"
                            + arr[i].guessGoods.goodsPrice
                            + "元</span>&nbsp;"
                            + "</p>"
                            + "<button onclick='addToFavorite("
                            + arr[i].guessGoods.goodsId
                            + ")' class='layui-btn layui-btn-sm layui-btn-normal' onclick='addToFavorite();'>收藏商品</button></li>";
                    } else {
                        str = str
                            + "<li class='brick4'><a href='goods/detail?goodsId="
                            + arr[i].guessGoods.goodsId
                            + "'>"
                            + "<img style='margin-bottom:2px;margin-top:10px;' src='upload/" + arr[i].guessGoods.goodsImg + "' /><p class='goods-title'>"
                            + arr[i].guessGoods.goodsName
                            + "</p>"
                            + "<p class='goods-desc'>"
                            + arr[i].guessGoods.goodsDesc
                            + "</p></a><p><span class='newprice'>"
                            + arr[i].guessGoods.goodsPrice
                            + "元</span>&nbsp;"
                            + "</p>"
                            + "<button onclick='addToFavorite("
                            + arr[i].guessGoods.goodsId
                            + ")' class='layui-btn layui-btn-sm layui-btn-normal' onclick='addToFavorite()'>收藏商品</button></li>";
                    }
                }
                var str = str + "</ul></div>";
                $("#recentViewArea").html(str);
            }
        });
    }

    function addToCart(id) {
        var num = 1;
        $.ajax({
            type: "post",
            url: "cart/addCart",
            data: "num=" + num + "&goodsId=" + id,
            success: function (data) {
                if (data == "success") {
                    layer.msg('添加成功！', {
                        icon: 1,
                        time: 2000
                    });
                    showHotGoods();
                } else {
                    layer.msg('添加失败！', {
                        icon: 5,
                        time: 2000
                    });
                }
            }
        });
    }

    function showReadyPayOrder() {
        $.ajax({
            type: "post",
            url: "order/findReadPayOrder",
            dataType: "json",
            success: function (data) {
                str = "";
                if (data == null || data == "") {
                    str = str + "<h2>暂无相关订单信息</h2>"
                } else {
                    str = str + "<div class='layui-collapse' lay-accordion=''>";
                    for (var i = 0; i < data.length; i++) {
                        var date = new Date(data[i].orderDate).toLocaleString();
                        str = str
                            + "<div class='layui-colla-item'>"
                            + "<h2 class='layui-colla-title'>订单编号："
                            + data[i].orderId
                            + "&nbsp;&nbsp;总价："
                            + data[i].orderPrice
                            + "元&nbsp;订单日期：" + date + "</h2>"
                            + "<div class='layui-colla-content'><h4>收货人："
                            + data[i].orderUserName
                            + "&nbsp;&nbsp;收货地址："
                            + data[i].orderAddress
                            + "&nbsp;电话：" + data[i].orderPhone + "</h4>"
                            + "<div class='layui-form'><table class='layui-table'><thead><tr><th>商品名称</th><th>价格</th><th>数量</th><th>小计</th></tr>"
                            + "</thead><tbody>";
                        var arr = data[i].detailList;
                        for (var t = 0; t < arr.length; t++) {
                            str = str
                                + "<tr><td><a href='goods/detail?goodsId="
                                + arr[t].detailGoods.goodsId
                                + "'>"
                                + arr[t].detailGoods.goodsName
                                + "</a></td>" + "<td>"
                                + arr[t].detailGoods.goodsPrice
                                + "</td><td>"
                                + arr[t].detailNum
                                + "台</td><td>"
                                + arr[t].detailGoods.goodsPrice
                                * arr[t].detailNum + "元</td>"
                                + "</tr>";
                        }
                        str = str
                            + "</tbody></table></div><button onclick='payfor(\"" + data[i].orderId + "\")' class='layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius'>去付款</button>"
                            + "</div></div>";
                    }
                    str = str + "</div>";
                }

                $("#state1").html(str);
                //element.render();
            }
        });
    }

    function payfor(id) {
        window.location.href = "order/toPay?orderId=" + id;
    }

    function findReadyToDeliverOrder() {
        $.ajax({
            type: "post",
            url: "order/findReadyToDeliverOrder",
            dataType: "json",
            success: function (data) {
                str = "";
                if (data == null || data == "") {
                    str = str + "<h2>暂无相关订单信息</h2>"
                } else {
                    str = str + "<div class='layui-collapse' lay-accordion=''>";
                    for (var i = 0; i < data.length; i++) {
                        var date = new Date(data[i].orderDate).toLocaleString();
                        var date1 = new Date(data[i].orderOverTime).toLocaleString();
                        str = str
                            + "<div class='layui-colla-item'>"
                            + "<h2 class='layui-colla-title'>订单编号："
                            + data[i].orderId
                            + "&nbsp;&nbsp;总价："
                            + data[i].orderPrice
                            + "元&nbsp;订单日期：" + date + "</h2>"
                            + "<div class='layui-colla-content'><h4>收货人："
                            + data[i].orderUserName
                            + "&nbsp;&nbsp;收货地址："
                            + data[i].orderAddress
                            + "&nbsp;电话：" + data[i].orderPhone + "</h4>"
                            + "<div class='layui-form'><table class='layui-table'><thead><tr><th>商品名称</th><th>价格</th><th>数量</th><th>还书日期</th><th>小计</th></tr>"
                            + "</thead><tbody>";
                        var arr = data[i].detailList;
                        for (var t = 0; t < arr.length; t++) {
                            str = str
                                + "<tr><td><a href='goods/detail?goodsId="
                                + arr[t].detailGoods.goodsId
                                + "'>"
                                + arr[t].detailGoods.goodsName
                                + "</a></td>" + "<td>"
                                + arr[t].detailGoods.goodsPrice
                                + "</td><td>"
                                + arr[t].detailNum
                                + "本</td><td>"
                                + date1
                                + "</td><td>"
                                + arr[t].detailGoods.goodsPrice
                                * arr[t].detailNum + "元</td>"
                                + "</tr>";
                        }
                        str = str
                            + "</tbody></table></div><button onclick='changeBook()' class='layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius'>更换图书</button>"
                            + "</div></div>";
                    }
                    str = str + "</div>";
                }
                $("#state2").html(str);
                // element.render();
            }
        });
    }

    function findSureOrder() {
        $.ajax({
            type: "post",
            url: "order/findSureOrder",
            dataType: "json",
            success: function (data) {
                str = "";
                if (data == null || data == "") {
                    str = str + "<h2>暂无相关订单信息</h2>"
                } else {
                    str = str + "<div class='layui-collapse' lay-accordion=''>";
                    for (var i = 0; i < data.length; i++) {
                        var date = new Date(data[i].orderDate).toLocaleString();
                        var date1 = new Date(data[i].orderOverTime).toLocaleString();
                        str = str
                            + "<div class='layui-colla-item'>"
                            + "<h2 class='layui-colla-title'>订单编号："
                            + data[i].orderId
                            + "&nbsp;&nbsp;总价："
                            + data[i].orderPrice
                            + "元&nbsp;订单日期：" + date + "</h2>"
                            + "<div class='layui-colla-content'><h4>收货人："
                            + data[i].orderUserName
                            + "&nbsp;&nbsp;收货地址："
                            + data[i].orderAddress
                            + "&nbsp;电话：" + data[i].orderPhone + "</h4>"
                            + "<div class='layui-form'><table class='layui-table'><thead><tr><th>商品名称</th><th>价格</th><th>数量</th><th>还书日期</th><th>小计</th></tr>"
                            + "</thead><tbody>";
                        var arr = data[i].detailList;
                        for (var t = 0; t < arr.length; t++) {
                            str = str
                                + "<tr><td><a href='goods/detail?goodsId="
                                + arr[t].detailGoods.goodsId
                                + "'>"
                                + arr[t].detailGoods.goodsName
                                + "</a></td>" + "<td>"
                                + arr[t].detailGoods.goodsPrice
                                + "</td><td>"
                                + arr[t].detailNum
                                + "本</td><td>"
                                + date1
                                + "</td><td>"
                                + arr[t].detailGoods.goodsPrice
                                * arr[t].detailNum + "元</td>"
                                + "</tr>";
                        }
                        str = str
                            + "</tbody></table></div>"
                            + "</div></div>";
                    }
                    str = str + "</div>";
                }
                $("#state6").html(str);
                //element.render();
            }
        });
    }

    function findFinishSecOrder() {
        $.ajax({
            type: "post",
            url: "order/findFinishSecOrder",
            dataType: "json",
            success: function (data) {
                str = "";
                if (data == null || data == "") {
                    str = str + "<h2>暂无相关订单信息</h2>"
                } else {
                    str = str + "<div class='layui-collapse' lay-accordion=''>";
                    for (var i = 0; i < data.length; i++) {
                        var date = new Date(data[i].orderDate).toLocaleString();
                        var date1 = new Date(data[i].orderOverTime).toLocaleString();
                        str = str
                            + "<div class='layui-colla-item'>"
                            + "<h2 class='layui-colla-title'>订单编号："
                            + data[i].orderId
                            + "&nbsp;&nbsp;总价："
                            + data[i].orderPrice
                            + "元&nbsp;订单日期：" + date + "</h2>"
                            + "<div class='layui-colla-content'><h4>收货人："
                            + data[i].orderUserName
                            + "&nbsp;&nbsp;收货地址："
                            + data[i].orderAddress
                            + "&nbsp;电话：" + data[i].orderPhone + "</h4>"
                            + "<div class='layui-form'><table class='layui-table'><thead><tr><th>商品名称</th><th>价格</th><th>数量</th><th>还书日期</th><th>小计</th></tr>"
                            + "</thead><tbody>";
                        var arr = data[i].detailList;
                        for (var t = 0; t < arr.length; t++) {
                            str = str
                                + "<tr><td><a href='goods/detail?goodsId="
                                + arr[t].detailGoods.goodsId
                                + "'>"
                                + arr[t].detailGoods.goodsName
                                + "</a></td>" + "<td>"
                                + arr[t].detailGoods.goodsPrice
                                + "</td><td>"
                                + arr[t].detailNum
                                + "本</td><td>"
                                + date1
                                + "</td><td>"
                                + arr[t].detailGoods.goodsPrice
                                * arr[t].detailNum + "元</td>"
                                + "</tr>";
                        }
                        str = str
                            + "</tbody></table></div><button onclick='tuikuan()' class='layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius'>申请退款</button>"
                            + "</div></div>";
                    }
                    str = str + "</div>";
                }
                $("#state7").html(str);
                //element.render();
            }
        });
    }

    function findReadyToReceiveOrder() {
        $.ajax({
            type: "post",
            url: "order/findReadyToReceiveOrder",
            dataType: "json",
            success: function (data) {
                str = "";
                if (data == null || data == "") {
                    str = str + "<h2>暂无相关订单信息</h2>"
                } else {
                    str = str + "<div class='layui-collapse' lay-accordion=''>";
                    for (var i = 0; i < data.length; i++) {
                        var date = new Date(data[i].orderDate).toLocaleString();
                        var date1 = new Date(data[i].orderOverTime).toLocaleString();
                        str = str
                            + "<div class='layui-colla-item'>"
                            + "<h2 class='layui-colla-title'>订单编号："
                            + data[i].orderId
                            + "&nbsp;&nbsp;总价："
                            + data[i].orderPrice
                            + "元&nbsp;订单日期：" + date + "</h2>"
                            + "<div class='layui-colla-content'><h4>收货人："
                            + data[i].orderUserName
                            + "&nbsp;&nbsp;收货地址："
                            + data[i].orderAddress
                            + "&nbsp;电话：" + data[i].orderPhone + "&nbsp;快递单号" + data[i].orderExpressNo + "</h4>"
                            + "<div class='layui-form'><table class='layui-table'><thead><tr><th>商品名称</th><th>价格</th><th>数量</th><th>归还时间</th><th>小计</th></tr>"
                            + "</thead><tbody>";
                        var arr = data[i].detailList;
                        for (var t = 0; t < arr.length; t++) {

                            str = str
                                + "<tr><td><a href='goods/detail?goodsId="
                                + arr[t].detailGoods.goodsId
                                + "'>"
                                + arr[t].detailGoods.goodsName
                                + "</a></td>" + "<td>"
                                + arr[t].detailGoods.goodsPrice
                                + "</td><td>"
                                + arr[t].detailNum
                                + "本</td><td>"
                                + date1
                                + "</td><td>"
                                + arr[t].detailGoods.goodsPrice
                                * arr[t].detailNum + "元</td>"
                                + "</tr>";
                        }
                        str = str
                            + "</tbody></table></div><button onclick='confirmReceive(\"" + data[i].orderId + "\")' class='layui-btn layui-btn-normal  layui-btn-radius'>确认收货</button>"+"<button onclick='sendToWl()' class='layui-btn layui-btn-normal  layui-btn-radius'>联系物流</button>"
                            + "</div></div>";
                    }
                    str = str + "</div>";
                }
                $("#state3").html(str);
                //element.render();
            }
        });
    }

    function changeBook() {
        layer.open({
            type: 1,
            title: '更换图书',
            shade: 0.4,  //阴影度
            fix: false,
            shadeClose: true,
            maxmin: false,
            area: ['900px;', '240px;'],    //窗体大小（宽,高）
            content: $('#changeB'),
            success: function (layero, index) {
                var body = layer.getChildFrame('body', index); //得到子页面层的BODY

                //form.render();
                body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
            },
            btn: ['更换', '取消'],
            yes: function (index, layero) {
                parent.layer.msg('更换图书申请已完成，请耐心等待', {icon: 1, shade: 0.4, time: 1000});
                layer.close(index);
            }
        })
    }

    function tuikuan() {
        layer.open({
            type: 1,
            title: '申请退款',
            shade: 0.4,  //阴影度
            fix: false,
            shadeClose: true,
            maxmin: false,
            area: ['900px;', '240px;'],    //窗体大小（宽,高）
            content: $('#tuikuanA'),
            success: function (layero, index) {
                var body = layer.getChildFrame('body', index); //得到子页面层的BODY

                //form.render();
                body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
            },
            btn: ['退款', '取消'],
            yes: function (index, layero) {
                parent.layer.msg('退款申请已完成，请耐心等待', {icon: 1, shade: 0.4, time: 1000});
                layer.close(index);
            }
        })
    }

    function sendToWl() {

            layer.open({
                type: 1,
                title: '提问',
                shade: 0.4,  //阴影度
                fix: false,
                shadeClose: true,
                maxmin: false,
                area: ['900px;', '240px;'],    //窗体大小（宽,高）
                content: $('#wuliu'),
                success: function (layero, index) {
                    var body = layer.getChildFrame('body', index); //得到子页面层的BODY

                    //form.render();
                    body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                },
                btn: ['提问', '取消'],
                yes: function (index, layero) {
                    parent.layer.msg('问题已反馈至物流公司，请耐心等待', {icon: 1, shade: 0.4, time: 1000});
                    layer.close(index);
                }
            })

    }

    function confirmReceive(id) {
        layer.confirm("确认收货吗？", function () {
            $.ajax({
                type: "post",
                url: "order/receiveOrder",
                data: "orderId=" + id,
                success: function (data) {
                    if (data == "success") {
                        layer.msg('确认收货成功！', {
                            icon: 1,
                            time: 2000
                        });
                    } else {
                        layer.msg('确认收货失败！请重试！', {
                            icon: 5,
                            time: 2000
                        });
                    }
                    findReadyToReceiveOrder();
                    findReadyToEvaluateOrder();
                }
            });
        });
    }

    function findReadyToEvaluateOrder() {
        $.ajax({
            type: "post",
            url: "order/findReadyToEvaluateOrder",
            dataType: "json",
            success: function (data) {
                str = "";
                if (data == null || data == "") {
                    str = str + "<h2>暂无相关订单信息</h2>"
                } else {
                    str = str + "<div class='layui-collapse' lay-accordion=''>";
                    for (var i = 0; i < data.length; i++) {
                        var date = new Date(data[i].orderDate).toLocaleString();
                        var date1 = new Date(data[i].orderOverTime).toLocaleString();
                        str = str
                            + "<div class='layui-colla-item'>"
                            + "<h2 class='layui-colla-title'>订单编号："
                            + data[i].orderId
                            + "&nbsp;&nbsp;总价："
                            + data[i].orderPrice
                            + "元&nbsp;订单日期：" + date + "</h2>"
                            + "<div class='layui-colla-content'><h4>收货人："
                            + data[i].orderUserName
                            + "&nbsp;&nbsp;收货地址："
                            + data[i].orderAddress
                            + "&nbsp;电话：" + data[i].orderPhone + "&nbsp;快递单号" + data[i].orderExpressNo + "</h4>"
                            + "<div class='layui-form'><table class='layui-table'><thead><tr><th>商品名称</th><th>价格</th><th>数量</th><th>归还时间</th><th>小计</th></tr>"
                            + "</thead><tbody>";
                        var arr = data[i].detailList;
                        for (var t = 0; t < arr.length; t++) {
                            str = str
                                + "<tr><td><a href='goods/detail?goodsId="
                                + arr[t].detailGoods.goodsId
                                + "'>"
                                + arr[t].detailGoods.goodsName
                                + "</a></td>" + "<td>"
                                + arr[t].detailGoods.goodsPrice
                                + "</td><td>"
                                + arr[t].detailNum
                                + "本</td><td>"
                                + date1
                                + "</td><td>"
                                + arr[t].detailGoods.goodsPrice
                                * arr[t].detailNum + "元</td>"
                                + "</tr>";
                        }
                        str = str
                            + "</tbody></table></div><button onclick='publishEva(\"" + data[i].orderId + "\")'  class='layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius'>发表评价</button>"
                            + "</div></div>";
                    }
                    str = str + "</div>";
                }
                $("#state4").html(str);
                //element.render();
            }
        });
    }

    function findFinishOrder() {
        $.ajax({
            type: "post",
            url: "order/findFinishOrder",
            dataType: "json",
            success: function (data) {
                var str = "";
                if (data == null || data == "") {
                    str = str + "<h2>暂无相关订单信息</h2>"
                } else {
                    str = str + "<div class='layui-collapse' lay-accordion=''>";
                    for (var i = 0; i < data.length; i++) {
                        var date = new Date(data[i].orderDate).toLocaleString();
                        str = str
                            + "<div class='layui-colla-item'>"
                            + "<h2 class='layui-colla-title'>订单编号："
                            + data[i].orderId
                            + "&nbsp;&nbsp;总价："
                            + data[i].orderPrice
                            + "元&nbsp;订单日期：" + date + "</h2>"
                            + "<div class='layui-colla-content'><h4>收货人："
                            + data[i].orderUserName
                            + "&nbsp;&nbsp;收货地址："
                            + data[i].orderAddress
                            + "&nbsp;电话：" + data[i].orderPhone + "&nbsp;快递单号" + data[i].orderExpressNo + "</h4>"
                            + "<div class='layui-form'><table class='layui-table'><thead><tr><th>商品名称</th><th>价格</th><th>数量</th><th>小计</th></tr>"
                            + "</thead><tbody>";
                        var arr = data[i].detailList;
                        for (var t = 0; t < arr.length; t++) {
                            str = str
                                + "<tr><td><a href='goods/detail?goodsId="
                                + arr[t].detailGoods.goodsId
                                + "'>"
                                + arr[t].detailGoods.goodsName
                                + "</a></td>" + "<td>"
                                + arr[t].detailGoods.goodsPrice
                                + "</td><td>"
                                + arr[t].detailNum
                                + "本</td><td>"
                                + arr[t].detailGoods.goodsPrice
                                * arr[t].detailNum + "元</td>"
                                + "</tr>";
                        }
                        str = str
                            + "</tbody></table></div><button onclick='deleteOrder(\"" + data[i].orderId + "\")' class='layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius'>归还图书</button>"
                            + "</div></div>";
                    }
                    str = str + "</div>";
                }
                $("#state5").html(str);
                //element.render();
            }
        });
    }

    function deleteOrder(id) {
//        layer.confirm("确认删除该订单吗？", function () {
//            $.ajax({
//                type: "post",
//                url: "order/deleteOrder",
//                data: "orderId=" + id,
//                success: function (data) {
//                    if (data == "success") {
//                        layer.msg("删除订单成功！", {icon: 1, time: 2000});
//                    } else {
//                        layer.msg("删除订单失败！请重试！", {icon: 5, time: 2000});
//                    }
//                    findFinishOrder();
//                }
//            });
//        });
        layer.open({
            type: 1,
            title: '图书归还',
            shade: 0.4,  //阴影度
            fix: false,
            shadeClose: true,
            maxmin: false,
            area: ['600px;', '250px;'],    //窗体大小（宽,高）
            content: "<div style='width:500px;padding-top:15px;'><div class='layui-form-item'><label class='layui-form-label'>订单编号</label>" +
            "<div class='layui-input-block'><input type='text' name='orderId' id='orderId' style='background-color:#F8F8F8;' " +
            " readonly='readonly' required lay-verify='required' value='" + id + "' class='layui-input' /></div></div>" +
            "<div class='layui-form-item'><label class='layui-form-label'>快递单号</label><div class='layui-input-block'><input type='text' " +
            " id='backENo' required lay-verify='required' class='layui-input' /></div></div></div>",
            success: function (layero, index) {
                var body = layer.getChildFrame('body', index); //得到子页面层的BODY
                body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
            },
            btn: ['归还', '取消'],
            yes: function (index, layero) {
                var no = $("#backENo").val();
                $.post('order/backOrder', {orderId: id, backENo: no}, function (msg) {
                    if (msg == 'success') {
                        parent.layer.msg('归还成功', {icon: 1, shade: 0.4, time: 1000});
                        findFinishOrder();
                    }
                    else {
                        parent.layer.msg('归还失败', {icon: 5, shade: 0.4, time: 1000});
                    }
                    layer.close(index);
                });
            }
        });
    }

    function showProvince() {
        $.ajax({
            type: "post",
            url: "proCityxiuArea/findAllPro",
            dataType: "json",
            success: function (data) {
                var str = "<option value=''>请选择省</option>"
                for (var i = 0; i < data.length; i++) {
                    str = str + "<option value='" + data[i].provinceId + "'>" + data[i].provinceName + "</option>"
                }
                $("#proData").html(str);
                //form.render();
            }
        });
    }
</script>
</body>
</html>