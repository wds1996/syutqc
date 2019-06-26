<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>查看</title>
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
			margin-right: 10px;
		}
		.ct_content2{width: 800px;height: 600px;margin: 50px auto;border-radius: 30px;border: 2px dashed #1c2765;}
		.info {
			padding-bottom: 20px;
		}
		.other {
			text-align: right;
			margin-right: 18px;
			font-family: "微软雅黑";
			font-size: 13pt;
		}
		.content {
			width: 780px;
			height: 300px;font-family: "微软雅黑";font-size: 13pt;
			margin: 0 auto;
		}
	</style>
</head>
<body>
		<div class="closeBtn"><a href="<%=basePath%>page/suggest/list.jsp" target="_self"><i class="layui-icon">&#x1006;</i></a></div>
		<div class="ct_content2">
			<div class="form info" style="text-align: center;"><h1>建议信息</h1></div>
			<div class="info content">
				<p style="text-indent:2em;">${suggest.content}</p>
			</div>
			<div class="info other">
				<span>姓名:${suggest.name}</span>
			</div>
			<div class="info other">
				<span>老师/学生:${suggest.work}</span>
			</div>
			<div class="info other">
				<span>部门/学院:${suggest.dept}</span>
			</div>
			<div class="info other">
				<span>联系方式:${suggest.tel}</span>
			</div>
			<div class="info other">
				<span>时间:${suggest.time}</span>
			</div>
		</div>
		<%-- 
		
		
		<div class="info">
			<span>老师/学生:</span>
			<span>${suggest.work}</span>
		</div>
		 --%>
</body>
</html>