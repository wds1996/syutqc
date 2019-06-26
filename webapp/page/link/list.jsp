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
		})
		function initTable() {
			$.ajax({
				type: 'post',
				url: '<%=basePath%>link_list.action',
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
					    				'<td>' + array[i].url + '</td>' +
					    				'<td>' +
											'<a class="layui-btn layui-btn-mini" href="<%=basePath%>link_toUpdate.action?id=' + array[i].id + '"><i class="iconfont icon-edit"></i> 编辑</a>' + 
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
				location.href="<%=basePath%>link_delete.action?id="+id;
			} 
		}
	</script>
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn" href="<%=basePath%>page/link/add.jsp">添加链接</a>
		</div>
	</blockquote>
	<div class="layui-form news_list">
	  	<table class="layui-table">
		    <colgroup>
		    	<col width="6%">
				<col width="35%">
				<col width="35%">
				<col width="24%">
		    </colgroup>
		    <thead>
				<tr>
					<th>序号</th>
					<th style="text-align:left;">网站名称</th>
					<th>网站地址</th>
					<th>操作</th>
				</tr> 
		    </thead>
		    <tbody class="news_content mainList"></tbody>
		</table>
	</div>
	<div id="page"></div>
</body>
</html>