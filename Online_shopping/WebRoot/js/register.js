var code ; //在全局 定义验证码
function createCode(){ 
code = new Array();
var codeLength = 4;//验证码的长度
var checkCode = document.getElementById("checkCode");
checkCode.value = "";

var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H',
		'J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z',
		'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r'
		,'s','t','u','v','w','x','y','z');

for(var i=0;i<codeLength;i++) {
   var charIndex = Math.floor(Math.random()*61);
   code +=selectChar[charIndex];
}
if(code.length != codeLength){
   createCode();
}
checkCode.value = code;

}

function validate () {
	/*alert(11);*/
var inputCode = document.getElementById("input1").value.toUpperCase();
code=code.toUpperCase();
if(inputCode.length <=0) {
	document.getElementById("sp1").innerHTML="验证码为空";
   return false;
}
else if(inputCode != code ){
   alert("验证码输入错误！");
   createCode();
   return false;
}
else {
   alert("成功！ 验证码为"+code);
   return true;
}
}

function changebg(){
	//alert(arguments[0].currentTarget);
	arguments[0].currentTarget.style.background="yellow";
}

function delbg() {
	arguments[0].currentTarget.style.background="none";
}


function checkPwd(){
     var pwd=document.getElementById("pwd");
     var pwd1=document.getElementById("pwd1");
	if(pwd1.value!=null){
		if(pwd.value!=pwd1.value){
			document.getElementById("ht1").innerHTML="两次输入密码不同";
		document.getElementById("ht1").style.color="red";
		}else
			document.getElementById("ht1").innerHTML="";
	}
}

function changeNum(){
	//alert("x="+x);
	/*alert(arguments[0].currentTarget.value);
	=document.getElementById("cart_sel").value;*/
	var x=arguments[1];
	var code=arguments[0].currentTarget.value;
	//alert("x="+x+"code="+code);
	location.href="CartServlet?ttt="+code+"&flag=upd&id="+x;
}


function update(){
	var x=arguments[0];
	/*alert("x="+x);*/
	if(x==1){
		document.getElementById("man2").style.display="block";
		document.getElementById("man3").style.display="none";
	}else if(x==2){
		document.getElementById("man2").style.display="none";
		document.getElementById("man3").style.display="block";
		location.href="CartServlet?flag=getMes";
	}	
}