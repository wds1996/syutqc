<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>首页--layui后台管理模板</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="<%=basePath%>css/font_eolqem241z66flxr.css" media="all" />
	<link rel="stylesheet" href="<%=basePath%>css/main.css" media="all" />
</head>
<body class="childrenBody">
	<div class="panel_box row">
		<div class="panel col">
			<a href="javascript:;" data-url="page/notice/list.jsp">
				<div class="panel_icon">
					<i class="layui-icon" data-icon="&#xe63a;">&#xe63a;</i>
				</div>
				<div class="panel_word newMessage">
					<span>${noticeList.size()}</span>
					<cite>通知公告</cite>
				</div>
			</a>
		</div>
		<div class="panel col">
			<a href="javascript:;" data-url="page/work/list.jsp">
				<div class="panel_icon" style="background-color:#FF5722;">
					<i class="iconfont icon-text" data-icon="icon-text"></i>
				</div>
				<div class="panel_word userAll">
					<span>${workList.size()}</span>
					<cite>工作简报</cite>
				</div>
			</a>
		</div>
		<div class="panel col">
			<a href="javascript:;" data-url="page/report/list.jsp">
				<div class="panel_icon" style="background-color:#009688;">
					<i class="layui-icon" data-icon="&#xe613;">&#xe613;</i>
				</div>
				<div class="panel_word userAll">
					<span>${reportList.size()}</span>
					<cite>质量报告</cite>
				</div>
			</a>
		</div>
		<div class="panel col">
			<a href="javascript:;" data-url="page/assess/list.jsp">
				<div class="panel_icon" style="background-color:#5FB878;">
					<i class="layui-icon" data-icon="&#xe64a;">&#xe64a;</i>
				</div>
				<div class="panel_word imgAll">
					<span>${assessList.size()}</span>
					<cite>评估动态</cite>
				</div>
			</a>
		</div>
		<div class="panel col">
			<a href="javascript:;" data-url="page/schedule/list.jsp">
				<div class="panel_icon" style="background-color:#F7B824;">
					<i class="iconfont icon-wenben" data-icon="icon-wenben"></i>
				</div>
				<div class="panel_word waitNews">
					<span>${scheduleList.size()}</span>
					<cite>工作交流</cite>
				</div>
			</a>
		</div>
		<div class="panel col">
			<a href="javascript:;" data-url="page/process/list.jsp">
				<div class="panel_icon" style="background-color:#A7B824;">
					<i class="iconfont icon-wenben" data-icon="icon-wenben"></i>
				</div>
				<div class="panel_word waitNews">
					<span>${processList.size()}</span>
					<cite>制度流程</cite>
				</div>
			</a>
		</div>
	</div>
	<div class="sysNotice2 col">
			<blockquote class="layui-elem-quote title">最新通知公告<i class="iconfont icon-new1"></i></blockquote>
			<table class="layui-table" lay-skin="line">
				<colgroup>
					<col>
					<col width="110">
				</colgroup>
				<tbody class="hot_news">
					<%int i=0; %>
					<s:iterator value="noticeList" var="notice">
						<%i++; 
						  if(i<5){%>						
							<tr>
				    			<td align="left">${notice.name}</td>
				    			<td>${notice.time}</td>
			    			</tr>	
			    		<%} %>			
		    		</s:iterator>
				</tbody>
			</table> 
		</div>
		<div class="sysNotice3 col">
			<blockquote class="layui-elem-quote title">最新评估动态<i class="iconfont icon-new1"></i></blockquote>
			<table class="layui-table" lay-skin="line">
				<colgroup>
					<col>
					<col width="110">
				</colgroup>
				<tbody class="hot_news">
					<%i=0; %>
					<s:iterator value="assessList" var="assess">
						<%i++; 
						  if(i<5){%>						
							<tr>
				    			<td align="left">${assess.name}</td>
				    			<td>${assess.time}</td>
			    			</tr>
			    		<%} %>			
		    		</s:iterator>
				</tbody>
			</table> 
		</div>
		<div class="sysNotice3 col">
			<blockquote class="layui-elem-quote title">最新工作简报<i class="iconfont icon-new1"></i></blockquote>
			<table class="layui-table" lay-skin="line">
				<colgroup>
					<col>
					<col width="110">
				</colgroup>
				<tbody class="hot_news">
					<%i=0; %>
					<s:iterator value="workList" var="work">
						<%i++; 
						  if(i<5){%>						
							<tr>
				    			<td align="left">${work.name}</td>
				    			<td>${work.time}</td>
			    			</tr>
			    		<%} %>			
		    		</s:iterator>
				</tbody>
			</table> 
		</div>
		<div class="sysNotice3 col">
			<blockquote class="layui-elem-quote title">最新质量报告<i class="iconfont icon-new1"></i></blockquote>
			<table class="layui-table" lay-skin="line">
				<colgroup>
					<col>
					<col width="110">
				</colgroup>
				<tbody class="hot_news">
					<%i=0; %>
					<s:iterator value="reportList" var="report">
						<%i++; 
						  if(i<5){%>						
							<tr>
				    			<td align="left">${report.name}</td>
				    			<td>${report.time}</td>
			    			</tr>
			    		<%} %>			
		    		</s:iterator>
				</tbody>
			</table> 
		</div>
		<div class="sysNotice3 col">
			<blockquote class="layui-elem-quote title">最新工作安排<i class="iconfont icon-new1"></i></blockquote>
			<table class="layui-table" lay-skin="line">
				<colgroup>
					<col>
					<col width="110">
				</colgroup>
				<tbody class="hot_news">
					<%i=0; %>
					<s:iterator value="scheduleList" var="schedule">
						<%i++; 
						  if(i<5){%>						
							<tr>
				    			<td align="left">${schedule.name}</td>
				    			<td>${schedule.time}</td>
			    			</tr>
			    		<%} %>			
		    		</s:iterator>
				</tbody>
			</table> 
		</div>
		<div class="sysNotice3 col">
			<blockquote class="layui-elem-quote title">最新制度流程<i class="iconfont icon-new1"></i></blockquote>
			<table class="layui-table" lay-skin="line">
				<colgroup>
					<col>
					<col width="110">
				</colgroup>
				<tbody class="hot_news">
					<%i=0; %>
					<s:iterator value="processList" var="process">
						<%i++; 
						  if(i<5){%>						
							<tr>
				    			<td align="left">${process.name}</td>
				    			<td>${process.time}</td>
			    			</tr>
			    		<%} %>			
		    		</s:iterator>
				</tbody>
			</table> 
		</div>
		<div class="sysNotice3 col">
			<blockquote class="layui-elem-quote title">最新政策文件<i class="iconfont icon-new1"></i></blockquote>
			<table class="layui-table" lay-skin="line">
				<colgroup>
					<col>
					<col width="110">
				</colgroup>
				<tbody class="hot_news">
					<%i=0; %>
					<s:iterator value="documentList" var="document">
						<%i++; 
						  if(i<5){%>						
							<tr>
				    			<td align="left">${document.name}</td>
				    			<td>${document.time}</td>
			    			</tr>
			    		<%} %>			
		    		</s:iterator>
				</tbody>
			</table> 
		</div>
	</div>
	<script type="text/javascript" src="<%=basePath%>layui/layui.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
</body>
</html>