<%@page import="com.hao.man.OrderMan"%>
<%@ page language="java" import="java.util.*,com.hao.model.*"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String type = (String) request.getParameter("type");
	ArrayList<OrderMan> al = new ArrayList<OrderMan>();
	ArrayList<Flash> alList = new ArrayList<Flash>();
	OrdersCl oc = new OrdersCl();
	Users user = new Users();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>商城</title>
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
<link rel="stylesheet" href="../css/gobal.css" type="text/css"></link>
</head>

<body>
	<div id="container">
		<jsp:include page="../Top.jsp"></jsp:include>

		<h2>订单管理</h2>
		<a href="admin/AdminIndex.jsp">后台首页</a><br />
		<hr width=500px;>
		<%
			if (type.equals("1")) {
				al = oc.getRecord();
		%>
		<h3>所有已下的订单</h3>



		<table border=1 align="center"
			style="background-color:silver;width:800px; text-align:center">
			<tr>
				<td>下订时间</td>
				<td>顾客名</td>
				<td>送货电话</td>
				<td>用户名</td>
				<td>商品名称</td>
				<td>商品数量</td>
				<td>商品价格</td>
			<tr></tr>

			<%
				for (int i = 0; i < al.size(); i++) {
					
			%>
			<tr>
				<td><%=al.get(i).getTime()%></td>
				<td><%=al.get(i).getCus_name()%></td>
				<td><%=al.get(i).getPhone()%></td>
				<td><%=al.get(i).getO_name()%></td>
				<td><%=al.get(i).getName()%></td>
				<td><%=al.get(i).getAmount()%></td>
				<td><%=al.get(i).getPrice()%></td>
			</tr>
			<%
				}

				} else if (type.equals("2")) {
					alList =oc.getFlash();
			%>
			<table border=1 align="center"
				style="background-color:silver;width:800px; text-align:center">
				<tr>
					<td>商品id</td>
					<td>商品名</td>
					<td>商品数量</td>
					<td>商品价格</td>
					<td>用户名</td>
					<%
						for (int i = 0; i < alList.size(); i++) {
					%>
				
				<tr>
					<td><%=alList.get(i).getId()%></td>
					<td><%=alList.get(i).getName()%></td>
					<td><%=alList.get(i).getAmount()%></td>
					<td><%=alList.get(i).getPrice()%></td>
					<td><%=alList.get(i).getUserName()%></td>

				</tr>

				<%
					}
					}
				%>
			</table>
			<br>
			</div>
			
</body>
</html>
