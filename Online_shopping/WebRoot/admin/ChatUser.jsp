<%@page import="com.hao.model.Flash"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.hao.man.OrderMan"%>
<%@page import="com.hao.model.Users"%>
<%@page import="com.hao.model.UsersCl"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	UsersCl cl = new UsersCl();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>查看所有已下订单</title>

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
<script type="text/javascript" src="js/jquery-1.9.0.js"></script>
</head>
</head>

<body style="background-color: #FCFDDD;" onload="changeuser()">
	<jsp:include page="Top.jsp"></jsp:include>
	<div id="myord2">
	<a href="admin/MyUser.jsp">返回用户管理首页</a>
		<div>
			<form action="" method="post">
			 选择用户：<select id="findname" name="findname" onchange="changeuser()">
					<%
						ArrayList<Users> al = cl.getUsers();
						if (al.size() > 0) {
							for (int i = 0; i < al.size(); i++) {
					%>
					<option><%=al.get(i).getName()%></option>
					<%
						}
						}
					%>
				</select> 
			</form>
			<script type="text/javascript">
			function changeuser(){
				//alert("12")
				//alert(document.getElementById("findname").value)
				document.getElementById("other").innerHTML=document.getElementById("findname").value;
			}
			</script>
			<div>
			


<form action="" method="post">
    <table border="0" align="center">
    <tr><td >交谈对方为<span id="other">1</span></td></tr>
    <tr><td colspan="2">  
    <div id="mes">
    <textarea id="mess2" rows="" cols="" style="width:400px; height:250px;" name="liuyan" id="liuyan">   
    </textarea>
    </div>
    </td></tr>
    <script type="text/javascript" src="js/jquery-1.9.0.js"></script>
    <script type="text/javascript">   
    $(document).ready(function(){
    	 
    	
    	var sendMes="flag=getMes2";
    	var name=document.getElementById("other").innerHTML;
    	alert(sendMes);
    	$.extend({
    		  show:function(){
    			  name=document.getElementById("other").innerHTML;
    			  $.ajax({url:"ChatServlet",data:sendMes+"&name="+name,
    				  success:function(msg){ 
    					   string="";
    				      	var msg = JSON.parse(msg);	  				      	
    				      	for(var i=0,length=msg.length;i<length;i++){
    				      	if(msg[i].ptr=="1"){
    				      		string=string+"customer:  "+msg[i].content+"\n";  
    				      	}else{ 
    				      		string=string+"root: ";
    				      	string=string+msg[i].content+"\n";  
    				      	}
    				      	}  
    				      	$("#mess2").val(string);
    				          }});
    		  }
    		});
    		setInterval("$.show()",1000);
    		//$.show();
  				  				
    });
 
    </script>
    <tr>
    <td>
    <div>
    <textarea rows="" cols="" style="width:300px; height:100px;" id="liuyan2" name="liuyan2"></textarea>
    </div>
    </td>
      <script type="text/javascript">
      var senddata="";
      //alert("12345");
    $(document).ready(function(){
    	$("#denglu").click(function(){	
    		var name=document.getElementById("other").innerHTML;
    		senddata="comm="+document.getElementById("liuyan2").value+"&flag=chat2&name="+name;
    		//alert(senddata);
    		 $("#liuyan2").val("");
    		$.ajax({url:"ChatServlet",data: senddata,
   			 success:function(msg){ 
   			     	var msg = JSON.parse(msg);		    
   			         }
   		 });
    	});
    });
    </script>
    <td>
    <input type="button"  class="btn btn-warning" id="denglu" style="width:100px;height: 50px;"  value="发送" />
    </td>
    </tr>
    </table>
    </form>


			
			</div>
		</div>

	
	</div>
</body>
</html>
