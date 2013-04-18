<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
  <style type="text/css">
  #bank3{

  background-color: red; 
} 
  </style>



<%
String u="";
String m="";
String name=(String)request.getParameter("name");
String flag=(String)request.getParameter("flag");
%>
   <script type="text/javascript" language="javascript"> 
   var u="";
   var m="";
   var name=<%=name%>;
   //var flag=(String)request.getParameter("flag");
   //alert(name+"--"+flag);
   var str="name="+name+"&flag=getMes";
$(document).ready(function(){    
    $.ajax({url:"BankServlet",data: str+"",
success:function(msg){ 
    	var msg = JSON.parse(msg);
    	$("#u").html(msg.u);
    	$("#m").html(msg.m);
    	$("#t").html(msg.t);
    	u=msg.u;
    	m=msg.m;
        }}); 
});  

$(document).ready(function(){
$("#deng").click(function(){
	location.href="BankServlet?flag=online&u="+u+"&m="+m;
});
});
</script> 

<div id="bank2" style="padding-top: 100px;">
 <div class="progress progress-striped active" >
  <div class="bar" id="bar" style="width: 12%;"></div>
</div>
</div>



   <div id="temp">
   <form method="post" action="">
<table  width="500px">
<caption><h4>您的银行账户信息</h4></caption>
<tr><td style="text-align:center;"><h4>账号</h4></td><td name="u" id="u"></td></tr>
<tr><td style="text-align:center;"><h4>当前余额</h4></td><td name="m" id="m"></td></tr>
<tr><td style="text-align:center;"><h4>开户时间</h4></td><td name="t" id="t"></td></tr>
<tr><td>
</td>
<td><input type="button" value="立即支付" id="deng" name="denglu" class="btn btn-success" style="width:80px"></td></tr>
</table>
</form>
</div>
