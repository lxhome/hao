<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册会员</title>
    
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

  <link rel="stylesheet" href="css/register.css" type="text/css"></link>
  <script type="text/javascript" src="js/register.js"></script>
  <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
  <script type="text/javascript" src="js/bootstrap.js"></script>
  <script type="text/javascript" src="js/jquery-1.9.0.js"></script></head>
  
  <body onload="createCode();">
  <div id="container">
  <jsp:include page="Top.jsp"></jsp:include>
  <form action="#" method="post">
    <table width="100%" border="1" id="tb">
  <tr>
    <td width="15%"><p><strong>会员名：</strong></p></td>
    <td width="15%" ><input type="text"  id="username" style="height: 30px"></td>
    <td width="30%">账号由英文字母、数字(0-9)组成</td>
    <td rowspan="6">&nbsp;</td>
  </tr>
  <tr>
    <td><p><strong>输入密码:</strong></p></td>
    <td><input type="password" id="pwd" style="height: 30px"></td>
    <td>由字母数字组成，长度为4～16。密码不能与账号名相同。</td>
  </tr>
  <tr>
    <td><p><strong>再次输入密码：</strong></p></td>
    <td><input type="password" id="pwd1" style="height: 30px"></td>
    <td>&nbsp;</td>
    
  </tr>
  <tr>
    <td><p><strong>邮箱：</strong></p></td>
    <td><input type="text"id="email" style="height: 30px"></td>
    <td><span>123</span></td>
    
  </tr>
  <tr>
    <td><p><strong>性别：</strong></p></td>
    <td><input type="text" id="sex" style="height: 30px;width:50px;"><span>123</span></td>
    <td>&nbsp;</td>
  
  </tr>
  <tr>
    <td><p><strong>验证码：</strong></p></td>
    <td ><input type="text" id="pwd2" style="height: 30px;width:70px;">
    <input type="button" id="checkCode" style="width:60px" onClick="createCode()" />
    </td>
    <td id="bu1">
    <a onClick="createCode()">看不清楚,换一张</a>
    </td>
    
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" value="注册" style="height:30px;width:70px;" id="su1">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" value="清空" style="height:30px;width:70px;" id="su1"></td>
    <td></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
 </form>
 








<div id="myCarousel" class="carousel slide">
            <div class="carousel-inner">
              <div class="item active">
                <img src="images/f1.jpg" alt="">
                <div class="carousel-caption">
                  <h4>即使杀鸡，天，还是会亮的</h4>
                  <p>
		     昨天 </p>
                </div>
              </div>
              
              
              <div class="item">
                <img src="images/f2.jpg" alt="">
                <div class="carousel-caption">
                  <h4>如果人民</h4>
                  <p>
		    【胡耀邦语录】①历 </p>
                </div>
              </div>
              
              
              <div class="item">
                 <img src="images/f3.jpg" alt="">
                <div class="carousel-caption">
                  <h4>国家像需</h4>
                  <p>
		    据戈尔巴乔夫基
		  </p>
                </div>
                
                
              </div>
      </div>
            <a class="left carousel-control" href="Register.jsp#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="Register.jsp#myCarousel" data-slide="next">&rsaquo;</a>
          </div>





   <jsp:include page="Bottom.jsp"></jsp:include>
   </div>
  </body>
</html>
