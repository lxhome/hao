
<%@ page language="java" import="java.util.*,com.hao.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Users admin = (Users)request.getSession().getAttribute("admin");
if(admin == null) request.getRequestDispatcher("../index.jsp").forward(request, response);
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>网上商城</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/layout.css" type="text/css"></link>
<link rel="stylesheet" href="css/gobal.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-1.9.0.js"></script>

	<link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico"
	type="image/x-icon">

  <link rel="stylesheet" href="../css/layout.css" type="text/css"></link>
  <link rel="stylesheet" href="../css/gobal.css" type="text/css"></link></head>
  
  <body >
  <div id="container">
  <jsp:include page="../Top.jsp"></jsp:include>
  
  <br>
  <div style="font-size:18px;text-align:right;margin-right:20px;">
    欢迎你! <%=admin.getName() %> 
  </div> 
  
  	<h1>商城管理首页</h1>
  <br>
    <table style="margin-left:200px; width:600px;height:200px;" border="1">
    	<tr>
    		<td style="background-color:pink;"><h2>订单管理</h2></td>
    		<td style="background-color:silver"><h2>商品管理</h2></td>
    		<td style="background-color:lightblue"><h2>用户管理</h2></td>
    	</tr>
    	<tr height=75%>
   			<td style="background-color:pink;">
   				<a href="admin/orderManager.jsp?type=1">查看所有已下订单</a><br><br>
   				<a href="admin/orderManager.jsp?type=2">查看正在处理订单</a><br>
   			</td>
   			<td style="background-color:silver">
   				<a >查看所有商品</a><br><br>
   				<a >添加商品</a><br>
   			</td>
   			<td style="background-color:lightblue">	
  				<a href="admin/userManager.jsp">查看所有用户</a><br><br>
  			</td>
  		</tr>
   </table>
   <br>
  </div>
  </body>
</html>
