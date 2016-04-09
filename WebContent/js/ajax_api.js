var xmlHttpRequest;

function createXMLHttpRequest() {
	if (window.XMLHttpRequest) { // Mozilla
		xmlHttpRequest = new XMLHttpRequest();
	} else if (window.ActiveXObject) { // IE
		try {
			xmlHttpRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				;
			}
		}
	}
}

function ajax_update_userinfo() {
	createXMLHttpRequest();

	var url = "../ajax";
	var user = document.getElementById("user").value;
	var xuehao = document.getElementById("xuehao").value;
	var email = document.getElementById("email").value;
	var paramer = "user=" + user + "&xuehao=" + xuehao + "&email=" + email;// 发送请求;

	var method = null;
	var use_get = false;
	if (use_get) {
		url = url + "?" + paramer;
		paramer = null;
		method = "GET";
	} else {
		method = "POST";
	}
	xmlHttpRequest.open(method, url, true);
	xmlHttpRequest.onreadystatechange = callBack_ajax_update_userinfo;// 指定响应函数
	xmlHttpRequest.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");

	xmlHttpRequest.send(paramer);
}

function callBack_ajax_update_userinfo() {
	if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
		result = xmlHttpRequest.responseText;
		alert(result);
	}
}
