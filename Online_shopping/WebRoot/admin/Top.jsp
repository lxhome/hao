<%@page import="com.hao.model.Users"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Users user=(Users)request.getSession().getAttribute("manadmin");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'Top.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" href="admin/css/my.css" type="text/css"></link>
</head>

<body>
	<div id="top">
		<h1>后台管理</h1>
		<ul id="li1">
			<%
				if (user!=null) {
					String man=(String)request.getSession().getAttribute("man");
					if (man.equals("0")) {
			%>
			<li>欢迎您！订单管理员<%=user.getName()%></li>
			<li><a href="ManUserServlet?flag=zhuxiao">注销</a>
			</li>
			<%
				}else if(man.equals("2")){
					%>
					<li>欢迎您！商品管理员<%=user.getName()%></li>
					<li><a href="ManUserServlet?flag=zhuxiao">注销</a>
					</li>
					<%	
				}else if(man.equals("3")){
					%>
					<li>欢迎您！用户管理员<%=user.getName()%></li>
					<li><a href="ManUserServlet?flag=zhuxiao">注销</a>
					</li>
					<%	
				}
				}
			%>
		</ul>
	</div>
</body>
</html>
