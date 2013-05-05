<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String bankname=(String )request.getParameter("bankname");
%>

   <table width="960" border="0" align="center" >
   <tr >
   <%
   //System.out.println(bankname);
   if(bankname.equals("1")){ %>
   <img src="images/ICBC.png" style="padding-left: 15%;width: 980px;height: 100px"></img>
   <%}else if(bankname.equals("2")){ %>
    <img src="images/ABC.png" style="padding-left: 15%;width: 980px;height: 100px"></img>
   <%}else if(bankname.equals("3")){ %>
    <img src="images/CCB.png" style="padding-left: 15%;width: 980px;height: 100px"></img>
   <%}else if(bankname.equals("4")){ %>
    <img src="images/BOC.png" style="padding-left: 15%;width: 980px;height: 100px"></img>
   <%} %>
   </tr>
    <tr><td width="536" colspan="2">&nbsp;</td>  
    <td rowspan="8" >
    <h4>
								<img src="images/warming.png" alt="alt" />安全检测
							</h4> <textarea name="textarea" style="width:400px; height:100px;">
1.请您确认该页面地址以https开头，并核对浏览器地址栏是否有挂锁或其它安全标识。
2.选择“网银支付”只需输入支付卡（账）号和验证码，无需输入网银登录密码；选择“工银e支付”只需输入手机号和卡（账）号后六位或账户别名。
3.支付时请不要开启远程协助功能，避免他人操作您的计算机。如有疑问，请咨询95588。			  </textarea>
    </td></tr>
    <tr><td style="text-align:right;"><h4>卡号/账号：</h4></td><td><input type="text" name="name" style="height: 30px;" id="name"></td></tr>
<tr><td style="text-align:right;"><h4>密码：</h4></td><td><input type="password" name="pwd" style="height: 30px;" id="pwd"> </td></tr>
<tr><td ></td>
<td><input type="submit" value="登陆" id="denglu" class="btn btn-primary" style="width:60px">
 <input type="reset" value="重输"name="reset" class="btn btn-warning" style="width:60px;"> </td></tr>
</table>

<script type="text/javascript" src="js/jquery-1.9.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#denglu").click(function(){
		var name=document.getElementById("name").value;
		var pwd=document.getElementById("pwd").value;		
		var senddata="name="+name+"&pwd="+pwd;
		 $.ajax({url:"BankServlet",data: senddata+"&flag=denglu",
			 success:function(msg){ 
			     	var msg = JSON.parse(msg);
			     	if(msg.a==1){//登陆成功
			     		 $("#bank1").load("olbank3.jsp",{"name": name+""});	
			     	}else{//登陆失败		     		
			     	}
			         }
		 });
	});	
});
</script>