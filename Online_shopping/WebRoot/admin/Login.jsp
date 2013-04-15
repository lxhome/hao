<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登陆页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="admin/css/my.css" type="text/css"></link>

<link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico"
	type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link></head>
  
  <body style="background-color: #FCFDDD;">
      <div id="" >
    <jsp:include page="Top.jsp"></jsp:include>

	<div id="myjsp">
			<form action="ManUserServlet?flag=denglu" method="post">
				<table border="0px" id="">			
					<tr>
						<td><strong>会员名:</strong></td>
						<td><input type="text" name="username" style="height: 30px" >
						</td>
					</tr>
					<tr>
						<td><strong>密码:</strong></td>
						<td><input type="password" name="pwd" style="height: 30px" >
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"> <input type="submit" 
							value="登陆" name="denglu" class="btn btn-primary" style="width:60px"> <input type="reset" value="重输"
							name="reset" class="btn btn-warning" style="width:60px"> 
						</td>
					</tr>
					<tr>
						<td class="superlink" colspan="2" align="center">
						</td>
					</tr>
				</table>
			</form>
	
	</div>
	</div>
  </body>
</html>
