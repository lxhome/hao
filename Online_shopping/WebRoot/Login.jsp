<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会员登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
  <link rel="stylesheet" href="css/gobal.css" type="text/css"></link>
  <link rel="stylesheet" href="css/layout.css" type="text/css"></link>
  <link rel="stylesheet" href="css/register.css" type="text/css"></link>
 <script type="text/javascript" src="js/register.js"></script>
 <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link></head>
  
    <body>
    <div id="container" >
    <jsp:include page="Top.jsp"></jsp:include>

	<div id="login1">
	
			<form action="UserServlet?flag=denglu" method="post">
				<table border="0px" id="login_1">			
					<tr>
						<td><strong>会员名:</strong></td>
						<td><input type="text" name="username" style="height: 30px" onfocus="changebg(arguments[0])" onblur="delbg(arguments[0])">
						</td>
					</tr>
					<tr>
						<td><strong>密码:</strong></td>
						<td><input type="password" name="pwd" style="height: 30px" onfocus="changebg(arguments[0])" onblur="delbg(arguments[0])">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"> <input type="submit" 
							value="登陆" name="denglu" class="btn btn-primary" style="width:60px"> <input type="reset" value="重输"
							name="reset" class="btn btn-warning" style="width:60px"> 
						<!--<input type="image"  src="images/jiemian.jpg" width="60" height="25">
						<input type="image"  src="images/jiemian.jpg" width="60" height="25">-->
						</td>
					</tr>
					<tr>
						<td class="superlink" colspan="2" align="center">
						<a href="Register.jsp">还没注册？马上注册</a>
						</td>
					</tr>
				</table>
			</form>
	
	</div>
	<jsp:include page="Bottom.jsp"></jsp:include>
	</div>
</body>
</html>

