<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>一叶浮云商城</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet"	type="text/css"	href="../css/global.css"/>
    <link rel="stylesheet"	type="text/css"	href="../css/layout.css"/>
	<script language="javasript" src="addGoods.js"></script>
	
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
		  options[0]=new Option(opt0[v],opt0[v]);
		  if(v && document.getElementById(s[v-1]).selectedIndex>0 || !v)
		  {
		   if(dsy.Exists(str)){
		    ar = dsy.Items[str];
		    for(i=0;i<ar.length;i++)options[length]=new Option(ar[i],ar[i]);
		    if(v)options[1].selected = true;
		   }
		  }
		  if(++v<s.length){change(v);}
		}
		}

		
	
	var dsy = new Dsy();
		dsy.add("0",["服饰","电子产品","书籍"]);
		dsy.add("0_0",["T恤","袜子","半身裙","帽子","衬衫","连衣裙","小西装","运动鞋",
					   "外套","长裤","短裤","凉鞋","皮鞋","泳装","针织衫"]);
		dsy.add("0_1",["电脑","手机","音响","摄像机","电视机","电冰箱","洗衣机","内存卡",
					  "电池","台灯","电风扇","充电器","手表","电饭煲","微波炉"]);
		dsy.add("0_2",["小说","文学","动漫/幽默","艺术","旅游","娱乐/时尚","体育",
					   "生活","地图/地理","管理","法律","哲学/宗教","医学","历史","政治/军事"]);
	//-->
	</script>
	<script language = JavaScript>

	<!--
	
	var s=["s1","s2"];

	var opt0 = ["-大类-","-小类-"];

	function setup()

	{

	for(i=0;i<s.length-1;i++)

  	document.getElementById(s[i]).onchange=new Function("change("+(i+1)+")");

	change(0);

	}

	//-->

	</script>

	
  </head>
  
 <body onload="setup()" style="text-align:center;height:auto;min-height:100%">
  <div style="pading-bottom:150px;">
  <div width=800px;>
   <jsp:include page="../header.jsp"></jsp:include>
    </div>
    <h1>添加商品</h1>
    <a href="view/AdminIndex.jsp" >后台首页</a><br/>
    <hr width="500px"/>
    <form action="servlet/GoodsServlet?type=add" method="post" enctype="multipart/form-data">
    <div style="margin-left:425px;background-color: #EEDDFF;width:500px;height:300px;">
    <table style="margin-top: 30px;">
    <tr>
    	<td>商品名称：</td><td><input type="text" name="goodsName" size="40px"></td>
    </tr>
    <tr>
    	<td>商品类型：</td><td>
    		<select id="s1" name="goodsType">大类</select>&nbsp;
    		<select id="s2" name="specificClass">小类</select>
    	</td>
    </tr>
     <tr>
    	<td>商品价格：</td><td><input type="text" name="goodsPrice" size="40px"></td>
    </tr>
    <tr>
    	<td>商品数量：</td><td><input type="text" name="goodsAmount" size="15px"></td>
    </tr>
     <tr>
    	<td>商品介绍：</td><td><textarea name="goodsInfo" rows="5" cols="30" ></textarea></td>
    </tr>
     <tr>
    	<td>商品图片：</td><td>
    	<input type="File" name="goodsImage" size="40px">
    	</td>
    </tr>
     <tr>
    	<td>&nbsp;</td>
    	<td>
    		<input type="submit" value="提交" style="height:25px"/>&nbsp;
    		<input type="reset" value="重置"  style="height:25px"/>
    	</td>
    </table>
    </div>
    </form>
    </div>
     <div style="margin-top:110px;height:150px;position:relative;clear:both;">
   <jsp:include page="../footer.jsp"></jsp:include>
  	</div>
  </body>
</html>
