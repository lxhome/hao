<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ProductDetails.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <div class="good">
		<h1>ming zi</h1>
		<ul>
			<li >
			<a href="servlet/OrderCartServlet?type=add&id=">
			<img src="images/1.png %>"  alt="" border="0" /></a></li>					
		</ul>
		<ul class="goodinfo f_l">
		<li class="h74 buynow"><a href="servlet/OrderCartServlet?type=add&id=">
		<img src="images/buynow.gif" alt="alt" /></a></li>
        <li></li>
            <li>运&nbsp;&nbsp;&nbsp;&nbsp;费：<span>免运费</span></li>
		     <li>一&nbsp;口&nbsp;价：<span>111元 </span></li>
			<li>商品类型：fushi</li>
	
			<li>商品状态：  123</li>
			
			<li>
			  <table width="550" border="0">
			    <tr>
			      <th width="352" height="81" align="left" bgcolor="#FFFFFF" scope="col">123123</th>
		        </tr>
		      </table>
		  </li>
			<li></li>			
	  </ul>
	</div>
  </body>
</html>
