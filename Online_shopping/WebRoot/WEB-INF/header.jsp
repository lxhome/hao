<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>一叶浮云商城</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet"	type="text/css"	href="../css/global.css"	/>
    <link rel="stylesheet"	type="text/css"	href="../css/layout.css"	/>

    <script type="text/JavaScript">
    function showTime(){
		now=new Date;
		document.write((now.getYear()+1900)+"年"+(now.getMonth()+1)+"月"+now.getDate()+"日"+now.getHours()+"点"+now.getMinutes()+"分");	
	}
	</script>
  </head>
  
  <body>
		<div id="header">
			<div id="logo"><h1>logo</h1></div>
			<div class="menu">
				<ul>
					<li class="pic pic1"></li>
					<li class="txt"><a href="buy.htm" target="_parent">购物车</a></li>
					<li class="pic btn txt"><a href="login.htm" target="_parent">登录</a></li>
					<li class="pic btn txt"><a href="register.htm" target="_parent">注册</a></li>
				</ul>
			</div> <!--menu	end-->
			<div class="f_r w62p">
				<ul>
					<li class="txt hello">你好，欢迎访问一叶浮云商城！<script type="text/JavaScript">showTime();</script></li>
				</ul>
			</div> 
  		<div class="nav f_l w100p">
  			<ul>
  				<li><a href="index.htm" target="_parent">&nbsp;首&nbsp;&nbsp;&nbsp;页&nbsp;</a></li>
                <li><a href="catlist.htm" target="_parent">&nbsp;书&nbsp;&nbsp;&nbsp;籍&nbsp;</a> </li>
  				<li><a href="catlist2.htm" target="_parent">电子产品</a></li>
  				<li><a href="catlist3.htm" target="_parent">服饰</a></li>				
  			</ul>
  		</div>	<!--nav	end-->		
		</div> <!--header	end-->	
 </body>
</html>

