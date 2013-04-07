<%@page import="com.hao.model.Users"%>
<%@page import="com.hao.model.OrdersCl"%>
<%@page import="com.hao.model.GoodsCl"%>
<%@page import="com.hao.model.Flash"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	ArrayList al=(ArrayList)request.getAttribute("flash");
	Users user=(Users)request.getSession().getAttribute("admin");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>购物车</title>

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
</head>

<body>
	<div id="container">
		<jsp:include page="Top.jsp"></jsp:include>

		<div id="buy">
			<h4>
				<img src="images/mycart.gif" alt="alt" /> <a href="#">全场运费一律免费</a>
			</h4>
			<table cellpadding="0" cellspacing="0" >
				<tbody>
					<tr id="tr1">
						<td colspan="6" >确认商品价格与交易条件</td>
					</tr>
					<tr style="border-bottom: 1px dotted gray;" id="tr5">
						<td>&nbsp;&nbsp;&nbsp;&nbsp;商品名</td>
						<td>价格</td>
						<td>数量</td>
						<td>操作</td>
					</tr>
					<%
					try{
					if(al.size()>0){
						//System.out.println(al.size()+"qwe");
						for(int i=0;i<al.size();i++){
							 Flash fa=(Flash)al.get(i);
						%>
					<tr>
						<td><a href="GoodsServlet?flag=showinfo&id=<%=fa.getId() %>"  title="<%=fa.getName()%>">&nbsp;&nbsp;&nbsp;&nbsp;<%=fa.getName()%></a>
						</td>
						<td><span>￥<%=fa.getPrice() %></span>
						</td>
						<td ><select id="cart_sel" name="cart_sel" onchange="changeNum(<%=fa.getId() %>)">
						<%
					
						GoodsCl gc=new GoodsCl();
						int n=gc.getN(fa.getId());
						for(int j=1;j<=n;j++){ 
						if(j==fa.getAmount()){						
						%>
						<option selected="selected" value="<%=j%>"><%=j %></option><%
						}
						else{
							
						%>
						<option value="<%=j%>"><%=j %></option>
						<% 
						}
						}%>
						</select>
						</td>
						<td><a href="CartServlet?flag=del&id=<%= fa.getId()%>">删除</a>
						</td>
					</tr>
					<%}
					}else{
						%>
					<tr>
						<td><a href="#" title="无商品">&nbsp;&nbsp;&nbsp;&nbsp;无商品</a>
						</td>
						<td>				
						<span>0.00</span>
						</td>
						<td><input onchange="priceCalc()" type="text" value="1"
							maxlength="4" size="3" style="width: 70px;height: 30px" />
						</td>
						<td><a >删除</a>
						</td>
					</tr>
					<%}
					}catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
					%>
					<tr>
								<%OrdersCl oc=new OrdersCl(); %>
						<td colspan="2" style="padding-left: 270px;"><h4>商品价值总共:<%=oc.getPrice(user.getName()) %>元</h4></td>
						
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">继续挑选商品</a>
						</td>
					</tr>
				</tbody>
			</table>
			<a href="CartServlet?flag=pay" style="margin-left:80%;"><img src="images/cart.png" title="立即结算"></img></a>


<div id="cart_foot">
			<jsp:include page="Bottom.jsp"></jsp:include>
			</div>
		</div>
</body>
</html>
