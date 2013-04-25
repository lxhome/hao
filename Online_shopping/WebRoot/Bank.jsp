<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.hao.model.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网上银行</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
  <link rel="stylesheet" href="css/bank.css" type="text/css"></link>
  <link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico"
	type="image/x-icon">
	</head>
  <body >
  <div >
<div id="bank">
<table cellpadding="3" id="ta">
<tr><td><font color="red" style="font-weight: bold;">商品名称:</font></td>
<td><font color="red" style="font-weight: bold;">华南农业大学购物商城</font></td></tr>
<tr><td><font color="red" style="font-weight: bold;">订单金额:</font></td>
<%
Users user = (Users) request.getSession().getAttribute("admin");
OrdersCl oc = new OrdersCl();
DecimalFormat df= new DecimalFormat("#");
%>
<td><font color="red" style="font-weight: bold;">￥<%=df.format(oc.getPrice(user.getName()))   %></font></td></tr>
<%
request.getSession().setAttribute("price", oc.getPrice(user.getName())+"");
Random r=new Random(); 
%>
<tr>
<td>订单号:</td><td id="oid"><%=Math.abs(r.nextInt()) %></td>
</tr>
<tr><td>订单时间:</td><td><%=sdf.format(new Date()) %></td></tr>
<tr><td>商品名称:</td><td>网上商城支付款</td></tr>
<tr><td>商品数量:</td><td><%=oc.getNum(user.getName()) %></td></tr>
</table>
</div>
<script type="text/javascript" src="js/jquery-1.9.0.js"></script>
<script type="text/javascript">
//var qwe={ "firstName": "Brett", "lastName":"McLaughlin", "email": "aaaa" };


$(document).ready(function(){
	$("#denglu").click(function(){
		var name=document.getElementById("name").value;
		var pwd=document.getElementById("pwd").value;
	//	alert(name +"  "+pwd);
		data: "name=John&location=Boston"
		
		var senddata="name="+name+"&pwd="+pwd;
		//alert(name +"  "+pwd+"---"+senddata);
		 $.ajax({url:"BankServlet",data: senddata+"&flag=denglu",
			 success:function(msg){ 
			     	var msg = JSON.parse(msg);
			     	if(msg.a==1){//登陆成功
			     	//	alert(name +"  "+pwd);
			     		 $("#bank1").load("Bank2.jsp",{"name": name+""});	
			     	}else{//登陆失败
			     		
			     	}
			         }
		 });
	});	
});

</script>
<div id="bank1">
<form action="" method="post"></form>
<table>
<caption><h4>请仔细核对左侧订单信息,再登录</h4></caption>
<tr><td style="text-align:right;"><h4>卡号/账号：</h4></td><td><input type="text" name="name" style="height: 30px;" id="name"></td></tr>
<tr><td style="text-align:right;"><h4>密码：</h4></td><td><input type="password" name="pwd" style="height: 30px;" id="pwd"> </td></tr>
<tr><td ></td>
<td><input type="submit" value="登陆" id="denglu" class="btn btn-primary" style="width:60px">
 <input type="reset" value="重输"name="reset" class="btn btn-warning" style="width:60px;"> </td></tr>
</table>
</form>
</div>


 
 

</div>
</body>
</html>
