var xmlHttpRequest;

// 创建XMLHttpRequest对象
function createXMLHttpRequest() {
	if (window.XMLHttpRequest) { // Mozilla 浏览器
		xmlHttpRequest = new XMLHttpRequest();
	} else if (window.ActiveXObject) { // IE浏览器
		try {
			xmlHttpRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
			}
		}
	}
}

function get_url(url) {
	createXMLHttpRequest();
	xmlHttpRequest.open("GET", url, true);
	xmlHttpRequest.setRequestHeader("Cache-Control","no-cache");
	xmlHttpRequest.setRequestHeader("If-Modified-Since","0")
	xmlHttpRequest.onreadystatechange = get_url_callBack;// 指定响应函数
	// xmlHttpRequest.setRequestHeader("Content-type",
	// "application/x-www-form-urlencoded");
	// xmlHttpRequest.send("&timeStamp=" + (new Date()).getTime());
	xmlHttpRequest.send(null); // 发送请求

}

function get_url_callBack() {
	if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
		result = xmlHttpRequest.responseText;
		document.getElementById("inner-html-1").innerHTML = result;
	}
}

function main_search()
{
	var url = document.getElementById("form_search").action;
	var val = document.getElementById("input_search").value;
	url = url + "?search=" + val;
	document.getElementById("form_search").action = url;
	document.getElementById("form_search").submit();
}
function test_alert() {
	alert("for test");
}