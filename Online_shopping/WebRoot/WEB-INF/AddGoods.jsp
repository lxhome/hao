<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>һҶ�����̳�</title>
    
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
		dsy.add("0",["����","���Ӳ�Ʒ","�鼮"]);
		dsy.add("0_0",["T��","����","����ȹ","ñ��","����","����ȹ","С��װ","�˶�Ь",
					   "����","����","�̿�","��Ь","ƤЬ","Ӿװ","��֯��"]);
		dsy.add("0_1",["����","�ֻ�","����","�����","���ӻ�","�����","ϴ�»�","�ڴ濨",
					  "���","̨��","�����","�����","�ֱ�","�緹��","΢��¯"]);
		dsy.add("0_2",["С˵","��ѧ","����/��Ĭ","����","����","����/ʱ��","����",
					   "����","��ͼ/����","����","����","��ѧ/�ڽ�","ҽѧ","��ʷ","����/����"]);
	//-->
	</script>
	<script language = JavaScript>

	<!--
	
	var s=["s1","s2"];

	var opt0 = ["-����-","-С��-"];

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
    <h1>�����Ʒ</h1>
    <a href="view/AdminIndex.jsp" >��̨��ҳ</a><br/>
    <hr width="500px"/>
    <form action="servlet/GoodsServlet?type=add" method="post" enctype="multipart/form-data">
    <div style="margin-left:425px;background-color: #EEDDFF;width:500px;height:300px;">
    <table style="margin-top: 30px;">
    <tr>
    	<td>��Ʒ���ƣ�</td><td><input type="text" name="goodsName" size="40px"></td>
    </tr>
    <tr>
    	<td>��Ʒ���ͣ�</td><td>
    		<select id="s1" name="goodsType">����</select>&nbsp;
    		<select id="s2" name="specificClass">С��</select>
    	</td>
    </tr>
     <tr>
    	<td>��Ʒ�۸�</td><td><input type="text" name="goodsPrice" size="40px"></td>
    </tr>
    <tr>
    	<td>��Ʒ������</td><td><input type="text" name="goodsAmount" size="15px"></td>
    </tr>
     <tr>
    	<td>��Ʒ���ܣ�</td><td><textarea name="goodsInfo" rows="5" cols="30" ></textarea></td>
    </tr>
     <tr>
    	<td>��ƷͼƬ��</td><td>
    	<input type="File" name="goodsImage" size="40px">
    	</td>
    </tr>
     <tr>
    	<td>&nbsp;</td>
    	<td>
    		<input type="submit" value="�ύ" style="height:25px"/>&nbsp;
    		<input type="reset" value="����"  style="height:25px"/>
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
