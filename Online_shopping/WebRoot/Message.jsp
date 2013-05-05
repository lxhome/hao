<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>留言板</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
  </head>
  
  <body>
    <script type="text/javascript">
    window.returnValue="您已经退出聊天窗口";
    </script>
    <form action="ChatServlet?flag=liuyan" method="post">
    <table border="0">
    <tr><td colspan="2">  
    <div id="mes">
    <textarea id="mess2" rows="" cols="" style="width:400px; height:250px;" name="liuyan" id="liuyan">   
    </textarea>
    </div>
    </td></tr>
    <script type="text/javascript" src="js/jquery-1.9.0.js"></script>
    <script type="text/javascript">   
    $(document).ready(function(){
    	//$("#mess2").val("122\n"+"ada");
    	//$("#mess2").val("12222\n"+"ada");
    	senddata2="flag=getMes";
    	$.extend({
    		  show:function(){   			  
    			  $.ajax({url:"ChatServlet",data:senddata2+"",
    				  success:function(msg){ 
    					 //alert(msg);
    					// $("#mess2").val(msg);
    					   string="";
    					  //$("#mess2").val("122\n"+"ada");
    				      	var msg = JSON.parse(msg);	
    				      	
    				      	for(var i=0,length=msg.length;i<length;i++){
    				      		//string2=msg[i].content;
    				      		//alert(typeof msg[i].ptr);
    				      	if(msg[i].ptr=="1"){
    				      		string=string+"me:  "+msg[i].content+"\n";  
    				      		//alert(string);
    				      	}else{ 
    				      		string=string+"root: ";
    				      	string=string+msg[i].content+"\n";  
    				      	}
    				      	}  
    				      //	alert(string);
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
    		senddata="comm="+document.getElementById("liuyan2").value+"&flag=chat";
    		//alert(senddata);
    		 $("#liuyan2").val("");
    		$.ajax({url:"ChatServlet",data: senddata,
   			 success:function(msg){ 
   			     			    
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
  </body>
</html>
