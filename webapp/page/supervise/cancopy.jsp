<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>三亚学院教学评估平台</title>
	<link rel="stylesheet" href="<%=basePath%>css/page.css" type="text/css" />
	<script src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
	<style>
		.content3{
			width: 1200px;height: 60px;background:url(<%=basePath%>images/top_normal.png) no-repeat;
		}
		.content3_title {
			float: left;
			font-size: 22pt;
			font-family: '微软雅黑';
			color: white;
			width: 160px;
			height: 50px;
			text-align: center;
			line-height: 50px;
		}
		.ct_title {
			width: 1200px;
			height: 200px;
		}
		.ct_title .out_title {
			width: 900px;
			margin: 0 auto;
			text-align: center;
			line-height: 45px;
		}
		.ct_title .out_title h1{
			padding: 30px;
		}
		.ct_title .out_time {
			width: 1200px;
			height: 30px;
			font-size: 15px;
			text-align: center;
			line-height: 30px;
			color:#8B7765;
		}
		.ct_title .out_file {
			width: 900px;
			height: 30px;
			margin: 0 auto;
			font-size: 15px;
			line-height: 30px;
			color:#8B7765;
		}
		.ct_content {
			width: 900px;
			_height:1000px; min-height:1000px;
			margin: 0 auto;
		}
		.ct_content>p {text-align:justify; text-justify:inter-ideograph;}
		.ct_content table {margin: 0 auto;}
		.ct_content table td {border:1px solid black;}
		.ct_content>p>span{line-height: 2em;}
	</style>
</head>
<body>
	<div class="top">
		<div class="top_content">
			<p>
				<button><a href="">搜索</a></button>
				<input type="text" style="border-radius:5px;border:2px solid #202a68;width:150px;height:20px">
			</p>
		</div>
	</div>
<!-- 	顶部图片 -->
	<!-- 导航 -->
	
	<div class="box">

	<div id="nav-menu">
		<ul class="menu">
			<li class="stmenu"><h3><a href="<%=basePath%>index.jsp" class="xialaguang"><span>首页</span></a></h3></li>
			<li class="stmenu">
				<h3><a href="#" class="xialaguang"><span>部门概况</span></a></h3>    
				<ul class="children">    
					<li><h3><a href="<%=basePath%>sanya/survey.jsp#1"><span>部门简介</span></a></h3></li>
					<li><h3><a href="<%=basePath%>sanya/survey.jsp#2"><span>岗位职责</span></a></h3></li>
					<li><h3><a href="<%=basePath%>sanya/survey.jsp#3"><span>联系方式</span></a></h3></li>
					
				</ul>
			</li>
			<li class="stmenu">
				<h3><a href="<%=basePath%>sanya/evaluate.jsp" class="xialaguang"><span>教学评价</span></a></h3>    
				
			</li>
			<li class="stmenu">
				<h3><a href="<%=basePath%>sanya/supervise.jsp" class="xialaguang"><span>教学督导</span></a></h3>    
				
			</li>
			<li class="stmenu">
				<h3><a href="<%=basePath%>sanya/authentication.jsp" class="xialaguang"><span>专业认证</span></a></h3>   
				
			</li>
			<li class="stmenu"><h3><a href="<%=basePath%>sanya/report.jsp" class="xialaguang"><span>质量报告</span></a></h3>
				<ul class="children">    
					<li><h3><a href="<%=basePath%>sanya/report.jsp"><span>质量报告</span></a></h3></li>
					<li><h3><a href="<%=basePath%>sanya/report.jsp"><span>工作简报</span></a></h3></li>
				</ul>
			</li>
			<li class="stmenu"><h3><a href="<%=basePath%>sanya/process.jsp" class="xialaguang"><span>制度流程</span></a></h3>
				<ul class="children">    
					<li><h3><a href="<%=basePath%>sanya/process.jsp"><span>制度流程</span></a></h3></li>
					<li><h3><a href="<%=basePath%>sanya/process.jsp"><span>工作交流</span></a></h3></li>
				</ul>
			</li>
			<li class="stmenu">
				<h3><a href="<%=basePath%>sanya/file.jsp" class="xialaguang"><span>政策文件</span></a></h3>   
				
			</li>
			<li class="stmenu">
				<h3><a href="<%=basePath%>sanya/download.jsp" class="xialaguang"><span>下载中心</span></a></h3>   
				
			</li>
			<li class="stmenu">
				<h3><a href="#" class="xialaguang"><span>学校首页</span></a></h3>   
				
			</li>
		</ul>
	</div>
	
	
</div>
	<div class="banner">
		<div class="banner_content">
			<img src="<%=basePath%>images/0002.jpg" alt="">
		</div>
	</div>
	
	<div class="content">
		<div class="content2">
			<div class="content3">
				<div class="content3_title"><strong>${supervise.way}</strong></div>
			</div>
			<div class="nav_content">
				<div class="ct">
					<div class="ct_title">
						<div class="out_title"><h1>${supervise.name}</h1></div>
						<div class="out_time">发布时间：${supervise.time}</div>
						<div class="out_file">下载附件：<a href="<%=basePath%>sanya/file/file/${supervise.fileName}" download="${supervise.fileName}">${supervise.fileName}</a></div>
					</div>
					<div class="ct_content">${supervise.content}</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="bottom2">
		<div class="bottom2_content">
		<br>
			<p>办公地址：三亚学院书海馆三楼315</p>
			<p>办公电话：88386135</p>
		</div>
	</div>
	<script>
	$(function(){
		
       $('#nav-menu .menu > li').hover(function(){
	$(this).find('.children').animate({ opacity:'show', height:'show' },200);
	$(this).find('.xialaguang').addClass('navhover');
}, function() {
	$('.children').stop(true,true).hide();
	$('.xialaguang').removeClass('navhover');
});
       $(".ct_content table").attr("style", "margin-left:auto;");
        })
	
	</script>
	</body>
</html>