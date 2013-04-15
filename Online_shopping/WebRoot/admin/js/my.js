function showOrder(){
	var x=arguments[0];
	alert(x);
	if(x==1){	
	$("myord2").style.display="block";
	$("myord3").style.display="none";	
	}else if(x==2){
		$("myord2").style.display="none";
		$("myord3").style.display="block";		
	}
}

/*function ceshi(){
	alert($("tupian").value);
	$("img").src=$("tupian").value+"";
}*/

function $(id){
	return document.getElementById(id);
}