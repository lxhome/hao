<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>订单处理页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="admin/css/my.css" type="text/css"></link>

<link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico"
	type="image/x-icon">
<script type="text/javascript" src="admin/js/my.js"></script>
<script type="text/javascript" src="js/my.js"></script></head>

<body style="background-color: #FCFDDD;">

	<jsp:include page="Top.jsp"></jsp:include>

	<div id="myord">
		<table style="margin-left: 35%;">
			<tr>
				<td><a href="admin/MyOrder2.jsp">查看所有已下的订单</a>
				</td>
				<td><a href="admin/MyOrder3.jsp">查看所有未下的订单</a>
				</td>
			</tr>
		</table>
	</div>

	

	<div id="myord3"></div>

</body>
</html>
