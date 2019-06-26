<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>添加--后台管理</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="<%=basePath%>Web/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font_eolqem241z66flxr.css" media="all" />
	<style type="text/css">
		.closeBtn {
			width: 100%;
			height: 36px;
			margin-top: -5px;
		}
		.closeBtn a {
			float: right;
			line-height: 36px;
		}
	</style>
</head>
<body class="childrenBody">
	<div class="closeBtn"><a href="<%=basePath%>page/download/list.jsp" target="_self"><i class="layui-icon">&#x1006;</i></a></div>
	<form class="layui-form" action="<%=basePath%>download_add.action" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label">文件名</label>
			<div class="layui-input-block">
				<input name="name" id="fileTitle" type="text" class="layui-input newsName" lay-verify="required" placeholder="请输入标题">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">发布者</label>
				<div class="layui-input-inline">
					<input name="author" type="text" class="layui-input newsAuthor" lay-verify="required" placeholder="请输入作者">
				</div>
			</div>
			<div class="layui-inline">		
				<label class="layui-form-label">发布时间</label>
				<div class="layui-input-inline">
					<input type="text" class="layui-input" id="time" name="time" autocomplete="off">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">上传附件</label>		
				<button type="button" class="layui-btn" id="fileUpload">
				  <i class="layui-icon" data-icon="&#xe67c;">&#xe67c;</i>选择文件
				</button>
				<input type="text" hidden="hidden" name="fileName" class="fileName">
				<input type="text" hidden="hidden" name="fileUrl" class="fileUrl">
			</div>
			<div class="layui-inline">		
				<div class="delFile"></div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addNews">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
	<script src="<%=basePath%>Web/layui/layui.js"></script>
	<script type="text/javascript">
    layui.use('laydate', function(){
    	  var laydate = layui.laydate;
    	  laydate.render({
    	    elem: '#time' 
    	  });
    	});
  layui.use('upload', function(){
	  var upload = layui.upload;
	  var uploadInst = upload.render({
	    elem: '#fileUpload' 
	    ,url: '<%=basePath%>download_uploadFile.action'
	    ,accept: 'file'
	    ,size: '10240'
	    ,done: function(res){
	    	if(res.code > 0){
                return layer.msg('上传失败');
            }
	    	$(".fileName").val(res.data.title);
	    	$(".fileUrl").val(res.data.src);
	    	var title = res.data.title;
	    	var array = title.split(".");
	    	$("#fileTitle").val(array[0]);
	    	$(".delFile").append('<span style="color: green;">'+res.data.title+'</span>&nbsp;&nbsp;&nbsp;'+
	    			'<a class="layui-btn layui-btn-danger layui-btn-mini" href="javascript:void(0)" onclick="del(\'' + res.data.title + '\')"><i class="layui-icon">&#xe640;</i> 删除</a>');
	    }
	    ,error: function(){
	      
	    }
	  });
	});
  function del(name) {
		if(confirm("确认删除吗?") == true){
			var json_str = {"name": name};
			$.ajax({
		  		type: 'post',
		  		url: '<%=basePath%>assess_delFile.action',
		  		traditional: true,
		  		data: json_str,
		  		success: function() {
		  			$(".delFile").empty();
				}
		  	})
		} 
	}
	</script>
</body>
</html>