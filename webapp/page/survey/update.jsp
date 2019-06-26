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
	<div class="closeBtn"><a href="<%=basePath%>page/survey/list.jsp" target="_self"><i class="layui-icon">&#x1006;</i></a></div>
	<form class="layui-form" action="<%=basePath%>survey_update.action" method="post">
		<input name="id" type="text" hidden="hidden" value="${survey.id}">
		<div class="layui-form-item">
			<label class="layui-form-label">部门简介</label>
			<div class="layui-input-block">
				<textarea class="layui-textarea layui-hide" name="introduce" lay-verify="content" id="editcontent1">${survey.introduce}</textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">岗位职责</label>
			<div class="layui-input-block">
				<textarea class="layui-textarea layui-hide" name="duty" lay-verify="content" id="editcontent2">${survey.duty}</textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">联系方式</label>
			<div class="layui-input-block">
				<textarea class="layui-textarea layui-hide" name="information" lay-verify="content" id="editcontent3">${survey.information}</textarea>
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
	layui.use(['layedit', 'layer', 'jquery'], function () {
        var $ = layui.jquery;
        var layedit = layui.layedit;
        layedit.set({
            uploadImage: {
                url: '<%=basePath%>survey_uploadImage.action',
                accept: 'image',
                acceptMime: 'image/*',
                exts: 'jpg|png|gif|bmp|jpeg',
                size: '10240'
            }
            , calldel: {
                url: '<%=basePath%>survey_deleteImage.action'
            }
            , devmode: true
            , tool: [
                'code', 'strong', 'italic', 'underline', 'del', 'addhr', '|', 'fontFomatt', 'colorpicker', 'face'
                , '|', 'left', 'center', 'right', '|', 'link', 'unlink', 'image_alt', 'anchors'
                , '|', 'fullScreen'
            ]
            , height: '100%'
        });
        var ieditor = layedit.build('editcontent1');
    })
    layui.use(['layedit', 'layer', 'jquery'], function () {
        var $ = layui.jquery;
        var layedit = layui.layedit;
        layedit.set({
            uploadImage: {
                url: '<%=basePath%>survey_uploadImage.action',
                accept: 'image',
                acceptMime: 'image/*',
                exts: 'jpg|png|gif|bmp|jpeg',
                size: '10240'
            }
            , calldel: {
                url: '<%=basePath%>survey_deleteImage.action'
            }
            , devmode: true
            , tool: [
                'code', 'strong', 'italic', 'underline', 'del', 'addhr', '|', 'fontFomatt', 'colorpicker', 'face'
                , '|', 'left', 'center', 'right', '|', 'link', 'unlink', 'image_alt', 'anchors'
                , '|', 'fullScreen'
            ]
            , height: '100%'
        });
        var ieditor = layedit.build('editcontent2');
    })
    layui.use(['layedit', 'layer', 'jquery'], function () {
        var $ = layui.jquery;
        var layedit = layui.layedit;
        layedit.set({
            uploadImage: {
                url: '<%=basePath%>survey_uploadImage.action',
                accept: 'image',
                acceptMime: 'image/*',
                exts: 'jpg|png|gif|bmp|jpeg',
                size: '10240'
            }
            , calldel: {
                url: '<%=basePath%>survey_deleteImage.action'
            }
            , devmode: true
            , tool: [
                'code', 'strong', 'italic', 'underline', 'del', 'addhr', '|', 'fontFomatt', 'colorpicker', 'face'
                , '|', 'left', 'center', 'right', '|', 'link', 'unlink', 'image_alt', 'anchors'
                , '|', 'fullScreen'
            ]
            , height: '100%'
        });
        var ieditor = layedit.build('editcontent3');
    })
	</script>
</body>
</html>