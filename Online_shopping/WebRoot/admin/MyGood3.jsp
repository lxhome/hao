<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="admin/css/my.css" type="text/css"></link>

<link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico"
	type="image/x-icon">
<script type="text/javascript" src="admin/js/my.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
</head>
</head>

<body style="background-color: #FCFDDD;">
	<jsp:include page="Top.jsp"></jsp:include>
	<div id="myord2">
		<a href="admin/MyGood.jsp">返回商品管理首页</a>
		<%
		String check=(String )request.getAttribute("check");
		if(check!=null)
			out.println(check);
		%>
		<div style="font-weight: bold;">
			<form action="ManGoodsServlet?flag=addgoods" method="post">
				&nbsp;&nbsp;商品名:<input type="text" style="height: 30px" name="name"><br>
				商品价格:<input type="text" style="height: 30px"name="price"><br>
				商品详情:<textarea rows="3" cols="30px" name="infor"></textarea><br>
				商品数量:<input type="text" style="height: 30px;" name="amount"><br>
				商品类型:<select  style="width: 100px;"  name="type">
				<option value="服装">服装</option>
				<option value="鞋包">鞋包</option>
				<option value="珠宝手表">珠宝手表</option>
				<option value="数码">数码</option>
				<option value="电子产品">电子产品</option>
				<option value="日用百货">日用百货</option>
				<option value="文化玩乐">文化玩乐</option>
				<option value="汽车用品">汽车用品</option>
				<option value="苹果/配件">苹果/配件</option>
				</select>
			<br>
				商品图片:<input type="file"style="height: 30px" name="images" ><br>
				商品小类:<input type="text"style="height: 30px" name="specific"><br>
				<input type="submit" value="录入" name="denglu" class="btn btn-primary" style="width:60px">
				<input type="reset" value="重输" name="reset" class="btn btn-warning" style="width:60px"> 
			</form>
		</div>
	</div>
  </body>
</html>
