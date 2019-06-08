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
<script type="text/javascript" src="resources/js/jquery.1.12.4.min.js"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=l1A4jiCdqM3eLnrcBMjiPM9RTLCKf1io"></script>
	<script>
		$(function () {
            var map = new BMap.Map("showwuliu");          // 创建地图实例
            var point = new BMap.Point(116.404, 39.915);  // 创建点坐标
            map.centerAndZoom(point, 15);
            map.enableScrollWheelZoom(true);
            // 编写自定义函数,创建标注
            function addMarker(point){
                var marker = new BMap.Marker(point);
                map.addOverlay(marker);
                // 百度地图API功能
                var sContent =
                    "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>书籍列表</h4>" +
                    "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>骆驼祥子</p>"+
                    "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>围城</p>"+
                    "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>钢铁是怎么炼成的</p>"+
                    "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>从你的全世界路过</p>"+
                    "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>从零开始学运营</p>";
                var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
                marker.addEventListener("click",function () {
                    var p = marker.getPosition();  //获取marker的位置
                    this.openInfoWindow(infoWindow);
                });

            }

            var geolocation = new BMap.Geolocation();
            geolocation.getCurrentPosition(function(r){
                if(this.getStatus() == BMAP_STATUS_SUCCESS){
                    var mk = new BMap.Marker(r.point);
                    map.addOverlay(mk);
                    map.panTo(r.point);
                    // 随机向地图添加25个标注
                    var bounds = map.getBounds();
                    var sw = bounds.getSouthWest();
                    var ne = bounds.getNorthEast();
                    var lngSpan = Math.abs(sw.lng - ne.lng);
                    var latSpan = Math.abs(ne.lat - sw.lat);
                    for (var i = 0; i < 25; i ++) {
                        var point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7));
                        addMarker(point);
                    }
                    // alert('您的位置：'+r.point.lng+','+r.point.lat);
                }
                else {
                    alert('failed'+this.getStatus());
                }
            },{enableHighAccuracy: true})
        })


        function nearby() {
            layer.open({
                type: 1,
                title: '附近书架',
                shade: 0.4,  //阴影度
                fix: false,
                shadeClose: true,
                maxmin: false,
                area: ['910px;', '610px;'],    //窗体大小（宽,高）
                content: $('#showwuliu'),
                success: function (layero, index) {
                    var body = layer.getChildFrame('body', index); //得到子页面层的BODY

                    //form.render();
                    body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                },
                btn: ['确认', '取消'],
                yes: function (index, layero) {
                    layer.close(index);
                }
            })
        }
	</script>
</head>
<body>
	<!--导航栏部分-->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="view/index">在线书城</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">

				<ul class="nav navbar-nav navbar-right" style="padding-right:30px;">
					<c:if test="${ empty sessionScope.user}">
						<li><a href="view/register" >注册</a></li>
						<li><a href="view/login">登录</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.user}">
						<li><a href="view/usercenter">用户中心<span class="layui-badge">${user.applyNum}</span></a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><div style="margin-top:-5px;float:left;width:30px; height:30px; border-radius:50%; overflow:hidden;"><img src="upload/${user.userImg }" style="width:30px;height:30px;" class="layui-nav-img"></div>&nbsp;&nbsp;${sessionScope.user.userName} <span
								class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="view/cart">借书单</a></li>
								<li><a href="user/amendinfo">个人资料修改</a></li>
								<li><a href="user/logout">注销登录</a></li>
							</ul></li>
					</c:if>
				</ul>

				<div class="navbar-form navbar-right">
				<form action="goods/search" method="post">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="从你的全世界路过" name="keyWord"
							id="searchKeyWord" />
					</div>
					<button class="btn btn-default" type="submit">查找图书</button>
					<button class="btn btn-default" type="button" onclick="nearby()">附近书架</button>
				<%--</div>--%>
				</form>

				</div>
			</div>
		</div>
	</nav>
	<div id="showwuliu" style="display:none;width:900px;padding-top:10px;height: 500px">

	</div>
</body>
</html>