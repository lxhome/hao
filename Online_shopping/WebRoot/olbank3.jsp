<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


 <img src="images/ICBC.png" style="padding-left: 15%;width: 980px;height: 100px"></img>
 <div id="temp2" style="padding-top: 100px;width: 960;padding-left: 15%;display: none">
 <div class="progress progress-striped active" >
  <div class="bar" id="bar" style="width: 100%;"></div>
</div>
</div>



<div id="temp">
 <form method="post" action="">
<table width="960" border="0" align="center" >
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

var bankflag = 0;

$(document).ready(function(){
$("#deng").click(function(){
	var temp=document.getElementById("temp");
    var temp2=document.getElementById("temp2");
    temp.style.display="none";
    temp2.style.display="block";
    show();	
});
});

function show() {
	var red=document.getElementById("bar");
	if (bankflag == 100) {
		bankflag = 0;
		clearTimeout(theTimer);	
		location.href="BankServlet?flag=online&u="+u+"&m="+m;
	} else {
		bankflag++;
		red.style.width = bankflag + "%";
		theTimer = setTimeout("show()", 100);
	}	
}

</script> 
