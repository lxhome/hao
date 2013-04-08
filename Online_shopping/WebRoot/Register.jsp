<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String fail= (String) request.getAttribute("temp");
	String tt1 = (String) request.getAttribute("tt1");
	String tt2 = (String) request.getAttribute("tt2");
	String tt3 = (String) request.getAttribute("tt3");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>注册会员</title>
<meta charset="UTF-8" />
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
<link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico">
<link rel="stylesheet" href="css/register.css" type="text/css"></link>
<script type="text/javascript" src="js/register.js"></script>
<body onload="createCode()">
	<div id="container">
		<jsp:include page="Top.jsp"></jsp:include>
		<div id="reg1">
			<form action="UserServlet?flag=zhuce" method="post">
				<table width="100%" border="0px " id="tb">
					<tr>
						<td width="15%"><p>
								<strong>会员名：</strong>
							</p>
						</td>
						<td width="15%"><input type="text" name="username"
							id="username" style="height: 30px"
							onfocus="changebg(arguments[0])" onblur="delbg(arguments[0])"
							onchange="checkuse()">
						</td>
						<td width="30%"><span id="ht2">账号由英文字母、数字(0-9)组成</span>
						</td>
						<td rowspan="6">
							<h4>
								<img src="images/read.gif" alt="alt" />阅读本网服务协议
							</h4> <textarea name="textarea" style="width:300px; height:200px;">
   欢迎阅读服务条款协议，本协议阐述之条款和条件适用于您使用网站的各种工具和服务。

  本服务协议具有合同效力。 
  我们的权利和义务
    1.我们有义务在现有技术上维护整个网上交易平台的正常运行，并努力提升和改进技术，使用户网上交易活动的顺利。 
    2.对用户在注册网上交易平台中所遇到的与交易或注册有关的问题及反映的情况，我们会及时作出回复。 
    3.对于在网上交易平台上的不当行为或其它任何我们认为应当终止服务的情况，我们有权随时作出删除相关信息、终止服务提供等处理，而无须征得用户的同意。 
    4.因网上交易平台的特殊性，我们没有义务对所有用户的注册资料、所有的交易行为以及与交易有关的其他事项进行事先审查。 	
				  </textarea></td>
					</tr>
					<tr>
						<td><p>
								<strong>输入密码:</strong>
							</p>
						</td>
						<td><input type="password" id="pwd" name="pwd"
							style="height: 30px" onfocus="changebg(arguments[0])"
							onblur="delbg(arguments[0])" onchange="checkP()">
						</td>
						<td><span id="ht3">字母数字组成，长度为4～16。</span>
						</td>
					</tr>
					<tr>
						<td><p>
								<strong>再次输入密码：</strong>
							</p>
						</td>
						<td><input type="password" id="pwd1" name="pwd1"
							style="height: 30px" onfocus="changebg(arguments[0])"
							onblur="delbg(arguments[0])" onchange="checkPwd()">
						</td>
						<%
						//System.out.println(fail == null);
							if ((fail != null) ) {
						%>
						<td><span id="ht1"><font size="3px" color="red"><%=fail%></font>
						</span>
						</td>
						<%
							} else if (tt1 != null ) {
						%>
						<td><span id="ht1"><font size="3px" color="red"><%=tt1%></font>
						</span>
						</td>
						<%
							} else {
						%>
						<td><span id="ht1"></span>
						</td>
						<%
							}
						%>
					</tr>
					<tr>
						<td><p>
								<strong>邮箱：</strong>
							</p>
						</td>
						<td><input type="text" id="email" name="email"
							style="height: 30px" onfocus="changebg(arguments[0])"
							onblur="delbg(arguments[0])" onchange="checkEmail()">
						</td>
						<%
							if (tt2 != null) {
						%>
						<td><span id="email1"><font size="3px" color="red"><%=tt2%></font>
						</span>
						</td>
						<%
							} else {
						%>
						<td><span id="email1"></span>
						</td>
						<%
							}
						%>
					</tr>
					<tr>
						<td><p>
								<strong>性别：</strong>
							</p>
						</td>
						<td><select id="sex" name="sex">
								<option value="male">男</option>
								<option value="female">女</option>
						</select> <!-- <input type="text" id="sex" name="sex" style="height: 30px;width:50px;"onfocus="changebg(arguments[0])" onblur="delbg(arguments[0])"> -->
						</td>
						<%
							if (tt3 != null ) {
						%>
						<td><span id="ht4"><font size="3px" color="red"><%=tt3%></font>
						</span>
						</td>
						<%
							} else {
						%>
						<td><span id="ht4"></span>
						</td>
						<%
							}
						%>
					</tr>
					<tr>
						<td><p>
								<strong>验证码：</strong>
							</p>
						</td>
						<td><input type="text" id="input1"
							style="height: 30px;width:70px;" onfocus="changebg(arguments[0])"
							onblur="delbg(arguments[0])" onchange="validate()"> <input
							type="button" id="checkCode" style="width:60px"
							onClick="createCode()" /></td>
						<td id="bu1"><a href="Register.jsp#bu1"
							onClick="createCode()">看不清楚,换一张</a></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" value="注册" class="btn btn-primary"
							style="width:60px" id="su1">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="清空"
							class="btn btn-warning" style="width:60px" id="su1">
						</td>
						<td></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="hidden" onclick="" name="tt1" id="tt1">
						</td>
						<td><input type="hidden" onclick="" name="tt2" id="tt2">
						</td>
						<td><input type="hidden" onclick="" name="tt3" id="tt3">
						</td>
					</tr>
				</table>
			</form>


		</div>




		<jsp:include page="Bottom.jsp"></jsp:include>
	</div>
</body>
</html>
