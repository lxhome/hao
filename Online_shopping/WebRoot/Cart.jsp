<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物车</title>
    
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
  <link rel="stylesheet" href="css/layout.css" type="text/css"></link></head>
  
  <body>
    <div id="container">
    <jsp:include page="Top.jsp"></jsp:include>
    
    
    
    
    
    <div class="buy">
			<h4><img src="images/mycart.gif" alt="alt" /> <a href="#">全场运费一律mianyunfei</a>
			</h4>
      <table class="buy" cellpadding="0" cellspacing="0">
    	<tbody id="priceTable">
			<tr class="buytitle"><td colspan="6" class="b">确认商品价格与交易条件</td></tr>
      <tr>
        <td class="w364 b">&nbsp;&nbsp;&nbsp;&nbsp;商品名</td>
        <td class="w100 b">原价</td>
        <td class="w100 b">优惠价</td>
        <td class="w100 b">打折</td>
        <td class="w100 b">数量</td>
        <td class="w81 b">删除</td>
      </tr>
      <tr class="h26 blue">
        <td><a href="info.htm" title="攀高搓捶背靠垫按摩器（蓝色 ）（定制）">&nbsp;&nbsp;&nbsp;&nbsp;攀高搓捶背靠垫按摩器（蓝色 ）（定制）</a></td>
        <td><span class="c9">￥258.00</span></td>
        <td><span class="red">￥129.00</span></td>
        <td><span class="black">50折</span></td>
        <td><input onchange="priceCalc()" type="text" value="1" maxlength="4" size="3"/></td>
        <td><a href="JavaScript:void(0)" onclick="remove(this)">删除</a></td>
      </tr>
      <tr class="h26 blue">
        <td><a href="info.htm" title="郝彬美国口语-美国口语成功训练系统（MP3）">&nbsp;&nbsp;&nbsp;&nbsp;郝彬美国口语-美国口语成功训练系统（MP3）</a></td>
        <td><span class="c9">￥480.00</span></td>
        <td><span class="red">￥292.90</span></td>
        <td><span class="black">60折</span></td>
        <td><input onchange="priceCalc()" type="text" value="1"  maxlength="4" size="3"/></td>
        <td><a href="JavaScript:void(0)" onclick="remove(this)">删除</a></td>
      </tr>
      <tr class="h26 blue">
        <td><a href="info.htm" title="简.奥斯汀全集（DVD-9）（赠BBC产品目录...">&nbsp;&nbsp;&nbsp;&nbsp;简.奥斯汀全集（DVD-9）（赠BBC产品目录...</a></td>
        <td><span class="c9">￥138.00</span></td>
        <td><span class="red">￥103.90</span></td>
        <td><span class="black">80折</span></td>
        <td><input onchange="priceCalc()" name="count" type="text" value="1" maxlength="4" size="3"/></td>
        <td><a href="JavaScript:void(0)" onclick="remove(this)">删除</a></td>
      </tr>
      <tr class="h26">
        <td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="catlist.htm">继续挑选商品</a></td>
        <td class="a_c" colspan="2" id="sum" class="pl58">￥527.40</td>
        <td colspan="3">你共节省：￥348.60</td>
      </tr>
    </tbody>
  	</table>
    <form id="buyForm" method="post" action="">
    <table class="buy">    
    <tbody>    
      <tr class="buytitle">
        <td colspan="2" >补充您的邮件地址和联系人基本信息</td>
      </tr>
      <tr>
				<td class="a_r"><label for="username">收件人：</label></td>
        <td><input type="text" name="username" id="username" />
			</tr>
      <tr>
				<td class="a_r"><label for="address">地&nbsp;&nbsp;&nbsp;址： </label></td>
        <td id="selectPlace">
        	<input type="text" name="address" id="address" />
        	<a href="javascript:openWindow()" class="b">请点击填写地址</a>
  			</td>
      </tr>      
      <tr>
				<td class="a_r"><label for="tel">电&nbsp;&nbsp;&nbsp;话：</label></td>
        <td><input class="w30" type="text" name="code"  size="4" id="tel" />-<input class="w81" type="text" name="telnumber" size="8" />-<input class="w30" type="text" name="branchnumber" size="4" /><span class="red b"></span>（区号-电话号码-分机）</td>
      </tr>
      <tr>
        <td class="h65">&nbsp;</td>
        <td><input class="imginput" type="image" src="images/submit.gif" /></td>
      </tr>
      </tbody>
  </table>
  </form>  
    
    
    
    <jsp:include page="Bottom.jsp"></jsp:include>
    </div>
  </body>
</html>
