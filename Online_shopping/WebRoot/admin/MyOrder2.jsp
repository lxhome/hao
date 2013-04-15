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
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>查看所有已下订单</title>

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
	<a href="admin/MyOrder.jsp">返回订单管理首页</a>
		<div>
			<form action="ManUserServlet?flag=find" method="post">
				输入用户名:<input type="text" name="findname"> 选择用户：<select
					name="findname2">
					<option>所有用户</option>
					<%
						ArrayList<Users> al = cl.getUsers();
						if (al.size() > 0) {
							for (int i = 0; i < al.size(); i++) {
					%>
					<option><%=al.get(i).getName()%></option>
					<%
						}

						}
					%>
				</select> <input type="submit" value="搜索">
			</form>
		</div>

		<div>
			<%
			ArrayList<OrderMan> aList = new ArrayList<OrderMan>();
			aList=(ArrayList)request.getAttribute("Mes");
			if(aList!=null){
				if (aList.size() > 0) {
					Timestamp ts = aList.get(0).getTime();
			%>
			<table id="myta" border="1px solid gray" cellpadding=0 cellspacing=0">
				<caption>
					<font color="red">下定时间<%=ts%></font></caption>
				<tr>
					<td>顾客名</td>
					<td colspan="2"><%=aList.get(0).getCus_name()%></td>
				</tr>
				<tr>
					<td>用户名</td>
					<td colspan="2"><%=aList.get(0).getO_name()%></td>
				</tr>
				<tr>
					<td>电话</td>
					<td colspan="2"><%=aList.get(0).getPhone()%></td>
				</tr>
				<tr>
					<td>商品名</td>
					<td>商品数量</td>
					<td>价格</td>
				</tr>
				<%
					for (int i = 0; i < al.size(); i++) {
							Timestamp ts1 = aList.get(i).getTime();
							if (ts.equals(ts1)) {
				%>

				<tr>
					<td><%=aList.get(i).getName()%></td>
					<td><%=aList.get(i).getAmount()%>件</td>
					<td>￥<%=aList.get(i).getPrice()%></td>
				</tr>
				<%
					} else {
				%>
			</table>
			<%
				ts = ts1;
			%>

			<table id="myta" border="1px solid gray" cellpadding=0 cellspacing=0">
				<caption>
					<font color="red">下定时间<%=ts%></font></caption>
				<tr>
					<td>顾客名</td>
					<td colspan="2"><%=aList.get(i).getCus_name()%></td>
				</tr>
				<tr>
					<td>用户名</td>
					<td colspan="2"><%=aList.get(i).getO_name()%></td>
				</tr>
				<tr>
					<td>电话</td>
					<td colspan="2"><%=aList.get(i).getPhone()%></td>
				</tr>

				<tr>
					<td>商品名</td>
					<td>商品数量</td>
					<td>价格</td>
				</tr>
				<tr>
					<td><%=aList.get(i).getName()%></td>
					<td><%=aList.get(i).getAmount()%>件</td>
					<td>￥<%=aList.get(i).getPrice()%></td>
				</tr>
				<%
					}
						
					}
				
				}
				else
					out.print("没有订单记录");
					} 
				%>
			
		</div>
	</div>
</body>
</html>
