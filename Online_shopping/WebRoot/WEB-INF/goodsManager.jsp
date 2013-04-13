<%@page import="com.hao.model.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String result = (String)request.getParameter("result");
String typeList[] = ["服饰","鞋包","珠宝手表","数码","电子产品","日用百货"，"文化玩乐","汽车用品","苹果/配件"];
String type="";


String typeStr = (String)request.getParameter("type");
if(typeStr!=null){
	int typeNum = Integer.parseInt(typeStr);
	type = typeList[typeNum];
}



%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsManager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language = JavaScript>
	<!--
	function Dsy()
		{
		this.Items = {};
		}

		Dsy.prototype.add = function(id,iArray)
		{
		this.Items[id] = iArray;
		}	

		Dsy.prototype.Exists = function(id)
		{
		if(typeof(this.Items[id]) == "undefined") return false;
		return true;
		}
		
		function change(v){
		var str="0";
		for(i=0;i<v;i++){ str+=("_"+(document.getElementById(s[i]).selectedIndex-1));};
		var ss=document.getElementById(s[v]);
		with(ss){
		  length = 0;
		  options[0]=new Option(opt0[v]);
		  if(v && document.getElementById(s[v-1]).selectedIndex>0 || !v)
		  {
		   if(dsy.Exists(str)){
		    ar = dsy.Items[str];
		    for(i=0;i<ar.length;i++)options[length]=new Option(ar[i]);
		    if(v)options[1].selected = true;
		   }
		  }
		  if(++v<s.length){change(v);}
		}
		}

		
	
	var dsy = new Dsy();
		dsy.add("0",["服饰","鞋包","珠宝手表","数码","电子产品","日用百货","文化玩乐","汽车用品","苹果/配件"]);
	</script>
	<script language = JavaScript>

	
	var typeList = ["服饰","鞋包","珠宝手表","数码","电子产品","日用百货","文化玩乐","汽车用品","苹果/配件"];
	
	
	var s=["s1"];
	var opt0 = ["-种类-"];
	function setup()
	{
	for(i=0;i<s.length-1;i++)
  	document.getElementById(s[i]).onchange=new Function("change("+(i+1)+")");
	change(0);
	var result = <%=result %>;
	if(result!=undefined){
		if(result == "addok") alert("添加成功！");
		if(result == "addno") alert("")
	}
	}
	
	
	function search()
	{
		//alert("search");
		var type = document.getElementById("s1").value;
	
		if(type == "-大类-"){alert("请选择大类！");return false;}
		//if(type!=undefined&&specific==undefined) specific="全部";
		var typeNum = getIndex(typeList,type);
		//alert("typeNum="+typeNum+" specificNum="+specificNum);
		
		window.location.href="admin/goodsManager.jsp?type="+typeNum;
	}
	
	function getIndex(list,type){
		var num;
		for(var i=0;i<list.length;i++){
			if(list[i] == type){
				num = i;
				break;
			}
		}
		return num;
	}

	

	</script>
	
  </head>
  
  <body onload="setup();" style="text-align:center;height:auto;min-height:100%">
  <div style="pading-bottom:150px;">
   <jsp:include page="../Top.jsp"></jsp:include>
   <h2>商品管理</h2>
   <a href="admin/AdminIndex.jsp" >后台首页</a><br/>
   <hr>
   
   <%
   	GoodsCl gc=new GoodsCl();
   	ArrayList<Goods> goodsList=gc.get_TypeGoods(type);
    %>
    <div style="margin-left:400px;background-color: lightblue;width:600px;padding-top:15px;padding-bottom:10px;">
    <select id="s1" style="text-align:center;width:100px;" name="goodsType">大类</select>&nbsp;
    <button onclick="search()" style="width:80px;">查找</button>
    <br>
 	</div>
 	<hr width=600px;>
 	
 	<%
 		if(!type.equals("")&&type!=null&&!type.equals("-种类-")){
 				
 	
 	%>
 	
   <table border=1 style="margin-left:150px;background-color:silver;width:80%;text-align:center;">
   <tr>
   	<td width=10%>id</td>
   	<td width=10%>名称</td>
   	<td width=8%>价格</td>
   	<td width=22%>介绍</td>
   	<td width=8%>数量</td>
   	<td width=12%>添加日期</td>
   	<td width=12%>图片</td>
  
   	<td>选项</td></tr>
   
   <%
   for(Goods goods:goodsList){
    %>
    
    <tr>
	    <td><%=goods.getGoodsId() %></td>
	    <td><%=goods.getG_name() %></td>
	    <td><%=goods.getG_price() %></td>
	    <td><%=goods.getG_amount() %></td>
	    <td><%=goods.getTimestamp() %></td>
	    <td><%=goods.getG_images() %></td>
	    <td><%=goods.getG_infor() %></td>
	    <td>
	    	<button  onclick="javascript:window.location.href='GoodsServlet?type=delete&id=<%=goods.getGoodsId()%>'">删除</button>&nbsp;
	    	<button onclick="javascript:window.location.href='admin/UpdateGoods.jsp?id=<%=goods.getGoodsId()%>'">修改</button>
	    </td>
    </tr>
   <% 
   }
   
   %>
   </table>
   
   <% 
		}
	}   
   %>
   
  </body>
</html>
