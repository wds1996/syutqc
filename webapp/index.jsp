<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String site = new String(basePath + "sanya/index.jsp");
   	response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
   	response.setHeader("Location", site);
%>