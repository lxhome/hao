<%@page import="com.hao.model.Goods"%>
<%@page import="com.hao.man.OrderManCl"%>
<%@page import="com.hao.manservlet.ManGoodsServlet"%>
<%@page import="com.hao.model.Flash"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.hao.man.OrderMan"%>
<%@page import="com.hao.model.Users"%>
<%@page import="com.hao.model.UsersCl"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	UsersCl cl = new UsersCl();
	OrderManCl omc = new OrderManCl();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>商品管理</title>

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
<link rel="stylesheet" href="admin/css/bootstrap.css" type="text/css"></link>
</head>
</head>

<body style="background-color: #FCFDDD;">
	<jsp:include page="Top.jsp"></jsp:include>
	<div id="myord2">
		<a href="admin/MyGood.jsp">返回商品管理首页</a>
		<div>
			<form action="ManGoodsServlet?flag=findgoods" method="post">
				输入商品类型:<input type="text" name="findname"> 选择商品类型：<select
					name="findname2">
					<option>所有商品</option>
					<%
						ArrayList<String> al = omc.getType();
						if (al.size() > 0) {
							for (int i = 0; i < al.size(); i++) {
					%>
					<option><%=(String) al.get(i)%></option>
					<%
						}

						}
					%>
				</select> <input type="submit" value="搜索">
			</form>
		</div>

		<div>
			<%
				ArrayList<Goods> aList = new ArrayList<Goods>();
				aList = (ArrayList) request.getAttribute("Mes");

				if (aList != null) {
					if (aList.size() > 0) {
			%>
			<table id="myta" border="1px solid gray" cellpadding=0 cellspacing=0">

				<tr>
					<td>商品标签</td>
					<td>商品名</td>
					<td>商品价格</td>
					<td>商品数量</td>
					<td>商品类型</td>
					<td>商品小类</td>
					<td>加入时间</td>
					<td>操作</td>
				</tr>
				<%
					for (int i = 0; i < aList.size(); i++) {
				%>

				<tr>
					<td><%=aList.get(i).getGoodsId()%></td>
					<td><%=aList.get(i).getG_name()%></td>
					<td><%=aList.get(i).getG_price()%></td>
					<td><%=aList.get(i).getG_amount()%></td>
					<td><%=aList.get(i).getG_type()%></td>
					<td><%=aList.get(i).getSpecificClass()%></td>
					<td><%=aList.get(i).getTimestamp()%></td>
					<td><a href="ManGoodsServlet?flag=delete&id=<%=aList.get(i).getGoodsId() %>">
					<input type="button" value="删除"></a></td>
				</tr>
				<%
					}
				%>
			</table>
			<%
				}
				} else
					out.println("搜索没有任何结果");
			%>
		</div>
	</div>
</body>
</html>
