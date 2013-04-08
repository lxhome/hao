var code; // 在全局 定义验证码
function createCode() {
	code = new Array();
	var codeLength = 4;// 验证码的长度
	var checkCode = document.getElementById("checkCode");
	checkCode.value = "";

	var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C',
			'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R',
			'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e',
			'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
			's', 't', 'u', 'v', 'w', 'x', 'y', 'z');

	for ( var i = 0; i < codeLength; i++) {
		var charIndex = Math.floor(Math.random() * 61);
		code += selectChar[charIndex];
	}
	if (code.length != codeLength) {
		createCode();
	}
	checkCode.value = code;
}

function validate() {
	// alert(11);
	var inputCode = document.getElementById("input1").value.toUpperCase();
	code = code.toUpperCase();
	if (inputCode != code) {
		document.getElementById("tt3").value = "tt3";
		document.getElementById("ht4").innerHTML = "验证码错误";
		document.getElementById("ht4").style.color = "red";
		createCode();
	} else {
		document.getElementById("ht4").innerHTML = "";
	}
}

function changebg() {
	// alert(arguments[0].currentTarget);
	arguments[0].currentTarget.style.background = "yellow";
}

function delbg() {
	arguments[0].currentTarget.style.background = "none";
}

function checkuse() {
	var pwd = document.getElementById("username");
	var myreg = /^[0-9A-Za-z]{1,}$/;
	// alert(myreg.test(pwd.value));
	if (!myreg.test(pwd.value)) {
		document.getElementById("ht2").innerHTML = "英文字母、数字(0-9)组成";
		document.getElementById("ht2").style.color = "red";
		document.getElementById("tt1").value = "tt1";
	} else {
		document.getElementById("ht2").innerHTML = "账号由英文字母、数字(0-9)组成";
		document.getElementById("ht2").style.color = "black";
	}

}

function checkP() {
	var pwd = document.getElementById("pwd");
	var myreg = /^[0-9A-Za-z]{4,16}$/;
	// alert(myreg.test(pwd.value));
	if (!myreg.test(pwd.value)) {
		// alert(myreg.test(pwd.value));
		document.getElementById("ht3").style.color = "red";
		document.getElementById("tt1").value = "tt1";
	} else {
		document.getElementById("ht3").style.color = "black";
	}
}

function checkPwd() {
	var pwd = document.getElementById("pwd");
	var pwd1 = document.getElementById("pwd1");
	if (pwd1.value != null) {
		if (pwd.value != pwd1.value) {
			document.getElementById("ht1").innerHTML = "两次输入密码不同";
			document.getElementById("ht1").style.color = "red";
			document.getElementById("tt1").value = "tt1";
		} else
			document.getElementById("ht1").innerHTML = "";
	}
}

function checkEmail() {
	var temp = document.getElementById("email");
	// 对电子邮件的验证
	var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if (!myreg.test(temp.value)) {
		document.getElementById("email1").innerHTML = "请输入正确的邮箱";
		document.getElementById("email1").style.color = "red";
		document.getElementById("tt2").value = "tt2";
	} else
		document.getElementById("email1").innerHTML = "";
}

function changeNum() {
	// alert("x="+x);
	/*
	 * alert(arguments[0].currentTarget.value);
	 * =document.getElementById("cart_sel").value;
	 */
	var x = arguments[1];
	var code = arguments[0].currentTarget.value;
	// alert("x="+x+"code="+code);
	location.href = "CartServlet?ttt=" + code + "&flag=upd&id=" + x;
}

function update() {
	var x = arguments[0];
	/* alert("x="+x); */
	if (x == 1) {
		document.getElementById("man2").style.display = "block";
		document.getElementById("man3").style.display = "none";
	} else if (x == 2) {
		document.getElementById("man2").style.display = "none";
		document.getElementById("man3").style.display = "block";
		location.href = "CartServlet?flag=getMes";
	}
}

function checkPhone() {
	var mobile = /^((13[0-9]{1})|159|153)+\d{8}$/;
	var x = document.getElementById("phone").value;
	if (!mobile.test(x)) {
		$("phone1").innerHTML = "手机号码不正确";
		$("phone1").style.color = "red";
		$("phone2").value = "p2";
	} else {
		$("phone1").innerHTML = "";
	}
}

function check_surname(str) {
	var str = str.substr(0, 1); // 截取用户提交的用户名的前两字节，也就是姓。
	var surname = " 赵钱孙李周吴郑王冯陈褚卫蒋沈韩杨朱秦尤许何吕施张孔曹严华金魏陶姜戚谢邹喻柏水窦章云苏潘葛奚范彭郎鲁韦昌马苗凤花方俞任袁柳酆鲍史唐费廉岑薛雷贺倪汤 滕殷罗毕郝邬安常乐于时傅皮卞齐康伍余元卜顾孟平黄和穆萧尹姚邵堪汪祁毛禹狄米贝明臧计伏成戴谈宋茅庞熊纪舒屈项祝董粱杜阮蓝闵席季麻强贾路娄危江童颜郭 梅盛林刁钟徐邱骆高夏蔡田樊胡凌霍虞万支柯咎管卢莫经房裘缪干解应宗宣丁贲邓郁单杭洪包诸左石崔吉钮龚程嵇邢滑裴陆荣翁荀羊於惠甄魏加封芮羿储靳汲邴糜松 井段富巫乌焦巴弓牧隗山谷车侯宓蓬全郗班仰秋仲伊宫宁仇栾暴甘钭厉戎祖武符刘姜詹束龙叶幸司韶郜黎蓟薄印宿白怀蒲台从鄂索咸籍赖卓蔺屠蒙池乔阴郁胥能苍双 闻莘党翟谭贡劳逄姬申扶堵冉宰郦雍郤璩桑桂濮牛寿通边扈燕冀郏浦尚农温别庄晏柴瞿阎充慕连茹习宦艾鱼容向古易慎戈廖庚终暨居衡步都耿满弘匡国文寇广禄阙东 殴殳沃利蔚越夔隆师巩厍聂晁勾敖融冷訾辛阚那简饶空曾毋沙乜养鞠须丰巢关蒯相查后江红游竺权逯盖益桓公万俟司马上官欧阳夏侯诸葛闻人东方赫连皇甫尉迟公羊 澹台公冶宗政濮阳淳于仲孙太叔申屠公孙乐正轩辕令狐钟离闾丘长孙慕容鲜于宇文司徒司空亓官司寇仉督子车颛孙端木巫马公西漆雕乐正壤驷公良拓拔夹谷宰父谷粱 晋楚闫法汝鄢涂钦段干百里东郭南门呼延妫海羊舌微生岳帅缑亢况後有琴梁丘左丘东门西门商牟佘佴伯赏南宫墨哈谯笪年爱阳佟第五言福";
	r = surname.search(str); // 查找字符串。
	if (r == -1)
		return false;
	else
		return true;
}

function checkname() {
	var x = $("username").value;
	var reg = /^([\u4E00-\u9FA5])*$/;
	if(x!=""){
		if(x.length==1){
			$("checknull").innerHTML="姓名必须是两个字以上";
			$("checknull").style.color="red";
			$("checkNn").value="c2";
			$("username").focus();
		}else if(reg.test(x)&&check_surname(x)){
			$("checknull").innerHTML="";
		}else{
			$("checknull").innerHTML="姓名格式错误";
			$("username").focus();
			$("checkNn").value="c2";
			$("checknull").style.color="red";
		}	
	}
}


function $(id) {
	return document.getElementById(id);
}