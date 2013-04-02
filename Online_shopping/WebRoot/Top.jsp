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

<title dir="">My JSP 'Top.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
-->

<link rel="stylesheet" href="css/gobal.css" type="text/css"></link>
<script type="text/javascript" src="js/my_js.js"></script>
<!--<link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
  <link rel="bookmark"  type="image/x-icon"  href="图片地址"/>
<link rel="shortcut icon" href="图片地址"> 
<link rel="icon" href="图片地址">-->
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link></head>
<body>
	<div id="top" class="hao_top">
		<img src="images/1.png" id="top_img"></img>
		<div style="margin-top: 6px;"><span id="hao_time">加载当前时间……</span> </div>
		<ul id="hao_top1">
			<li class=""><a href="#" target="_parent">购物车</a>
			</li>
			<li class=""><a href="#" target="_parent">登录</a>
			</li>
			<li class=""><a href="#" target="_parent">注册</a>
			</li>			
		<!-- <li><script type="text/JavaScript">showTime();</script></li> -->	
		</ul>
		
	</div>
	
	<div class="navbar navbar-inverse">
			<!-- 定背景颜色-->
			<div class="navbar-inner">
				<a class="brand" href="index.jsp">首页</a> <a class="brand" href="#">服装</a>
				<a class="brand" href="#">鞋包</a> <a class="brand" href="#">珠宝手表</a>
				<a class="brand" href="#">数码</a> <a class="brand" href="#">家电</a> <a
					class="brand" href="#">日用百货</a> <a class="brand" href="#">文化玩乐</a>
				<a class="brand" href="#">汽车用品</a><a class="brand" href="#">苹果/配件</a>
				<!-- Everything you want hidden at 940px or less, place within here -->
				<div class="nav-collapse collapse"></div>
			</div>
		</div>

</body>
</html>
