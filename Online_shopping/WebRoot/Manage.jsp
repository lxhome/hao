<%@page import="java.sql.Timestamp"%>
<%@page import="com.hao.model.Records"%>
<%@page import="com.hao.model.Users"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Users users = (Users) request.getSession().getAttribute("admin");
	String username = (String) users.getName();
	String str = (String) request.getAttribute("temp");
	String all = (String) request.getAttribute("all");
	ArrayList<Records> al = (ArrayList) request.getAttribute("result");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>个人中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico"
	type="image/x-icon">
<link rel="stylesheet" href="css/gobal.css" type="text/css"></link>
<link rel="stylesheet" href="css/layout.css" type="text/css"></link>

<link rel="stylesheet" href="css/register.css" type="text/css"></link>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
<script type="text/javascript" src="js/register.js"></script>
<body style="background-color: #FCFDDD">
	<div id="container">
		<jsp:include page="Top.jsp"></jsp:include><!--  -->
		<div id="hao_ad">
			<div id="man">
				<ul>
					<li><a href="javascript:update(1)"><h4>个人信息修改</h4> </a></li>
					<li><a href="javascript:update(2)"><h4>订单记录</h4> </a></li>
				</ul>
			</div>
			<%--man结束--%>
			<div id="man2">
				<form action="UserServlet?flag=updateCode" method="post">
					<h4>修改密码</h4>
					<hr>
					<table>
						<tr>
							<th style="text-align: right;"><h4>原密码:</h4></th>
							<th><input type="password" name="pwd" style="height: 30px"
								onfocus="changebg(arguments[0])" onblur="delbg(arguments[0])">
							</th>
						</tr>
						<tr>
							<th style="text-align: right;"><h4>新密码:</h4></th>
							<th><input type="password" name="pwd2" style="height: 30px"
								onfocus="changebg(arguments[0])" onblur="delbg(arguments[0])">
							</th>
						</tr>
						<tr>
							<th><h4>再次输入新密码:</h4></th>
							<th><input type="password" name="pwd3" style="height: 30px"
								onfocus="changebg(arguments[0])" onblur="delbg(arguments[0])">
							</th>
						</tr>
						<tr>
							<th></th>
							<th><input type="submit" value="确认修改" name="denglu"
								class="btn btn-primary" style="width:80px">
							</th>
						</tr>
					</table>

				</form>
			</div>
			<%--man2结束--%>
			<div id="man3">
				<%
					//System.out.println("all="+str);		

					if (all == null || all.equals("")) {
						//System.out.println(str+"ser====");
						if (str != null) {
				%>
				<h3><%=str%></h3>
				<%
					}
				%>
				<h3>
					&nbsp;&nbsp;&nbsp;&nbsp;<%=username%>！&nbsp;欢迎您使用该用户中心！
				</h3>
				<%
					} else if (all.equals("jilu")) {
						if (al.size() <= 0)
							out.print("您还没有订货记录");
						else {
							Timestamp ts = al.get(0).getTime();
							Timestamp ts1;
				%>
				<table border="1px solid gray" style="width:650px;">
					<caption>
						时间为<%=ts%>的订单
					</caption>
					<tr>
						<th>商品名</th>
						<th>数量</th>
						<th>单价</th>
					</tr>

					<%
						for (int i = 0; i < al.size(); i++) {
									Records rs = (Records) al.get(i);
									ts1 = rs.getTime();
									//System.out.println(ts.equals(ts1));
									if (ts.equals(ts1)) {
					%>
					<tr>
						<th><%=rs.getO_name()%></th>
						<th><%=rs.getAmount()%></th>
						<th><%=rs.getPrice()%></th>
					</tr>
					<%
						} else {
					%>
				</table>
				<br>
				<%
					ts = ts1;
				%>
				<table border="1px solid gray" style="width:650px;">
					<caption>
						时间为<%=ts1%>的订单
					</caption>
					<tr>
						<th>商品名</th>
						<th>数量</th>
						<th>单价</th>
					</tr>
					<tr>
						<th><%=rs.getO_name()%></th>
						<th><%=rs.getAmount()%></th>
						<th><%=rs.getPrice()%></th>
					</tr>
					<%
						}
								}
							}
						}
					%>
					</div>
					<%--man3结束--%>
					</div>
					<%--hao_ad--%>
					</div>
					<%--container--%>
</body>
</html>
