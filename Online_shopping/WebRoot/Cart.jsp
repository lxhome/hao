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
				<img src="images/mycart.gif" alt="alt" /> <a href="Cart.jsp#buy">全场运费一律免费</a>
			</h4>
			<table cellpadding="0" cellspacing="0" >
				<tbody>
					<tr id="tr1">
						<td colspan="6" >确认商品价格与交易条件</td>
					</tr>
					<tr style="border-bottom: 1px dotted gray;" id="tr5">
						<td>&nbsp;&nbsp;&nbsp;&nbsp;商品名</td>
						<td>原价</td>
						<td>优惠价</td>
						<td>打折</td>
						<td>数量</td>
						<td>删除</td>
					</tr>
					<tr>
						<td><a href="#" title="攀高搓捶背靠垫按摩器（蓝色 ）（定制）">&nbsp;&nbsp;&nbsp;&nbsp;攀高搓捶背靠垫按摩器（蓝色
								）（定制）</a>
						</td>
						<td><span>￥258.00</span>
						</td>
						<td><span>￥258.00</span>
						</td>
						<td><span>50折</span>
						</td>
						<td><input onchange="priceCalc()" type="text" value="1"
							maxlength="4" size="3" style="width: 70px;height: 30px" />
						</td>
						<td><a href="#" onclick="remove(this)">删除</a>
						</td>
					</tr>
					<tr>
						<td><a href="info.htm" title="郝彬美国口语-美国口语成功训练系统（MP3）">&nbsp;&nbsp;&nbsp;&nbsp;郝彬美国口语-美国口语成功训练系统（MP3）</a>
						</td>
						<td><span>￥480.00</span>
						</td>
						<td><span>￥292.90</span>
						</td>
						<td><span>60折</span>
						</td>
						<td><input onchange="priceCalc()" type="text" value="1"
							maxlength="4" size="3" style="width: 70px;height: 30px" />
						</td>
						<td><a href="JavaScript:void(0)" onclick="remove(this)">删除</a>
						</td>
					</tr>
					<tr>
						<td><a href="#" title="简.奥斯汀全集（DVD-9）（赠BBC产品目录...">&nbsp;&nbsp;&nbsp;&nbsp;简.奥斯汀全集（DVD-9）（赠BBC产品目录...</a>
						</td>
						<td><span>￥138.00</span>
						</td>
						<td><span>￥103.90</span>
						</td>
						<td><span>80折</span>
						</td>
						<td><input onchange="priceCalc()" name="count" type="text"
							value="1" maxlength="4" size="3" style="width: 70px;height: 30px" />
						</td>
						<td><a href="JavaScript:void(0)" onclick="remove(this)">删除</a>
						</td>
					</tr>
					<tr>
						
						<td colspan="2" style="padding-left: 270px;"><h4>商品价值总共:RMB527.40</h4></td>
						<td colspan="3">你共节省：￥348.60</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">继续挑选商品</a>
						</td>
					</tr>
				</tbody>
			</table>
			<a href="#" style="margin-left:80%;"><img src="images/cart.png" title="立即结算"></img></a>


<div id="cart_foot">
			<jsp:include page="Bottom.jsp"></jsp:include>
			</div>
		</div>
</body>
</html>
