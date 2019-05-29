<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="resources/css/layui.css">
<script type="text/javascript" src="resources/js/jquery.1.12.4.min.js"></script>
<script type="text/javascript" src="resources/js/layui.js"></script>

<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<form class="layui-form">
<div class="layui-form-item" style="margin:15px;height:30px;">
    	<div style="height:40px;width:70px;float:left;line-height:40px;">提问问题:</div>
        <input type="text" class="layui-input" style="display:inline-block;width:250px;float:left;" id="keyword" name="keyword" value="" lay-verify="" placeholder="请输入分类名" autocomplete="off">
	    <div class="layui-input-inline" style="width:150px;text-align:center;">
	        <a class="layui-btn" id="search" data-type="reload" name="search">
	            <i class="layui-icon"></i>搜索
	        </a>
	    </div> 
</div>
</form>
<div>
    <table id="type" lay-filter="type"></table>
</div>
<div id="formData" style="width:300px;display:none;padding-top:15px;">
	<form class="layui-form" id="typeForm">
		<input type="hidden" name="sysmsgId" id="sysmsgId" />
		<div class="layui-form-item">
			    <label class="layui-form-label">回复信息</label>
			    <div class="layui-input-block">
			      <input type="text" name="answerMsg" id="answerMsg" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
	</form>
</div>
<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-xs layui-btn-normal" title="回复" lay-event="edit">回复</a>
</script>
<script type="text/html" id="dateTpl">
    {{ layui.laytpl.fn(d.editdate) }}
</script>
<script type="text/javascript">
var table;
var layer;
var form;
        layui.use(['layer', 'table','form'], function ()
        {
            table = layui.table;
            layer = layui.layer;
            form =layui.form;
            //--------------方法渲染TABLE----------------
            var tableIns = table.render({
                elem: '#type'
                , id: 'type'
                , url: 'sysmsg/findAll'
                , cols: [[
                     { checkbox: true, LAY_CHECKED: false } //其它参数在此省略
                     ,{ field: 'sysmsgId', title: '客户编号', width: 100, align: 'center' }
                     ,{field:'goodsType', title: '提问人', width: 100 ,align: 'center',templet: function(d){
                        return d.sendUser.userName
                    }},
                   { field:'askMsg', title: '提问问题', width: 360, align: 'center'},
                    { field:'answerMsg', title: '回答', width: 360, align: 'center'},
					{title: '操作', fixed: 'right', width: 165, align: 'center', toolbar: '#bar'}
                ]]
                , page: true
                , limits: [5, 10, 15]
                , limit: 10 //默认采用10
                , done: function (res, curr, count)
                {
                    //如果是异步请求数据方式，res即为你接口返回的信息。
                    //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                    //console.log(res);
                    //得到当前页码
                    //console.log(curr);
                    $("#curPageIndex").val(curr);
                    //得到数据总量
                    //console.log(count);
                }
            });

            //#region --------------搜索----------------
            $("#search").click(function ()
            {
            	var word=$("#keyword").val();
                tableIns.reload({
                    where: {
                    	keyword: word
                    },page: {
                    curr: 1 //重新从第 1 页开始
                  }
                });
            });

            //工具条事件监听
            table.on('tool(type)', function (obj)
            { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值
                var tr = obj.tr; //获得当前行 tr 的DOM对象
                if (layEvent === 'edit')
                { //编辑
                    layer.open({
                        type: 1,
                        title: '问题回复',
                        shade: 0.4,  //阴影度
                        fix: false,
                        shadeClose: true,
                        maxmin: false,
                        area: ['400px;', '200px;'],    //窗体大小（宽,高）
                        content: $('#formData'),
                        success: function (layero, index)
                        {
                            var body = layer.getChildFrame('body', index); //得到子页面层的BODY
                            $("#sysmsgId").val(data.sysmsgId);
                            $("#answerMsg").val(data.answerMsg);
                            form.render();
                            body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                        },
                        btn:['修改','取消'],
                        yes: function(index, layero){
                        	$.post('sysmsg/updateSysMsg',$('#typeForm').serialize(),function(data){
                                if (data == 'success')
                                {
                                    parent.layer.msg('回复成功！', { icon: 1, shade: 0.4, time: 1000 });
                                    $("#search").click();
                                    $("#handle_status").val('');
                                }
                                else
                                {
                                    parent.layer.msg('回复失败！', { icon: 5, shade: 0.4, time: 1000 });
                                }
                                layer.close(index);
                        	}); 
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>