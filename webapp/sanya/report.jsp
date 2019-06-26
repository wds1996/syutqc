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
	<link rel="stylesheet" href="css/style7.css" type="text/css" />
	<link rel="stylesheet" href="<%=basePath%>Web/layui/css/layui.css" media="all">
	<script src="js/jquery-1.11.1.min.js"></script>
	<style>
		.content3{background:url(img/zhiliangbaogao.png) no-repeat;}
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
			<li class="stmenu"><h3><a href="index.jsp" class="xialaguang"><span>首页</span></a></h3></li>
			<li class="stmenu">
				<h3><a href="survey.jsp" class="xialaguang"><span>部门概况</span></a></h3>    
				<ul class="children">    
					<li><h3><a href="survey.jsp?1"><span>部门简介</span></a></h3></li>
					<li><h3><a href="survey.jsp?2"><span>岗位职责</span></a></h3></li>
					<li><h3><a href="survey.jsp?3"><span>联系方式</span></a></h3></li>
					
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
					<li><h3><a href="report.jsp?1"><span>质量报告</span></a></h3></li>
					<li><h3><a href="report.jsp?2"><span>工作简报</span></a></h3></li>
				</ul>
			</li>
			<li class="stmenu"><h3><a href="process.jsp" class="xialaguang"><span>制度流程</span></a></h3>
				<ul class="children">    
					<li><h3><a href="process.jsp?1"><span>制度流程</span></a></h3></li>
					<li><h3><a href="process.jsp?2"><span>工作交流</span></a></h3></li>
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
						<a href="index.jsp">首页</a>><a href="">质量报告</a>
					</div>
				
			</div>
			<ul class="nav">
				<li>质量报告</li>
				<li>工作简报</li>
				
			</ul>
			<div class="nav_content">
				<div class="ct">
					<table class="report_table" lay-filter="reportToPage"></table>
				</div>
				<div class="ct">
					<table class="work_table" lay-filter="workToPage"></table>
				</div>
			</div>
		</div>
	</div>
	
	<div class="bottom2">
		<div class="bottom2_content">
		<br>
			<p>联系我们：办公地址（书海馆三楼315）</p>
			<p>办公电话：88888888</p>
		</div>
	</div>
	<script type="text/javascript" src="<%=basePath%>Web/layui/layui.js"></script>
	<script>
	$(function(){
		
	       $('#nav-menu .menu > li').hover(function(){
		$(this).find('.children').animate({ opacity:'show', height:'show' },200);
		$(this).find('.xialaguang').addClass('navhover');
	}, function() {
		$('.children').stop(true,true).hide();
		$('.xialaguang').removeClass('navhover');
	});
	        })
	
	        var mystyle = {
			layout: ['prev', 'page', 'next', 'skip', 'count'],
			limit: 12,
	};
	layui.use('table', function(){
		var table = layui.table;
		table.render({
		  elem: '.report_table'
		  ,url: '<%=basePath%>report_findAll.action'
		  ,page: mystyle
		  ,skin: 'nob'
		  ,even: true
		  ,size: 'lg'
		  ,cols: [[ 
		    {field: 'id', title: 'ID',hide: true}
		    ,{field: 'name', title: '质量报告名称', width:'70%'}
		    ,{field: 'time', title: '发布时间', width:'30%', sort: true, align: 'center'}
		  ]]
		});
		table.on('row(reportToPage)', function(obj){
			  console.log(obj.data.id);
			  open("<%=basePath%>notice_findById?id=" + obj.data.id + "");
			});
	});
	
	layui.use('table', function(){
		var table = layui.table;
		table.render({
		  elem: '.work_table'
		  ,url: '<%=basePath%>work_findAll.action'
		  ,page: mystyle
		  ,skin: 'nob'
		  ,even: true
		  ,size: 'lg'
		  ,cols: [[ 
		    {field: 'id', title: 'ID',hide: true}
		    ,{field: 'name', title: '工作简报名称', width:'70%'}
		    ,{field: 'time', title: '发布时间', width:'30%', sort: true, align: 'center'}
		  ]]
		});
		table.on('row(workToPage)', function(obj){
			  console.log(obj.data.id);
			  open("<%=basePath%>report_findById?id=" + obj.data.id + "");
			});
	});
	// 侧边栏
	$(function(){
			var j=window.location.search;
			switch(j)
			{
			    case "?2":
			        j=1;
			        break;
			    default:
			        j=0;
			}
			$(".nav li").eq(j).addClass("active2");
			$(".ct").eq(j).show().siblings().hide();
			var box=$(".nav li")
			var index=box.index(this);
			$(".nav li").click(function(){
				$(".ct").eq(box.index(this)).show().siblings().hide();
				$(this).addClass("active2").siblings().removeClass("active2");
			})
		})	
	</script>
	</body>
</html>