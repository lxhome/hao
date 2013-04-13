<%@ page language="java"
	import="java.util.*,com.hao.model.*"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
    UsersCl uc=new UsersCl();
	ArrayList<Users> al = new ArrayList<Users>();
	al=uc.getUsers();
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

		<h2>用户管理</h2>
		<br> <a href="admin/AdminIndex.jsp">后台首页</a><br />
		<hr width="700px;" />
		<h1>用户列表</h1>
		<table border="1"
			style="margin:0 auto;text-align:center;width:700px;background-color:silver;">
			<tr>
				<td>用户名</td>
				<td>密码</td>
				<td>邮箱</td>
				<td>性别</td>
				<td>权限</td>
			</tr>
			<%
				for (Users user : al) {
			%>
			<tr>
				<td><%=user.getName()%></td>
				<td><%=user.getPassword()%></td>
				<td><%=user.getEmail()%></td>
				<td><%=user.getSex()%></td>
				<td><%=user.getPower()%></td>
			</tr>
			<%
				}
			%>
		</table>
		
</body>
</html>
