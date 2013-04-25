<%@page import="com.hao.model.Comments"%>
<%@page import="com.hao.model.GoodsCl"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.hao.model.Goods"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Goods gs = (Goods) request.getAttribute("goodsinfo");
	GoodsCl gc=new GoodsCl();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>商品详情</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/layout.css" type="text/css"></link>
<link rel="stylesheet" href="css/gobal.css" type="text/css"></link>
<link rel="stylesheet" href="css/register.css" type="text/css"></link>
<link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico"
	type="image/x-icon">
<script type="text/javascript" src="js/register.js"></script></head>


<body>
	<div id="container">
		<jsp:include page="Top.jsp"></jsp:include>
		<div style="overflow: hidden;">
			<ul>
				<h4 style="border-bottom:1px gray solid; text-align: center;"><%=gs.getG_name()%></h4>
			</ul>
			<ul id="info">
				<li id="info_1"><a id="image1"><img src="img/<%=gs.getG_images()%>">
				</a>
				<a id="image2"><img src="images/f2.jpg">
				</a>
			  <a id="image3"><img src="images/f3.jpg">
				</a>
				<a id="image4"><img src="images/f4.jpg">
				</a>
				</li>
				<li>
				<table border="1px" id="info_2">
				<tr>
				<td><a href="javascript:;" onmouseover="javascript:changeimage(1);"><img src="img/<%=gs.getG_images()%>"></a></td>
				<td><a href="javascript:;" onmouseover="javascript:changeimage(2);"><img src="images/f2.jpg"></a></td>
				<td><a href="javascript:;" onmouseover="javascript:changeimage(3);"><img src="images/f3.jpg"></a></td>
				<td><a href="javascript:;" onmouseover="javascript:changeimage(4);"><img src="images/f4.jpg"></a></td>
				</tr>
				</table>
				</li>
			</ul>
			<ul id="info2">
				<%
					BigDecimal bd = new BigDecimal(gs.getG_price());
					float f1 = bd.setScale(1, BigDecimal.ROUND_HALF_UP).floatValue();
				%>
				<li>一口价：￥<%=f1%></li>
				<li>购物满29元免运费</li>
				<li><a
					href="OrderServlet?flag=orderflash&id=<%=gs.getGoodsId()%>"><img
						src="images/buynow.gif"></img> </a></li>

				<li>数量：<%=gs.getG_amount()%>件 <a href="javascript:;"
					id="goo_pinglun"><font color="red" size="2">(累计评价<%=gc.CountComment(gs.getGoodsId()) %>条)</font>
				</a>
				</li>
				<li><table width="550" border="0">
						<tr>
							<th width="352" height="81" align="left" bgcolor="#FFFFFF"
								scope="col"><%=gs.getG_infor()%></th>
						</tr>
					</table></li>
			</ul>
		</div>
		<%--
		评论区
		--%>
		<div id="goo_pinglun2" style="border-color: gray 1px">
			<h4>顾客评论</h4>
			<%
				ArrayList al=(ArrayList)request.getAttribute("result");
			   Comments cs=new Comments();
			
			//al=(ArrayList)gc.getComment(gs.getGoodsId());
			if(al.size()>0){
				for (int i=0;i<al.size();i++) {
					cs=(Comments)al.get(i);
				%>
			<hr>
			<ul id="info3">
				<li><font color="red" size="1px">会员<%=cs.getName() %>的评论&nbsp;&nbsp;&nbsp;&nbsp;
				<%=cs.getTimestamp() %></font></li>
				<li><table width="890" border="0">
						<tr>
							<th width="352" height="40" align="left" bgcolor="#FFFFFF"
								scope="col"><%=cs.getComm() %></th>
						</tr>
					</table>
				</li>
			</ul>
			
			<%} 				
			}
			%>
			
			<center>
			
			
			<%--<%
					if(al.size()>0){
						int pageNow = Integer.parseInt((String) request
								.getAttribute("pageNow"));//当前所在页
						int pageCount = Integer.parseInt((String) request
								.getAttribute("pageCount"));//总页数
						//System.out.println(pageNow+ "qwe"+pageCount);
						if (pageNow > 1) {
					%>
					<a
						href="GoodsServlet?flag=showinfo&pageNow=<%=pageNow-1%>&id=<%=gs.getGoodsId()%>">上一页</a>
					<%
						}
						for (int i = 1; i <= pageCount; i++) {
					%>
					<a href="GoodsServlet?flag=showinfo&pageNow=<%=i%>&id=<%=gs.getGoodsId()%>">[<%=i%>]</a>
					<%
						}
						if (pageNow < pageCount) {
							//System.out.print(pageNow+1);
							int temp = pageNow + 1;
					%>
					<a
						href="GoodsServlet?flag=showinfo&pageNow=<%=temp%>&id=<%=gs.getGoodsId()%>">下一页</a>
					<%
						}
					}
			%>
			
			--%></center>			
		   <ul id="info3">
				<li><h5>追加评论</h5></li>
				<li><form method="post" action="GoodsServlet?id=<%=gs.getGoodsId()%>&flag=comment">
                          <label>
                            <textarea name='remessage' style="border:2px #ccc inset; background:#eeeeee;width: 600px" rows='2'></textarea>
                            </label>
                            <input type="submit" value="发表评论" style="margin-left: 500px">
                        </form>  
				</li>
			</ul>

		</div>

	</div>
	<%--container end
	--%>
	<div id="container">
		<jsp:include page="Bottom.jsp"></jsp:include>
	</div>


	<script type="text/javascript" src="js/jquery-1.9.0.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			/*alert($("div ul#info2"))*/
			$("#goo_pinglun").click(function() {
				$("#goo_pinglun2").slideToggle("slow");
			});
		});
	</script>
	
	<script type="text/javascript">
	var showad = true; 
	var Toppx = 200; //上端位置 
	var AdDivW = 101; //宽度 
	var AdDivH = 34; //高度 
	var PageWidth = 800; //页面多少宽度象素下正好不出现左右滚动条 
	var MinScreenW = 1024; //显示广告的最小屏幕宽度象素 

	document.write ('<div id="Javascript.RightDiv" style="position: absolute;border: 1px solid #336699;background-color:#EEEEE2;z-index:1000;width:'+AdDivW+'px;height:'+AdDivH+'px;top:-1000px;word-break:break-all;display:none;"><div><a href="Javascript:;"><img src="images/chat.png" /></a></div></div>'); 


	function scall(){ 
	var Borderpx = ((window.screen.width-PageWidth)/2-AdDivW)/2; 
	document.getElementById("Javascript.RightDiv").style.display=""; 
	document.getElementById("Javascript.RightDiv").style.top=document.body.scrollTop+Toppx; 
	document.getElementById("Javascript.RightDiv").style.left=document.body.scrollLeft+document.body.clientWidth-document.getElementById("Javascript.RightDiv").offsetWidth-Borderpx; 
	} 
	window.onscroll=scall; 
	window.onresize=scall; 
	window.onload=scall; 
	</script>
</body>
</html>
