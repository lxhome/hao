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

<title>订单确认</title>

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
				<img src="images/mycart.gif" alt="alt" /> <a href="Cart_2.jsp#buy">本商场默认为货到付款方式</a>
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
					</tr>
					<tr>
						<td>攀高搓捶背靠垫按摩器（蓝色
								
						</td>
						<td><span>￥258.00</span>
						</td>
						<td>1件</td>
						<td>
						</td>
					</tr>
					<tr>
						<td>郝彬美国口语-美国口语成功训练系统（MP3）
						</td>
						<td><span>￥480.00</span>
						</td>	
						<td>1件
						</td>				
					</tr>
					<tr>
						<td>简.奥斯汀全集（DVD-9）（赠BBC产品目录
						</td>
						<td><span>￥138.00</span>
						</td>
						<td>1件	</td>					
					</tr>
					<tr>
						
						<td colspan="2" style="padding-left: 270px;"><h4>商品价值总共:RMB527.40</h4></td>					
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">返回上一步</a>
						</td>
					</tr>
				</tbody>
			</table>
			<form method="post" action="">
				<table id="tr3" >
					<tbody>
						<tr id="tr2">
							<td colspan="3">补充您的邮件地址和联系人基本信息</td>
						</tr>
						<tr>
							<td id="tr4"><label for="username"><h4>收件人：</h4></label>
							</td >
							<td id="tr6" width="30%"><input type="text" name="username" id="username" />
							<td align="left"><h4 style="color: red"><input type="checkbox">网银支付</h4></td>
						</tr>
						<tr>
							<td id="tr4"><label for="address"><h4>地址：</h4> </label>
							</td>
							<td id="tr6"><input type="text" name="address" id="address" /></td>
						    <td align="left"><h4 style="color: red"><input type="checkbox">货到付款支付</h4></td>
						</tr>
						<tr>
							<td id="tr4"><label for="tel"><h4>手机号码：</h4></label>
							</td>
							<td id="tr6"><input type="text" name="code" size="4" id="tel" />
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><input type="image" src="images/submit.gif" />
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
