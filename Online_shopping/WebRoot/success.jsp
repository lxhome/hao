<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String str =(String)request.getAttribute("temp");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>状态页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <link rel="stylesheet" href="css/gobal.css" type="text/css"></link>
  <link rel="stylesheet" href="css/layout.css" type="text/css"></link>
<link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico">
  <link rel="stylesheet" href="css/register.css" type="text/css"></link>
  <script type="text/javascript" src="js/register.js"></script>
  
  <body >
  <div id="container">
  <jsp:include page="Top.jsp"></jsp:include>
<div id="suc">
<%if(temp!=null){ %>
<h1><%=str %></h1>
<%} else{%>
  <h1>您已网上支付成功</h1>
<%} %>
</div>


   <jsp:include page="Bottom.jsp"></jsp:include>
   </div>
  </body>
</html>
