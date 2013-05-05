<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.hao.model.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>选择银行</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link></head>
  
  
  <body>
  <div><%--页头
  --%><table width="100%"  border="0" cellpadding="0" cellspacing="0" >
          <tr>
          <td align="center"  bgcolor="#F7FEFF"><h3>
             商城名称：网上商城           
</h3>
            </td>
          </tr>
          <tr>
                 <%
Users user = (Users) request.getSession().getAttribute("admin");
OrdersCl oc = new OrdersCl();
DecimalFormat df= new DecimalFormat("#");

request.getSession().setAttribute("price", oc.getPrice(user.getName())+"");
Random r=new Random(); 
%>
            <td align="center" bgcolor="#F7FEFF"><h3>
            订单号：<%=Math.abs(r.nextInt()) %>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
            应付金额：￥<%=df.format(oc.getPrice(user.getName()))%>元</h3>
            </td>
          </tr>
        </table>
   </div>
        
 <hr>       
<div id="bank1" >        
<table width="960" border="0" align="center" >
  <tr>
    <td width="536" valign="top">
	<form action="" method="post">
	
	<table width="100%" border="0" >    
      <tr>
        <td height="30" colspan="4" bgcolor="#F4F8FF"><span class="STYLE3">请您选择在线支付银行</span> </td>
        </tr>
      <tr>
        <td width="25%" height="25"><INPUT TYPE="radio" NAME="pd_FrpId" id="pd_FrpId" value="1">工商银行</td>
        <td width="25%" height="25"><INPUT TYPE="radio" NAME="pd_FrpId" id="pd_FrpId" value="2">农业银行</td>
        <td width="24%" height="25"><INPUT TYPE="radio" NAME="pd_FrpId" id="pd_FrpId" value="3">建设银行</td>
        <td width="26%" height="25"><INPUT TYPE="radio" NAME="pd_FrpId" id="pd_FrpId" value="4">中国银行</td>
      </tr>
      <tr>
        <td height="25"><INPUT TYPE="radio" NAME="pd_FrpId" id="pd_FrpId" value="1">中国民生银行</td>
        <td height="25"><INPUT TYPE="radio" NAME="pd_FrpId" id="pd_FrpId" value="2" >招商银行 </td>
        <td height="25"><INPUT TYPE="radio" NAME="pd_FrpId" id="pd_FrpId" value="3">交通银行</td>
        <td height="25"><INPUT TYPE="radio" NAME="pd_FrpId" id="pd_FrpId" value="4">深圳发展银行</td>
      </tr>
      <tr>
        <td height="25"><INPUT TYPE="radio" NAME="pd_FrpId" id="pd_FrpId" value="1">北京银行</td>
        <td height="25"><INPUT TYPE="radio" NAME="pd_FrpId" id="pd_FrpId" value="2">兴业银行 </td>
        <td height="25"><INPUT TYPE="radio" NAME="pd_FrpId" id="pd_FrpId" value="3">浦东发展银行 </td>
        <td height="25"><INPUT TYPE="radio" NAME="pd_FrpId" id="pd_FrpId" value="4">中信银行</td>
      </tr>
      <tr>
        <td colspan="4">&nbsp;</td>
        </tr>
      <tr>
        <td colspan="4" align="center"><input type="buttion" class="btn btn-warning" id="denglu" style="width:100px"  value=" 下一步 " /></td>
        </tr>
    </table>
	</form>	
	<script type="text/javascript" src="js/jquery-1.9.0.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#denglu").click(function(){
		var pd_FrpId=0;
		var v=document.getElementsByName("pd_FrpId");
		for(var i = 0;i<v.length;i++){	
		if (v[i].checked){
			//alert(v.lenth);
			pd_FrpId=v[i].value;
		}
		}
		if(pd_FrpId!=0){
	$("#bank1").load("olbank2.jsp",{"bankname": pd_FrpId+""});
		}
	});	
});

</script>
	</td>
    <td colspan="2" valign="top"><div class="divts"><table width="400" border="0" align="center" cellpadding="5" cellspacing="0">
      <tr>
        <td bgcolor="#F4F8FF"><span class="STYLE5"> 温馨提示</span></td>
      </tr>
      <tr>
        <td><ul>
        <li> 建行客户需到柜面签约网上银行才能支付</li>
		<li>请关闭弹出窗口拦截功能</li>
		<li>最好使用最新版浏览器</li>
		<li>支付出错时勿按浏览器“后退”键</li>
		</ul></td>
      </tr>
    </table>
    </div>
	
	<div id="blankmessage"></div>	</td>
  </tr>
 
</table>

</div>
  </body>

</html>
