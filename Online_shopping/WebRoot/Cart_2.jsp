<%@page import="com.hao.model.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	ArrayList al = (ArrayList) request.getAttribute("order");
	Users user = (Users) request.getSession().getAttribute("admin");
	String phone2 = (String) request.getAttribute("phone2");
	String checkNn = (String) request.getAttribute("checkNn");
	String address = (String) request.getAttribute("address");
	String dingdan=(String) request.getAttribute("dingdan");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>订单确认</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico"
	type="image/x-icon">
<link rel="stylesheet" href="css/gobal.css" type="text/css"></link>
<link rel="stylesheet" href="css/layout.css" type="text/css"></link>
<link rel="stylesheet" type="text/css" href="css/register.css">
<script type="text/javascript" src="js/register.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
</head>

<body>
	<div id="container">
		<jsp:include page="Top.jsp"></jsp:include>
		<div id="buy">
			<h4>
				<img src="images/mycart.gif" alt="alt" /> <a href="#">本商场默认为货到付款方式</a>
			</h4>
			<table cellpadding="0" cellspacing="0">
				<tbody>
					<tr id="tr1">
						<td colspan="6">确认商品价格与交易条件</td>
					</tr>
					<tr style="border-bottom: 1px dotted gray;" id="tr5">
						<td>&nbsp;&nbsp;&nbsp;&nbsp;商品名</td>
						<td>价格</td>
						<td>数量</td>
					</tr>
					<%
						if (al.size() > 0) {
							for (int i = 0; i < al.size(); i++) {
								Flash fa = (Flash) al.get(i);
					%>
					<tr>
						<td><%=fa.getName()%></td>
						<td><span>￥<%=fa.getPrice()%></span>
						</td>
						<td><%=fa.getAmount()%></td>
						<td></td>
					</tr>
					<%
						}
						} else {
					%>
					<tr>
						<td>无商品</td>
						<td><span>￥0.00</span>
						</td>
						<td>0件</td>
					</tr>
					<%if(dingdan!=null){ %>
					<tr><font color="red"><h3>您没有订购任何商品或者未选择支付方式,请您选购商品之后再提交</h3></font></tr>
					<%} %>
					<%
						}
						OrdersCl oc = new OrdersCl();
					%>
					<tr>
						<td colspan="2" style="padding-left: 270px;"><h4>
								商品价值总共:<%=oc.getPrice(user.getName())%>元
							</h4></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<%--<a href="#">返回上一步</a>
						--%></td>
					</tr>
				</tbody>
			</table>
			<form method="post" action="CartServlet?flag=tableins">
				<table id="tr3" >
					<tbody>
						<tr id="tr2">
							<td colspan="3">补充您的邮件地址和联系人基本信息</td>
						</tr>
						<tr><td colspan="3" style="padding-left: 20%;">
						<input type="radio" name="mon" value="1">
						<font style="font-weight: bold;" color="red">货到付款</font>
						<input type="radio" name="mon" value="2">
						<font style="font-weight: bold;" color="red">网上支付</font>
						</td>
						</tr>
						<tr>
							<td id="tr4"><label for="username"><h4>收件人姓名：</h4> </label>
							</td>
							<td id="tr6" width="30%"><input type="text" name="username"
								id="username" onfocus="changebg(arguments[0])"
								onblur="delbg(arguments[0])" onchange="checkname()" />
							<td align="left">
							<%if(checkNn!=null){ %>
							<span id="checknull"><font size="3px"color="red"><%=checkNn %></font></span>
							<%}else { %>
							<span id="checknull"></span>
							<%} %>
								<%--<h4 style="color: red"><input type="checkbox">网银支付</h4>--%></td>
						</tr>
						<tr>
							<td id="tr4"><label for="address"><h4>地址：</h4> </label>
							</td>
							<td id="tr6"><input type="text" name="address" id="address"
								onfocus="changebg(arguments[0])" onblur="delbg(arguments[0])"
								onchange="checknull()" /></td>
							<td align="left">
							<%if(address!=null){ %>
							<span id="checknull2"><font size="3px" color="red"><%=address %></font></span>
							<%}else{ %>
							<span id="checknull2"></span>
							 <% }%><%--<h4 style="color: red"><input type="checkbox">货到付款支付</h4>--%>
							</td>
						</tr>
						<tr>
							<td id="tr4"><label for="tel"><h4>手机号码：</h4> </label>
							</td>
							<td id="tr6"><input type="text" name="phone" id="phone"
								size="4" id="tel" onfocus="changebg(arguments[0])"
								onblur="delbg(arguments[0])" onchange="checkPhone()" />
							</td>
							<%
								if (phone2 != null) {
							%>
							<td><span id="phone1"><font size="3px" color="red"><%=phone2%></font>
							</span></td>
							<%
								} else {
							%>
							<td><span id="phone1"></span></td>
							<%
								}
							%>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><input type="submit" value="提交" name="tijiao"
								class="btn btn-primary" style="width:60px">
							</td>
							<td><input type="hidden" id="phone2" name="phone2">
							<input type="hidden" id="checkNn" name="checkNn"> 
							</td>
						</tr>
					</tbody>
				</table>
			</form>


			<div id="cart_foot">
				<jsp:include page="Bottom.jsp"></jsp:include>
			</div>
		</div>
</body>
</html>
