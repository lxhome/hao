<%@page import="sun.misc.GC,java.math.*"%>
<%@page import="com.hao.model.Goods"%>
<%@page import="com.hao.model.GoodsCl"%>
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

<title>网上商城</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/layout.css" type="text/css"></link>
<link rel="stylesheet" href="css/gobal.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("button").click(function() {
			$("p").hide();
		});
	});
</script>
<link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico"
	type="image/x-icon">
</head>

<body onload="show();showgg(1);showbm(1);showtj();">
	<div id="container">
		<jsp:include page="Top.jsp"></jsp:include><!--  -->

		<div id="hao_ad">
			<div id="hao_ad1">
				<font size="5" style="font-weight: bold;padding-left: 15px;">商城服务</font>
				<hr>
				<ul id="ad12" style="margin: 0px;">
					<li><a href="GoodsServlet?flag=showlist&type=fz&pageNow=1"><h4>服装</h4>
					</a>
					<hr>
					</li>
					<li><a href="GoodsServlet?flag=showlist&type=xb&pageNow=1"><h4>鞋包</h4>
					</a>
					<hr>
					</li>
					<li><a href="GoodsServlet?flag=showlist&type=zb&pageNow=1"><h4>珠宝手表</h4>
					</a>
					<hr>
					</li>
					<li><a href="GoodsServlet?flag=showlist&type=sm&pageNow=1"><h4>数码</h4>
					</a>
					<hr>
					</li>
					<li><a href="GoodsServlet?flag=showlist&type=dz&pageNow=1"><h4>电子产品</h4>
					</a>
					<hr>
					</li>
					<li><a href="GoodsServlet?flag=showlist&type=ry&pageNow=1"><h4>日用百货</h4>
					</a>
					<hr>
					</li>
					<li><a href="GoodsServlet?flag=showlist&type=wh&pageNow=1"><h4>文化玩乐</h4>
					</a>
					<hr>
					</li>
					<li><a href="GoodsServlet?flag=showlist&type=qz&pageNow=1"><h4>汽车用品</h4>
					</a>
					<hr>
					</li>
					<li><a href="GoodsServlet?flag=showlist&type=pg&pageNow=1"><h4>苹果/配件</h4>
					</a>
					<hr>
					</li>
				</ul>

			</div>
			<!-- ad1 end -->


			<div id="hao_ad2">

				<div>
					<img src="images/ad01.jpg" alt="母婴重磅减轻" id="hao_div1" /> <img
						src="images/ad02.jpg" alt="空气净化" id="hao_div2" /> <img
						src="images/ad03.jpg" alt="卡西欧" id="hao_div3" /> <img
						src="images/ad04.jpg" alt="夏季新品" id="hao_div4" />
				</div>
				<div id="hao_adv">
					<a href="JavaScript:show(1);" id="hao_a1">1</a> &nbsp;<a
						href="JavaScript:show(2);" id="hao_a2">2</a>&nbsp;<a
						href="JavaScript:show(3);" id="hao_a3">3</a>&nbsp;<a
						href="JavaScript:show(4);" id="hao_a4">4</a>
				</div>
			</div>
			<!-- as2  end -->

			<div id="hao_ad3">
				<ul id="hao_ad31">
					<li id="hao_gg1"><a href="#"
						onmouseover="JavaScript:showgg(1);">公告</a>
					</li>
					<li id="hao_gg2"><a href="#"
						onmouseover="JavaScript:showgg(2);">规则</a></li>
					<li id="hao_gg3"><a href="#"
						onmouseover="JavaScript:showgg(3);">论坛</a></li>
					<li id="hao_gg4"><a href="#"
						onmouseover="JavaScript:showgg(4);">安全中心</a></li>
					<li id="hao_gg5"><a href="#"
						onmouseover="JavaScript:showgg(5);">公益</a></li>
				</ul>
				<div id="hao_ad321">
					<ul>
						<li><a href="#">整蛊玩具排行榜1</a>
						</li>
						<li><a href="#">整蛊玩具排行榜1</a>
						</li>
						<li><a href="#">整蛊玩具排行榜1</a>
						</li>
						<li><a href="#">整蛊玩具排行榜1</a>
						</li>
						<li><a href="#">整蛊玩具排行榜1</a>
						</li>
						<li><a href="#">整蛊玩具排行榜1</a>
						</li>
						<li><a href="#">整蛊玩具排行榜1</a>
						</li>
						<li><a href="#">整蛊玩具排行榜1</a>
						</li>
						<li><a href="#">整蛊玩具排行榜1</a>
						</li>
						<li><a href="#">整蛊玩具排行榜1</a>
						</li>
					</ul>
				</div>
				<div id="hao_ad322">
					<ul>
						<li><a href="#">整蛊玩具排行榜2</a>
						</li>
						<li><a href="#">整蛊玩具排行榜2</a>
						</li>
						<li><a href="#">整蛊玩具排行榜2</a>
						</li>
						<li><a href="#">整蛊玩具排行榜2</a>
						</li>
						<li><a href="#">整蛊玩具排行榜2</a>
						</li>
						<li><a href="#">整蛊玩具排行榜2</a>
						</li>
						<li><a href="#">整蛊玩具排行榜2</a>
						</li>
						<li><a href="#">整蛊玩具排行榜2</a>
						</li>
						<li><a href="#">整蛊玩具排行榜2</a>
						</li>
						<li><a href="#">整蛊玩具排行榜2</a>
						</li>
					</ul>
				</div>
				<div id="hao_ad323">
					<ul>
						<li><a href="#">整蛊玩具排行榜3</a>
						</li>
						<li><a href="#">整蛊玩具排行榜3</a>
						</li>
						<li><a href="#">整蛊玩具排行榜3</a>
						</li>
						<li><a href="#">整蛊玩具排行榜3</a>
						</li>
						<li><a href="#">整蛊玩具排行榜3</a>
						</li>
						<li><a href="#">整蛊玩具排行榜3</a>
						</li>
						<li><a href="#">整蛊玩具排行榜3</a>
						</li>
						<li><a href="#">整蛊玩具排行榜3</a>
						</li>
						<li><a href="#">整蛊玩具排行榜3</a>
						</li>
						<li><a href="#">整蛊玩具排行榜3</a>
						</li>
					</ul>
				</div>
				<div id="hao_ad324">
					<ul>
						<li><a href="#">整蛊玩具排行榜4</a>
						</li>
						<li><a href="#">整蛊玩具排行榜4</a>
						</li>
						<li><a href="#">整蛊玩具排行榜4</a>
						</li>
						<li><a href="#">整蛊玩具排行榜4</a>
						</li>
						<li><a href="#">整蛊玩具排行榜4</a>
						</li>
						<li><a href="#">整蛊玩具排行榜4</a>
						</li>
						<li><a href="#">整蛊玩具排行榜4</a>
						</li>
						<li><a href="#">整蛊玩具排行榜4</a>
						</li>
						<li><a href="#">整蛊玩具排行榜4</a>
						</li>
						<li><a href="#">整蛊玩具排行榜4</a>
						</li>
					</ul>
				</div>
				<div id="hao_ad325">
					<ul>
						<li><a href="#">整蛊玩具排行榜5</a>
						</li>
						<li><a href="#">整蛊玩具排行榜5</a>
						</li>
						<li><a href="#">整蛊玩具排行榜5</a>
						</li>
						<li><a href="#">整蛊玩具排行榜5</a>
						</li>
						<li><a href="#">整蛊玩具排行榜5</a>
						</li>
						<li><a href="#">整蛊玩具排行榜5</a>
						</li>
						<li><a href="#">整蛊玩具排行榜5</a>
						</li>
						<li><a href="#">整蛊玩具排行榜5</a>
						</li>
						<li><a href="#">整蛊玩具排行榜5</a>
						</li>
						<li><a href="#">整蛊玩具排行榜5</a>
						</li>
					</ul>
				</div>

			</div>
			<!--ad3 end  -->

			<div id="hao_ad4">
				<ul id="hao_ad41">
					<li><font size="4px" color="black" style="font-weight: bold;">便民服务</font>
					</li>
					<li id="hao_gf1"><a href="#"
						onmouseover="JavaScript:showbm(1);">充值</a></li>
					<li id="hao_gf2"><a href="#"
						onmouseover="JavaScript:showbm(2);">彩票</a></li>
					<li id="hao_gf3"><a href="#"
						onmouseover="JavaScript:showbm(3);">游戏</a></li>
					<li id="hao_gf4"><a href="#"
						onmouseover="JavaScript:showbm(4);">礼品卡</a></li>
				</ul>

				<img src="images/ad41.png" id="hao_ad421"></img> <img
					src="images/ad42.png" id="hao_ad422"></img> <img
					src="images/ad43.png" id="hao_ad423"></img> <img
					src="images/ad44.png" id="hao_ad424"></img>
			</div>
			<!--ad4 end  -->

			<div id="hao_ad5">
				<font color="#FF9900"><strong>今日推荐 </strong> </font>
				<div id="hao_ad61">
					</img>
				</div>


				<div id="hao_ad51">
					<a href="JavaScript:showtj(1);">《</a>
				</div>


				<div id="d1"
					style="background-image: url(images/hu1.jpg);display: none;">
				</div>
				<div id="d2"
					style="background-image: url(images/hu2.jpg);display: none;">
				</div>
				<div id="d3"
					style="background-image: url(images/hu3.jpg);display: none;">
				</div>
				<div id="d4"
					style="background-image: url(images/hu4.jpg);display: none;">
				</div>

				<div id="hao_ad53">
					<!-- <a class="btn" onmouseover="showtj(1);" target="_self" href="#"><i
						class="icon-arrow-right"></i>
					</a> -->
					<a href="JavaScript:showtj(2);">》</a>
				</div>

			</div>
			<!--ad5 end  -->
			<%
				GoodsCl gc = new GoodsCl();
				ArrayList<Goods> al = gc.getNewGoods();
			%>


			<div id="hao_ad6">
				<font color="#FF9900"><strong>今日闪价 </strong> </font> <font
					size="2px" color="red">&nbsp;&nbsp;&nbsp;每日更新</font>
				<div id="hao_ad61"></div>
				<%
					for (int i = 0; i < 8; i++) {
				%>
				<div id="sj1">
					<a
						href="GoodsServlet?flag=showinfo&id=<%=al.get(i).getGoodsId()%>"><img
						src="img/<%=al.get(i).getG_images()%>"></img> <span><%=al.get(i).getG_name()%>
				<br> <%
 	    
 		BigDecimal b = new BigDecimal(al.get(i).getG_price());
 		float f1 = b.setScale(1, BigDecimal.ROUND_HALF_UP).floatValue();
                  %> ￥<%=f1%>
					</a> </span>
				</div>

				<%
					}
				%>

			</div>
			<!--ad6 end  -->

			<div id="hao_ad7">
				<a href="javascript:;"> <img src="images/56z700x290_gr_0328.jpg"></img>
				</a>
			</div>
			<!-- ad7 end -->

		</div>
		<!-- container end -->




		<a
			href="http://moco.tmall.com/?ali_trackid=17_2b405ade5de0d6ae816d7b52f59bcbbf"
			target="_blank"> <img alt="春夏新品特惠" src="images/ad1.png"
			style="width:980px;margin-top: 6px;"> </a>
		<jsp:include page="Bottom.jsp"></jsp:include>
	</div>

</body>
</html>