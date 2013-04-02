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

<title>My JSP 'Bottom.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" href="css/gobal.css" type="text/css"></link>
<link rel="stylesheet" href="css/layout.css" type="text/css"></link>
</head>

<body>

	<div id="footer">
		<div id="top" > 
			友情链接：&nbsp;&nbsp;<a href="http://www.baidu.com" target="_blank">百度</a>
			| <a href="http://www.google.com.hk/" target="_blank"  >Google</a> | <a
				href="http://www.sina.com.cn/" target="_blank">新浪</a> | <a
				href="http://www.amazon.cn" target="_blank">卓越</a> | <a
				href="http://www.taobao.com/" target="_blank">淘宝</a> | <a
				href="http://www.dangdang.com/" target="_blank">当当</a>| <a
				href="http://www.ifeng.com/" target="_blank">凤凰</a>| <a
				href="http://www.csdn.net/" target="_blank">CDSN</a>| <a
				href="http://www.51job.com/" target="_blank">前程无忧</a>| <a
				href="http://www.scau.edu.cn/" target="_blank">华南农业大学</a><br />
			<div id="hao_hr"><hr />	</div>
					
		</div>
	
		服务热线：07534271690 &nbsp;&nbsp;Email:184826998@qq.com<br /> 
		<a href="#">广东华南农业大学</a>版权所有<br /> 
		COPYRIGHT &copy;1991-2013 ,scau,All Rights Reserved<br />   
	</div>

</body>
</html>
