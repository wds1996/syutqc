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
	<link rel="stylesheet" href="css/style3.css" type="text/css" />
	<script src="js/jquery-1.11.1.min.js"></script>
	<style type="text/css">
		.form {
			width: 680px;
			padding-top: 18px;
			margin: 0 auto;
		}
		.title {
			float: left;
			width: 100px;
			text-align: right;
			padding-right: 10px;
		}
		.work {
			padding-right: 20px;
		}
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
						<a href="index.jsp">首页</a>><a href="">师生建议</a>
					</div>
				
			</div>
			<ul class="nav">
				<li>教师建议</li>
				<li>学生建议</li>
			</ul>
			<div class="nav_content">
				<div class="ct">
					<div class="ct_content">
						<div class="ct_content2">
							<div class="form"><h1>建议信息</h1></div>
							<form action="<%=basePath%>suggest_add.action" method="post" class="suggestForm">
								<input type="text" name="time" class="time" hidden="hidden">
								<div class="form">
									<label for="name" class="title">姓名:</label>
									<input type="text" id="name" name="name" class="input clean">
								</div>
								<div class="form">
									<label for="dept" class="title">部门/学院:</label>
									<input type="text" id="dept" name="dept" class="input clean">
								</div>
								<div class="form">
									<label for="tel" class="title">联系电话:</label>
									<input type="text" id="tel" name="tel" class="input clean">
								</div>
								<div class="form">
									<span class="title">老师/学生:</span>
									<input type="radio" name="work" id="teacher" class="work" value="老师">
									<label for="teacher">老师</label>
									<input type="radio" name="work" id="student" class="work" value="学生">
									<label for="student">学生</label>
								</div>
								<div class="form">
									<label for="content" class="title">建议内容:</label>
									<textarea name="content" id="content" cols="30" rows="10" class="clean"></textarea>
								</div>
							</form>
							<div class="form">
								<button class="submitForm">提交</button>
								<button onclick="clean()">重置</button>
							</div>
						</div>
					</div>
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
		    getTime();
		    $(".submitForm").click(function() {
		    	var targetUrl = $(".suggestForm").attr("action");
				var data = $(".suggestForm").serialize();
				$.ajax({
					type: 'post',
					url: targetUrl,
					traditional: true,
					data: data,
					success: function() {
						alert("感谢您的建议!");
						clean();
					}
				})
			})
        })
		function getTime() {
			var sysDate = new Date();
			var month = parseInt(sysDate.getMonth()) + 1;
			$(".time").val(sysDate.getFullYear() + "-" + month + "-" + sysDate.getDate());
		}
        function clean() {
			$(".clean").val("");
		}
	</script>
	</body>
</html>