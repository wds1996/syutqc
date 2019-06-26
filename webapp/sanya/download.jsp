<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>三亚学院教学质量监控处</title>
	<link rel="stylesheet" href="css/style9.css" type="text/css" />
	<link rel="stylesheet" href="<%=basePath%>Web/layui/css/layui.css" media="all">
	<script src="js/jquery-1.11.1.min.js"></script>
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
			<li class="stmenu"><h3><a href="index.jsp" class="xialaguang"><span>首页</span></a></h3></li>
			<li class="stmenu">
				<h3><a href="#" class="xialaguang"><span>部门概况</span></a></h3>    
				<ul class="children">    
					<li><h3><a href="survey.jsp"><span>部门简介</span></a></h3></li>
					<li><h3><a href="survey.jsp"><span>岗位职责</span></a></h3></li>
					<li><h3><a href="survey.jsp"><span>联系方式</span></a></h3></li>
					
				</ul>
			</li>
			<li class="stmenu">
				<h3><a href="evaluate.jsp" class="xialaguang"><span>教学评价</span></a></h3>    
				
			</li>
			<li class="stmenu">
				<h3><a href="supervise.jsp" class="xialaguang"><span>教学督导</span></a></h3>    
				
			</li>
			<li class="stmenu">
				<h3><a href="authentication.jsp" class="xialaguang"><span>专业认证</span></a></h3>   
				
			</li>
			<li class="stmenu"><h3><a href="report.jsp" class="xialaguang"><span>质量报告</span></a></h3>
				<ul class="children">    
					<li><h3><a href="report.jsp"><span>质量报告</span></a></h3></li>
					<li><h3><a href="report.jsp"><span>工作简报</span></a></h3></li>
				</ul>
			</li>
			<li class="stmenu"><h3><a href="process.jsp" class="xialaguang"><span>制度流程</span></a></h3>
				<ul class="children">    
					<li><h3><a href="process.jsp"><span>制度流程</span></a></h3></li>
					<li><h3><a href="process.jsp"><span>工作交流</span></a></h3></li>
				</ul>
			</li>
			<li class="stmenu">
				<h3><a href="file.jsp" class="xialaguang"><span>政策文件</span></a></h3>   
				
			</li>
			<li class="stmenu">
				<h3><a href="download.jsp" class="xialaguang"><span>下载中心</span></a></h3>   
				
			</li>
			<li class="stmenu">
				<h3><a href="http://www.sanyau.edu.cn/" class="xialaguang"><span>学校首页</span></a></h3>   
				
			</li>
		</ul>
	</div>
	
	
</div>
	<div class="banner">
		<div class="banner_content">
			<img src="img/0002.jpg" alt="">
		</div>
	</div>
	
	<div class="content">
		<div class="content2">
			<div class="content3">
				<!-- <img src="img/bumen2.png" alt=""> -->
					<div class="content3_nav">
						<a href="index.jsp">首页</a>><a href="">下载中心</a>
					</div>
				
			</div>
			<ul class="nav">
				<li>下载中心</li>
				
			</ul>
			<div class="nav_content">
				<div class="ct">
					<table class="download_table" lay-filter="downloadToPage"></table>
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
	<script type="text/javascript" src="<%=basePath%>Web/layui/layui.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/download.js"></script>
	<script>
	$(function(){
		
       $('#nav-menu .menu > li').hover(function(){
	$(this).find('.children').animate({ opacity:'show', height:'show' },200);
	$(this).find('.xialaguang').addClass('navhover');
}, function() {
	$('.children').stop(true,true).hide();
	$('.xialaguang').removeClass('navhover');
});

       var num=0;
			$(".ct_download").eq(0).show();
			$(".button1").click(function(){
				num++;
				$(".ct_download").eq(num).show().siblings(".ct_download").hide();
				
			})
			$(".button0").click(function(){
				num--;
				$(".ct_download").eq(num).show().siblings(".ct_download").hide();
			})
        })
	
        var mystyle = {
			layout: ['prev', 'page', 'next', 'skip', 'count'],
			limit: 12,
	};
	layui.use('table', function(){
		var table = layui.table;
		table.render({
		  elem: '.download_table'
		  ,url: '<%=basePath%>download_findAll.action'
		  ,page: mystyle
		  ,skin: 'nob'
		  ,even: true
		  ,size: 'lg'
		  ,cols: [[ 
		    {field: 'id', title: 'ID',hide: true}
		    ,{field: 'fileName', title: '名称',hide: true}
		    ,{field: 'name', title: '文件名', width:'70%'}
		    ,{field: 'time', title: '发布时间', width:'15%', sort: true, align: 'center'}
		    ,{title: '操作', width:'15%', toolbar: '#tool_download', align: 'center'}
		  ]]
		});
	});
	</script>
	<script type="text/html" id="tool_download">
		<a class="layui-btn layui-btn-xs" href="<%=basePath%>sanya/file/file/{{d.fileName}}" download="{{d.fileName}}">下载</a>
	</script>
	</body>
</html>