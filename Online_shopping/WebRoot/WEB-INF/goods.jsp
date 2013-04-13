<%@ page language="java" import="java.util.*,service.*,dao.*,entity.Goods" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" langua="javascript">
	function buy(type){
		alert("you will buy "+type);
		window.location.href="/shopping/view/cart.jsp?type="+type;
	}
	</script>
  </head>
  
  <body>
  
  <% String type=request.getParameter("type"); %>
   the goods type is <%=type %>
   
   <hr>
   
   <%
   	GoodsService goodsService=new GoodsService();
   	GoodsDAO goodsDao=goodsService.getGoodsDAO();
   	ArrayList<Goods> goodsList=goodsDao.getGoods(type);
    %>
   
   <table border=1 bgcolor=silver>
   <tr><td>id</td><td>名称</td><td>价格</td><td>介绍</td></tr>
   
   <%
   for(Goods goods:goodsList){
    %>
    
    <tr><td><%=goods.getId() %></td><td><%=goods.getName() %></td>
    <td><%=goods.getPrice() %></td><td><%=goods.getInfo() %></td>
    <td><input type="button" value="购买" onclick="buy(<%=goods.getId() %>)"/></td>
    </tr>
   <% 
   }
   
   goodsDao.close();
   %>
   </table>
   
  </body>
</html>
