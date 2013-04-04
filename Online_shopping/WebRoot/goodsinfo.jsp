<%@page import="java.math.BigDecimal"%>
<%@page import="com.hao.model.Goods"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Goods gs=(Goods)request.getAttribute("goodsinfo");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>商品详情</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/layout.css" type="text/css"></link>
<link rel="stylesheet" href="css/gobal.css" type="text/css"></link>
<link rel="stylesheet" href="css/register.css" type="text/css"></link>
</head>
<link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico"
	type="image/x-icon">

<body>
	<div id="container">
		<jsp:include page="Top.jsp"></jsp:include>
		<ul>
			<h4 style="border-bottom:1px gray solid; text-align: center;"><%=gs.getG_name()%></h4>
		</ul>
		<ul id="info">
			<li><img src="img/<%=gs.getG_images()%>">
			</li>
		</ul>
		<ul id="info2">
			<%
				BigDecimal bd=new BigDecimal(gs.getG_price());
				float f1=bd.setScale(1,BigDecimal.ROUND_HALF_UP).floatValue();
			%>
			<li>一口价：￥<%=f1%></li>
			<li>运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费：免运费</li>
			<li><a href="goodsinfo.jsp#info2"><img
					src="images/buynow.gif"></img>
			</a>
			</li>
			<li>数量：<%=gs.getG_amount()%>件</li>
			<li><table width="550" border="0">
					<tr>
						<th width="352" height="81" align="left" bgcolor="#FFFFFF"
							scope="col"><%=gs.getG_infor()%></th>
					</tr>
				</table>
			</li>
		</ul>
	</div>
	<div id="container">
		<jsp:include page="Bottom.jsp"></jsp:include>
	</div>
</body>
</html>
