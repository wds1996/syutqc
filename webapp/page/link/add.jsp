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
	<script src="<%=basePath%>Web/layui/layui.js"></script>
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
	<div class="closeBtn"><a href="<%=basePath%>page/link/list.jsp" target="_self"><i class="layui-icon">&#x1006;</i></a></div>
	<form class="layui-form" action="<%=basePath%>link_add.action" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label">网站名称</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input linksName" lay-verify="required" placeholder="请输入网站名称" name="name">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">网站地址</label>
			<div class="layui-input-block">
				<input type="tel" class="layui-input linksUrl" lay-verify="required|url" placeholder="请输入网站地址" name="url">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addNews">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
</body>
</html>