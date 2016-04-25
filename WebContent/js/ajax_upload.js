function getFileName(o){
    var pos=o.lastIndexOf("\\");
    return o.substring(pos+1);  
}

function go() {
	//alert("for test");
	f1.submit();
	document.getElementById("pro").style.display = "none";
	document.getElementById("prop").style.display = "";
	timer = setInterval("getP()", 50);
	document.getElementsByName("menu_image")[0].value = getFileName(document.getElementsByName("file1")[0].value);
}

var xmlHttpRequest;
function getP() {
	if (window.XmlHttpRequest) {
		xmlHttpRequest = new XmlHttpRequest();
	} else {
		xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}

	xmlHttpRequest.onreadystatechange = callBack;
	url = "../servlet/getProgressServlet";
	xmlHttpRequest.open("post", url, true);

	xmlHttpRequest.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	xmlHttpRequest.send("&timeStamp=" + (new Date()).getTime());

}
// 上传过程回调函数
function callBack() {

	if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {

		result = xmlHttpRequest.responseText;
		var result = result.replace(/(^\s*)|(\s*$)/g, "");
		var res = result.split(",");
		var flag = res[1];
		var per = parseInt(res[0]);
		var err = res[2];
		document.getElementById("imgpro").style.width = per * 5 + "px";
		document.getElementById("prop").innerHTML = per + "%";
		if (flag == "OK") {
			window.clearInterval(timer);
			alert("上传成功！");
			document.getElementById("pro").style.display = "none";
			document.getElementById("prop").innerHTML = "";
			f1.reset();
		}
		if (err != "" || err.length > 0) {
			window.clearInterval(timer);
			alert(err);
		}
		if (flag == null) {
			window.clearInterval(timer);
		}
	}
}

function test_alert() {
	alert("for test");
}