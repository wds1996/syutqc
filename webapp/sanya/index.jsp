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
	<link rel="stylesheet" href="css/style.css" type="text/css" />
	<script src="js/jquery-1.11.1.min.js"></script>
	<SCRIPT type="text/javascript" src="js/jquery-1.7.1.min.js"></SCRIPT>

<SCRIPT type="text/javascript" src="js/jquery.event.drag-1.5.min.js"></SCRIPT>

<SCRIPT type="text/javascript" src="js/jquery.touchSlider.js"></SCRIPT>
<style type="text/css">
	.time_top {
		width: 100%;
		height: 25px;
		margin: 0;
		color: white;
		text-align: center;
		font-size: 16pt;
	}
	.time_bottom {
		width: 100%;
		height: 25px;
		margin: 0;
		color: white;
		text-align: center;
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

	<!-- 导航结束 -->
	
	<!-- 轮播图 -->
	<!-- <div id="container">
          <div id="list" style="left: -1200px;">
             
              <img src="img/13.jpg" alt="1" />
              <img src="img/11.jpg" alt="1" />
              <img src="img/12.jpg" alt="2" />
              <img src="img/13.jpg" alt="3" />
              <img src="img/11.jpg" alt="3" />               
        </div>
           <div id="buttons">
             <span index="1" class="on"></span>
             <span index="2"></span>
             <span index="3"></span>
         </div>

        <a href="javascript:;" id="prev" class="arrow">&lt;</a>
         <a href="javascript:;" id="next" class="arrow">&gt;</a>        
     </div> -->
     <DIV class="main_visual">
<DIV class="flicking_con">
	<DIV class="flicking_inner">
		<A href="#"></A><A href="#"></A><A href="#"></A>
	</DIV>
</DIV>
<DIV class="main_image">
<UL>
  <LI><SPAN class="img_3">
	<div class="main_content2">
		<div class="main_content3">
			<p style="font-size:50px">UNIVERSITY OF SANYA</p>
			<p style="font-size:30px;">质量是学校发展的生命线</p>
			<p style="font-size:20px;margin-top:10px">以学生为中心</p>
			<p style="font-size:20px;">结果导向</p>
			<p style="font-size:20px;">持续改进</p>
		</div>
	</div>
  </SPAN></LI>
  <!-- <LI><SPAN class="img_4"></SPAN></LI> -->
  <LI><SPAN class="img_1">
	<div class="main_content2">
		<div class="main_content3">
			<p style="font-size:50px">UNIVERSITY OF SANYA</p>
			<p style="font-size:30px;">质量方针</p>
			<p style="font-size:20px;margin-top:10px">品质文化是USY主流文化之一</p>
			<p style="font-size:20px;">学校卓越发展必须依靠教学质量和整体工作品质全面提升的基础</p>
			<p style="font-size:20px;">这也是USY核心竞争力建设和持续提升的重中之重</p>
		</div>
	</div>
  </SPAN></LI>
  <LI><SPAN class="img_2">
	<div class="main_content2">
		<div class="main_content3">
			<p style="font-size:50px">UNIVERSITY OF SANYA</p>
			<p style="font-size:30px;">办学品质</p>
			<p style="font-size:20px;margin-top:10px">追求办学品质是USY不断进取和卓越发展的基础</p>
			<p style="font-size:20px;">品质目标是站在时代前沿去评价自身的教育理想、教育理念指导下的教育品质和工作品质</p>
			<p style="font-size:20px;">USY必须实现能够为自己的品质而骄傲</p>
		</div>
	</div>
  </SPAN></LI>
 <!--  <LI><SPAN class="img_5"></SPAN> --></LI></UL>
<!-- <div class="main_content2"></div> -->
 <A id="btn_prev" 
href="javascript:;"></A><A id="btn_next" 
href="javascript:;"></A></DIV></DIV><BR>

     <!-- 轮播图结束 -->
	<div class="qianlan"></div>
     <div class="clear" style="clear:both"></div>
	<!-- 蓝条 -->
     <div class="lantiao">
		<div class="lantiao_content">
			<div class="lantiao_content2"></div>
			<div class="lantiao_content3"></div>
		</div>
     </div>
	<!-- 通知公告 -->
     <div class="notice">
     	<div class="notice_content">
     		<div class="notice_content_left">
     		<span><h3 style="display:inline-block">通知公告</h3></span>
			<span><a href="notice.jsp">+MORE</a></span></div>
			<div class="notice_content_left1">
     		<span><h3 style="display:inline-block">工作简报</h3></span>
			<span><a href="report.jsp">+MORE</a></span></div>
			
     	</div>
     </div>
	<!-- 通知公告内容 -->
     <div class="content">
		<div class="content2">
			<div class="content_con1">
				<div class="content_left">
					<div class="content_left1">
						<div class="time_top"></div>
						<div class="time_bottom"></div>
					</div>
				</div>
				<div class="content_right">
					<div class="content_right1 noticeTitle"></div>
					<div class="content_right2 noticeContent"></div>
				</div>
				<img src="img/a.jpg" alt="">
			</div>

			<div class="content_con1" style="margin-left:30px;">
				<div style="width: 380px;height: 195px;">
					<ul class="work3 mywork1"></ul>
				</div>

				<img src="img/b.jpg" alt="">
			</div>

			<div class="content_con1" style="margin-left:30px;">
				<div style="width: 380px;height: 195px;">
					<ul class="work3 mywork2"></ul>
				</div>
				<img src="img/c.jpg" alt="">
			</div>
			
			
		</div>
     </div>
     <!-- 通知公告内容结束 -->
	<!-- 工作简报 开始-->
	<div class="work">
		<div class="work_content">
			<div class="work_content_left">
				<div class="work_blue">
					<div class="work_blue2"></div>
					<div class="work_blue3"></div>
				</div>
				<div class="work_top">
					<div class="work_top2">
					<span><h3 style="display:inline-block">质量报告</h3></span>
			<span><a href="report.jsp">＋MORE</a></span></div>

			<div class="work_top3">
					<span><h3 style="display:inline-block">评估动态</h3></span>
			<span><a href="assess.jsp">＋MORE</a></span></div>
					
				</div>
				<ul class="work2 report"></ul>
				<ul class="work2 assess" style="margin-left:50px;"></ul>

			</div>
			<!-- 工作简报结束 -->
			<div class="work_content_right">
				<div class="work2_lantiao"></div>
				<div class="work2_top">
					<span><h3 style="display:inline-block">工作交流</h3></span>
			<span><a href="process.jsp">＋MORE</a></span>
				</div>
				<ul class="work2_right2 schedule" ></ul>
			</div>
		</div>
	</div>
	<!-- 通知公告和工作简报结束 -->
	<!-- banner -->
	<div class="banner">
		<div class="banner_content">
			<div id="rollCon">
    		<div id="rollSubject">
       		 <p>坚持“以学生为中心”，坚定聚焦“学生竞争力”</p>
       		
       		 <p>目标达成度，社会适应度，条件保障度，质保有效度，结果满意度</p>
       		 
      		
       		 <p>及时评价，及时反馈，持续改进</p>
        		
    		</div>
    <div id="rollCopy"></div>
</div>

		</div>
	</div>
	<!-- banner over -->
	<!-- 底部工作简报 -->
	<div class="last">
		<div class="last_content">
			<div class="last_content_right">
				<div class="last_lantiao"></div>
				<div class="last_top">
					<span><h3 style="display:inline-block">制度流程</h3></span>
			<span><a href="process.jsp">＋MORE</a></span>
				</div>
				<ul class="last_right2 process" ></ul>
			</div>

			<div class="last_content_right" style="margin-left:30px;">
				<div class="last_lantiao"></div>
				<div class="last_top">
					<span><h3 style="display:inline-block">政策文件</h3></span>
			<span><a href="file.jsp">＋MORE</a></span>
				</div>
				<ul class="last_right2 file"></ul>
			</div>
			
			<!-- 师生建议和问卷调查 -->
			<div class="last_content_right" style="margin-left:30px;">
				<div class="last_lantiao"></div>
                <div class="last_left">
					<h3><a href="shishengjianyi.html">师生建议</a></h3>
					<a href="suggest.jsp"><img src="img/14.png" alt=""></a>
                </div>
                <div class="last_left">
					<h3><a href="https://www.wjx.cn/">问卷调查</a></h3>
					<a href="https://www.wjx.cn/"><img src="img/15.png" alt=""></a>
                </div>
                <div class="clear" style="clear:both;"></div>
                <div class="bottom">
					<h3 style="display:inline-block">友情链接</h3>
					<select name="" id="link_url" onchange="window.location=this.value;">
						<option value="#">下拉选择友情链接</option>
					</select>
                </div>
			</div>
		</div>
	</div>
	<div class="clear" style="clear:both"></div>
	<div class="bottom2">
		<div class="bottom2_content">
		<br>
			<p>办公地址：三亚学院书海馆三楼315</p>
			<p>办公电话：88386135</p>
		</div>
	</div>
    </style>
    <script type="text/javascript"> 
       $(function(){
			        $('#nav-menu .menu > li').hover(function(){
				$(this).find('.children').animate({ opacity:'show', height:'show' },200);
				$(this).find('.xialaguang').addClass('navhover');
			}, function() {
				$('.children').stop(true,true).hide();
				$('.xialaguang').removeClass('navhover');
			})	
			        $(".main_visual").hover(function(){
					$("#btn_prev,#btn_next,.main_content3").fadeIn()
					},function(){
					$("#btn_prev,#btn_next,.main_content3").fadeOut()
					})
				$dragBln = false;
				$(".main_image").touchSlider({
					flexible : true,
					speed : 200,
					btn_prev : $("#btn_prev"),
					btn_next : $("#btn_next"),
					paging : $(".flicking_con a"),
					counter : function (e) {
						$(".flicking_con a").removeClass("on").eq(e.current-1).addClass("on");
					}
				});
				$(".main_image").bind("mousedown", function() {
					$dragBln = false;
				})
				$(".main_image").bind("dragstart", function() {
					$dragBln = true;
				})
				$(".main_image a").click(function() {
					if($dragBln) {
						return false;
					}
				})
				timer = setInterval(function() { $("#btn_next").click();}, 5000);
				$(".main_visual").hover(function() {
					clearInterval(timer);
				}, function() {
					timer = setInterval(function() { $("#btn_next").click();}, 5000);
				})
				$(".main_image").bind("touchstart", function() {
					clearInterval(timer);
				}).bind("touchend", function() {
					timer = setInterval(function() { $("#btn_next").click();}, 5000);
				})
        	getNotice();
			getReport();
			getSchedule();
			getProcess();
			getFile();
			getAssess();
			getWork1();
			getWork2();
			getUrl();
        })
        function getUrl() {
			$.ajax({
				type: 'post',
				url: '<%=basePath%>link_list.action',
				traditional: true,
				success: function(result) {
					var obj = JSON.parse(result);
					for (var i = 0; i < obj.length; i++) {
						$("#link_url").append('<option value="'+obj[i].url+'">'+obj[i].name+'</option>');
					}
				}
			})
		}
        function getNotice() {
			$.ajax({
				type: 'post',
				url: '<%=basePath%>notice_getNew.action',
				traditional: true,
				success: function(result) {
					var obj = JSON.parse(result);
					for (var i = 0; i < obj.length; i++) {
						var time = obj[i].time.split("-");
						$(".time_top").append(time[2]);
						$(".time_bottom").append('<small style="font-size:12px;">' + time[0] + "." + time[1] + '</small>');
						$(".noticeTitle").append('<h4><a href="<%=basePath%>notice_findById?id=' + obj[i].id + '">' + obj[i].name +'</a></h4>');
						$(".noticeContent").append('<a href="<%=basePath%>notice_findById?id=' + obj[i].id + '"style="font-size: 10px">' + obj[i].content + '</a>')
					}
				}
			})
		}
       function getReport() {
			$.ajax({
				type: 'post',
				url: '<%=basePath%>report_getNew.action',
				traditional: true,
				success: function(result) {
					var obj = JSON.parse(result);
					for (var i = 0; i < obj.length; i++) {
						$(".report").append('<li><span style="display:block;width:368px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;"><a title="'+ obj[i].name +'" href="<%=basePath%>report_findById?id=' + obj[i].id + '">' + obj[i].name + '</a></span></li>');
					}
				}
			})
		}
       function getSchedule() {
			$.ajax({
				type: 'post',
				url: '<%=basePath%>schedule_getNew.action',
				traditional: true,
				success: function(result) {
					var obj = JSON.parse(result);
					for (var i = 0; i < obj.length; i++) {
						$(".schedule").append('<li><span style="display:block;width:368px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;"><a title="'+ obj[i].name +'" href="<%=basePath%>schedule_findById?id=' + obj[i].id + '">' + obj[i].name + '</a></span></li>');
					}
				}
			})
		}
		function getProcess() {
			$.ajax({
				type: 'post',
				url: '<%=basePath%>process_getNew.action',
				traditional: true,
				success: function(result) {
					var obj = JSON.parse(result);
					for (var i = 0; i < obj.length; i++) {
						$(".process").append('<li><span style="display:block;width:368px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;"><a title="'+ obj[i].name +'" href="<%=basePath%>process_findById?id=' + obj[i].id + '">' + obj[i].name + '</a></span></li>');
					}
				}
			})
		}
		function getFile() {
			$.ajax({
				type: 'post',
				url: '<%=basePath%>file_getNew.action',
				traditional: true,
				success: function(result) {
					var obj = JSON.parse(result);
					for (var i = 0; i < obj.length; i++) {
						$(".file").append('<li><span style="display:block;width:368px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;"><a title="'+ obj[i].name +'" href="<%=basePath%>file_findById?id=' + obj[i].id + '">' + obj[i].name + '</a></span></li>');
					}
				}
			})
		}
		function getAssess() {
			$.ajax({
				type: 'post',
				url: '<%=basePath%>assess_getNew.action',
				traditional: true,
				success: function(result) {
					var obj = JSON.parse(result);
					for (var i = 0; i < obj.length; i++) {
						$(".assess").append('<li><span style="display:block;width:368px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;"><a title="'+ obj[i].name +'" href="<%=basePath%>assess_findById?id=' + obj[i].id + '">' + obj[i].name + '</a></span></li>');
					}
				}
			})
		}
		function getWork1() {
			$.ajax({
				type: 'post',
				url: '<%=basePath%>work_getNew1.action',
				traditional: true,
				success: function(result) {
					var obj = JSON.parse(result);
					for (var i = 0; i < obj.length; i++) {
						$(".mywork1").append('<li><span style="display:block;width:368px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;"><a title="'+ obj[i].name +'" href="<%=basePath%>work_findById?id=' + obj[i].id + '">' + obj[i].name + '</a></span></li>');
					}
				}
			})
		}
		function getWork2() {
			$.ajax({
				type: 'post',
				url: '<%=basePath%>work_getNew2.action',
				traditional: true,
				success: function(result) {
					var obj = JSON.parse(result);
					for (var i = 0; i < obj.length; i++) {
						$(".mywork2").append('<li><span style="display:block;width:368px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;"><a title="'+ obj[i].name +'" href="<%=basePath%>work_findById?id=' + obj[i].id + '">' + obj[i].name + '</a></span></li>');
					}
				}
			})
		}
				
		function xx(){
		var container=document.getElementById("rollSubject");
		container.appendChild(container.firstChild);
		}
		setInterval("xx()",3000);
		    </script>
		<script>
			if(top!=this){
				// 在frame中时处理
				window.parent.location.href='index.jsp';
				}	
</script>
</body>
</html>