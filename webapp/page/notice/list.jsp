<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>通知列表--layui后台管理模板</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font_eolqem241z66flxr.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/news.css" media="all" />
	<script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript">
		$(function() {
			initTable();
			$(".searchBtn").click(function() {
				var keyword = $(".keyword").val().trim();
				if(keyword != null&&keyword != "") {
					$(".mainList").attr("hidden", "hidden");
					$(".searchList").removeAttr("hidden");
					var targetUrl = $(".searchForm").attr("action");
					var data = $(".searchForm").serialize();
					$.ajax({
						type: 'post',
						url: targetUrl,
						traditional: true,
						data: data,
						dataType: 'json',
						success: function(array) {
 							if (jQuery.isEmptyObject(array)) {
 								$(".item").remove();
 								$(".searchList").append('<tr class="item"><td colspan="5">未查询到数据</td></tr>');
 							} else {
 								$(".item").remove();
 								for (var i = 0; i < array.length; i++) {
 									$(".searchList").append(			    		
										'<tr class="item">' +
 						    				'<td>' + i + '</td>' +
 						    				'<td align="left">' + array[i].name + '</td>' +
 						    				'<td>' + array[i].author + '</td>' +
 						    				'<td>' + array[i].time +'</td>' +
 						    				'<td>' +
 												'<a class="layui-btn layui-btn-mini" href="<%=basePath%>notice_toUpdate.action?id=' + array[i].id + '"><i class="iconfont icon-edit"></i> 编辑</a>' + 
 												'<a class="layui-btn layui-btn-danger layui-btn-mini" href="javascript:void(0)" onclick="del(\'' + array[i].id + '\')"><i class="layui-icon">&#xe640;</i> 删除</a>' +
 					        				'</td>' +
 						        		'</tr>'
 						   	 		)
 								}
 							}
						}
					})
				} else {
					$(".searchList").attr("hidden", "hidden");
					$(".mainList").removeAttr("hidden");
				}
			})
		})
		function initTable() {
			$.ajax({
				type: 'post',
				url: '<%=basePath%>notice_list.action',
				traditional: true,
				success: function(result) {
					var array = JSON.parse(result);
					if (jQuery.isEmptyObject(array)) {
						$(".mainList").append('<tr><td colspan="5">暂无数据</td></tr>');
					} else {
						for (var i = 0; i < array.length; i++) {
							$(".mainList").append(			    		
									'<tr>' +
					    				'<td>' + i + '</td>' +
					    				'<td align="left">' + array[i].name + '</td>' +
					    				'<td>' + array[i].author + '</td>' +
					    				'<td>' + array[i].time +'</td>' +
					    				'<td>' +
											'<a class="layui-btn layui-btn-mini" href="<%=basePath%>notice_toUpdate.action?id=' + array[i].id + '"><i class="iconfont icon-edit"></i> 编辑</a>' + 
											'<a class="layui-btn layui-btn-danger layui-btn-mini" href="javascript:void(0)" onclick="del(\'' + array[i].id + '\')"><i class="layui-icon">&#xe640;</i> 删除</a>' +
				        				'</td>' +
					        		'</tr>'
				   	 		)
						}
					}
				}
			})
		}
		function del(id) {
			if(confirm("确认删除吗?") == true){    
				location.href="<%=basePath%>notice_delete.action?id="+id;
			} 
		}
	</script>
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
		<form method="post" action="<%=basePath%>notice_keywordSearch.action" class="searchForm">
		    <div class="layui-input-inline">
		    	<input type="text" name="keyword" autocomplete="off" placeholder="请输入关键字" class="layui-input search_input keyword">
		    </div>  
		</form> 
		</div>
		<div class="layui-inline">
			<button class="layui-btn search_btn searchBtn">查询</button> 
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn" href="<%=basePath%>page/notice/add.jsp">添加文章</a>
		</div>
	</blockquote>
	<div class="layui-form news_list">
	  	<table class="layui-table">
		    <colgroup>
		    	<col width="6%">
				<col width="32%">
				<col width="20%">
				<col width="20%">
				<col width="20%">
		    </colgroup>
		    <thead>
				<tr>
					<th>序号</th>
					<th style="text-align:left;">文章标题</th>
					<th>发布人</th>
					<th>发布时间</th>
					<th>操作</th>
				</tr> 
		    </thead>
		    <tbody class="news_content mainList"></tbody>
		    <tbody class="news_content searchList" hidden="hidden">
		    </tbody>
		</table>
	</div>
	<div id="page"></div>
</body>
</html>