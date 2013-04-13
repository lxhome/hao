<%@ page language="java" import="java.util.*,service.GoodsService,entity.Goods" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String idStr = (String)request.getParameter("id");
GoodsService service = new GoodsService();
Goods goods = new Goods();

if(idStr!=null){
int id = Integer.parseInt(idStr);
goods = service.getGoodsDAO().getGoodsById(id);
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>�����̳�</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/layout.css" type="text/css"></link>
<link rel="stylesheet" href="css/gobal.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-1.9.0.js"></script>

	<link rel="icon" href="logo.ico" mce_href="logo.ico" type="image/x-icon">
<link rel="shortcut icon" href="logo.ico" mce_href="logo.ico"
	type="image/x-icon">

  <link rel="stylesheet" href="../css/layout.css" type="text/css"></link>
  <link rel="stylesheet" href="../css/gobal.css" type="text/css"></link>
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
		dsy.add("0_0",["ȫ��","T��","����","����ȹ","ñ��","����","����ȹ","С��װ","�˶�Ь",
					   "����","����","�̿�","��Ь","ƤЬ","Ӿװ","��֯��"]);
		dsy.add("0_1",["ȫ��","����","�ֻ�","����","�����","���ӻ�","�����","ϴ�»�","�ڴ濨",
					  "���","̨��","�����","�����","�ֱ�","�緹��","΢��¯"]);
		dsy.add("0_2",["ȫ��","С˵","��ѧ","����/��Ĭ","����","����","����/ʱ��","����",
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

	function onsub(){
		var type = document.getElementById("s1").value;
		if(type == "-����-"){
			alert("��ѡ�����");
			return false;
		}
	}
	//-->

	</script>

	
  </head>
  
 <body onload="setup()" >
   <div id="container">
  <jsp:include page="../Top.jsp"></jsp:include>
    <h1>�޸���Ʒ</h1>
    <a href="view/AdminIndex.jsp" >��̨��ҳ</a><br/>
    <hr width="500px"/>
    <form action="servlet/GoodsServlet?type=update&id=<%=goods.getId() %>" method="post" enctype="multipart/form-data">
     <div style="margin-left:420px;background-color: #EEDDFF;width:500px;height:300px;">
    <table>
    <tr>
    	<td>��Ʒ���ƣ�</td>
    	<td>
    		<input type="text" value=<%=goods.getName() %> name="goodsName" size="40px">
    	</td>
    </tr>
    <tr>
    	<td>��Ʒ���ͣ�</td><td>
    		<select id="s1" name="goodsType"  >
    		<option value=<%=goods.getType()%>></option>
    		</select>&nbsp;
    		<select id="s2" name="specificClass" >
    		<option value=<%=goods.getSpecificClass() %>></option>
    		</select>
    	</td>
    </tr>
     <tr>
    	<td>��Ʒ�۸�</td>
    	<td>
    	<input type="text"  value=<%=goods.getPrice() %> name="goodsPrice" size="40px">
    	</td>
    </tr>
    <tr>
    	<td>��Ʒ������</td>
    	<td>
    	<input type="text" value=<%=goods.getAmount() %> name="goodsAmount" size="15px">
    	</td>
    </tr>
     <tr>
    	<td>��Ʒ���ܣ�</td>
    	<td>
    	<textarea name="goodsInfo" rows="5" cols="30" ><%=goods.getInfo() %></textarea>
    	</td>
    </tr>
     <tr>
    	<td>��ƷͼƬ��</td>
    	<td>
    	<input type="File"  name="goodsImage" style="width:200px;height:25px">
    	</td>
    </tr>
     <tr>
    	<td>&nbsp;</td>
    	<td >
    		<input type="submit" value="�ύ" onclick="onsub()" style="height:25px"/>&nbsp;
    		<input type="reset" value="����" style="height:25px"/>
    	</td>
    </table>
    </div>
    </form>
    </div>
     
  </body>
</html>
