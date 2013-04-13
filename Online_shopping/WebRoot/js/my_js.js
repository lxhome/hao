//arguments[2]



//广告切换
var nowFrame = 1;

function show(cur) {
	if (Number(cur)) {
		clearTimeout(theTimer); // 当触动按扭时，清除计时器
		nowFrame = cur; // 设当前显示图片
	}
	for ( var i = 1; i <= 4; i++) {
		document.getElementById("hao_div" + i).style.display = (i == nowFrame) ? 'block'
				: 'none'; // 当前图片显示
		document.getElementById("hao_a" + i).style.backgroundColor = (i == nowFrame) ? '#FF9900'
				: '#cccccc';
	}
	if (nowFrame == 4) // 设置下一个显示的图片
		nowFrame = 1;

	else
		nowFrame++;
	theTimer = setTimeout('show()', 3000); // 设置定时器，显示下一张图片
}

// 时间显示
var now_time;
function showTime() {
	now_time = new Date();
	var time_now = (now_time.getYear() + 1900) + "年"
			+ (now_time.getMonth() + 1) + "月" + now_time.getDate() + "日"
			+ now_time.getHours() + "时" + now_time.getMinutes() + "分"
			+ now_time.getSeconds() + "秒";
	// setTimeout("showTime()", 1000);
	document.getElementById("hao_time").innerHTML = time_now;
}
setInterval("showTime()", 1000);

// 公告栏
function showgg() {
	for ( var i = 1; i <= 5; i++) {
		// $("hao_gg"+i).style.borderBottom=(i==arguments[0])?"none":"1px
		// solid";
		if (i == arguments[0]) {
			$("hao_ad32" + i).style.display = "block";
			$("hao_gg" + i).style.bottom = "-6px";
			$("hao_gg" + i).style.backgroundColor = "white";
			$("hao_gg" + i).style.fontWeight = "bold";
			$("hao_gg" + i).style.fontSize = "16px";
		} else {
			$("hao_ad32" + i).style.display = "none";
			$("hao_gg" + i).style.bottom = "0px";
			$("hao_gg" + i).style.backgroundColor = "gray";
			$("hao_gg" + i).style.fontWeight = "normal";
			$("hao_gg" + i).style.fontSize = "14px";
		}

	}
}

function showbm() {
	for ( var i = 1; i <= 4; i++) {
		if (i == arguments[0]) {
			$("hao_ad42" + i).style.display = "block";
			$("hao_gf" + i).style.bottom = "-5px";
			$("hao_gf" + i).style.backgroundColor = "white"
			$("hao_gf" + i).style.fontWeight = "bold";
			$("hao_gf" + i).style.fontSize = "14px";
		} else {
			$("hao_ad42" + i).style.display = "none";
			$("hao_gf" + i).style.bottom = "0px";
			$("hao_gf" + i).style.backgroundColor = "gray"
			$("hao_gf" + i).style.fontWeight = "normal";
			$("hao_gf" + i).style.fontSize = "12px";
		}
	}
}

var tj_x = 0;// 开始显示图片的位置
var tj_ptr = 0;// 标志最后一位图片
var tj_i;// 记录点击前当前所在图片

function showtj() {	
	var temp;
	t = 112;
	tj = arguments[0];
	/*alert($("d1").);*/
	if (!Number(tj)) {
		$("d1").style.display = "block";
	} else if (tj == 1) {
		/*$("d1").style.cssFloat="left";
		$("d2").style.cssFloat="left";
		$("d3").style.cssFloat="left";
		$("d4").style.cssFloat="left";
		$("d1").offsetRight="27px";
		*/
			for ( var i = 1; i <= 4; i++) {// 记录点击前当前所在图片	
				//alert($("d" + i).style.display == "block");
				if ($("d" + i).style.display == "block") {
					
					if(tj_ptr==1){
						temp = 1;
						tj_i = 4;
					}
					else if (i == 4) {
						tj_ptr = 1;
						temp = 1;
						tj_i = i;
					} else{
						tj_i = i;
						temp = tj_i + 1;						
					}
						
				
					$("d" + temp).style.display = "block";
					tj_x = tj_x + t;
					//alert("1213");
					if (tj_x < 450) {						
						$("d" + tj_i).style.backgroundPositionX = tj_x + "px";
						$("d" + tj_i).style.width = 450 - tj_x + "px";
						$("d" + temp).style.backgroundPositionX = "0px";
						$("d" + temp).style.width = tj_x + "px";
						tj_Timer = setTimeout("showtj(1)",100);
					} else {
						tj_ptr = 0;
						tj_x = 0;
						$("d" + tj_i).style.display = "none";
						$("d" + temp).style.backgroundPositionX = tj_x + "px";
						$("d" + temp).style.width = "450px";
						clearTimeout(tj_Timer);
					}
					break;
				}//图片处于block状态 
				
			}
		
	}//tj==1

	else if (tj == 2) {
		/*$("d1").style.cssFloat="right";
		$("d2").style.cssFloat="right";
		$("d3").style.cssFloat="right";
		$("d4").style.cssFloat="right";
		$("d1").offsetRight="22px";
		$("d2").offsetRight="22px";
		$("d3").offsetRight="22px";
		$("d4").offsetRight="22px";*/
		/*$("d1").style.margin="0";
		$("d2").style.margin="0";
		$("d3").style.margin="0";
		$("d4").style.margin="0";*/
		
			for ( var i = 1; i <= 4; i++) {// 记录点击前当前所在图片	
				//alert($("d" + i).style.display == "block");
				if ($("d" + i).style.display == "block") {
					
					if(tj_ptr==1){
						temp = 1;
						tj_i = 4;
					}
					else if (i == 4) {
						tj_ptr = 1;
						temp = 1;
						tj_i = i;
					} else{
						tj_i = i;
						temp = tj_i + 1;						
					}
						
				
					$("d" + temp).style.display = "block";
					tj_x = tj_x + t;
					//alert("1213");
					if (tj_x < 450) {						
						$("d" + tj_i).style.backgroundPositionX = tj_x + "px";
						$("d" + tj_i).style.width = 450 - tj_x + "px";
						$("d" + temp).style.backgroundPositionX = "0px";
						$("d" + temp).style.width = tj_x + "px";
						tj_Timer = setTimeout("showtj(1)",100);
					} else {
						tj_ptr = 0;
						tj_x = 0;
						$("d" + tj_i).style.display = "none";
						$("d" + temp).style.backgroundPositionX = tj_x + "px";
						$("d" + temp).style.width = "450px";
						clearTimeout(tj_Timer);
					}
					break;
				}//图片处于block状态 
				
			}
		
		
	}
	// alert($("d1").offsetWidth+$("d1").clientWidth);
	// $("d1").style.width="400px";
	// alert($("d1").offsetWidth+$("d1").clientWidth);
	
	//alert($("d1").offsetRight+"ert"+$("d1").offsetLeft);
}

function $(id) {
	return document.getElementById(id);
}
