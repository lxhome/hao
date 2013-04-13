<%@page import="com.hao.model.GoodsCl"%>
<%@page import="com.hao.model.Goods"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>商品详情</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico"
	type="image/x-icon">
<link rel="stylesheet" href="css/gobal.css" type="text/css"></link>
<link rel="stylesheet" href="css/layout.css" type="text/css"></link>
<link rel="stylesheet" href="css/register.css" type="text/css"></link>
<script type="text/javascript" src="js/register.js"></script>
</head>

<body>
	<div id="container">
		<jsp:include page="Top.jsp"></jsp:include>
		<%
		try{
			String ptr = (String) request.getAttribute("jingao");//检查是否有此类商品
			if (ptr == null || ptr.equals("")) {
				ArrayList al = (ArrayList) request.getAttribute("result");
				Goods gss = new Goods();
				GoodsCl gc = new GoodsCl();
				String type = "";
				//System.out.print(al==null);
				if (al==null||al.size()==0) {
				} 
		else {
		gss = (Goods) al.get(0);
			type = gss.getG_type();
		}

		//System.out.println(type);
		type = gc.change2(type);
		//System.out.println(gss.equals(""));
		//System.out.print(type+"12");
		%><%if(gss.getG_type()==null||gss.getG_type().equals("")) ;
		else{
		%>
		<h3 style="text-align: center;border-bottom:1px gray dotted; "><%=gss.getG_type() %></h3>
		<%} %>
		<div id="gl2">
			<div>
				<div id="gl3">商品图片</div>
				<div id="gl3">商品详情</div>
				<div id="gl3">价格</div>
			</div>
			<div id="gl">
				<%
					if (al != null||al.size()>0) {
						//out.print(al.size());
						for (int i = 0; i < al.size(); i++) {
							Goods gs = (Goods) al.get(i);
				%>
				<div id="gl4">
					<a href="GoodsServlet?flag=showinfo&id=<%=gs.getGoodsId()%>&pageNow=1"><img
						src="img/<%=gs.getG_images()%>"></img> </a>
				</div>
				<div id="gl5">
					<table width="550" border="0">
						<tr>
							<th width="500" height="150" align="left"><font color="red">商品名：</font><%=gs.getG_name()%>
								<br> <%-- <font color="red">商品简介:</font><%= gs.getG_infor()%> --%>
								<br> <font color="red">商品数量：</font><%=gs.getG_amount()%>件</th>
						</tr>
					</table>
				</div>
				<div id="gl5">
					<table width="550" border="0">
						<tr>
							<th width="352" height="143" align="center">一口价:￥<%=gs.getG_price()%>
							</th>
						</tr>
					</table>
				</div>

				<%
					}
					} else
					{
						out.println("<h3>");
						out.println("暂无此类商品");
						out.println("</h3>");
					}
				%>

				<div id="gsl">
					<!-- 选框栏 -->
					<%
					if(al.size()>0){
						int pageNow = Integer.parseInt((String) request
								.getAttribute("pageNow"));//当前所在页
						int pageCount = Integer.parseInt((String) request
								.getAttribute("pageCount"));//总页数
						//System.out.println(pageNow+ "qwe"+pageCount);
						if (pageNow > 1) {
					%>
					<a
						href="GoodsServlet?flag=showlist&pageNow=<%=pageNow - 1%>&type=<%=type%>">上一页</a>
					<%
						}
						for (int i = 1; i <= pageCount; i++) {
					%>
					<a href="GoodsServlet?flag=showlist&pageNow=<%=i%>&type=<%=type%>">[<%=i%>]</a>
					<%
						}
						if (pageNow < pageCount) {
							//System.out.print(pageNow+1);
							int temp = pageNow + 1;
					%>
					<a
						href="GoodsServlet?flag=showlist&pageNow=<%=temp%>&type=<%=type%>">下一页</a>
					<%
						}
					}else {
						out.println("<h3>");
						out.println("暂无此类商品");
						out.println("</h3>");
					}
					%>
				</div>
			</div>
		</div>
		<%}
					
					else if(ptr.equals("暂无此类商品")) {		
			out.println("<h3>");
			out.println(ptr);
			out.println("</h3>");
		}%>
		
		<%
		}catch(Exception ex){
			ex.printStackTrace();
		}
		%>
		
		<jsp:include page="Bottom.jsp"></jsp:include>
	</div>
</body>
</html>
