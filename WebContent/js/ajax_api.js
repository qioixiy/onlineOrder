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
	var use_get = true;
	if (use_get) {
		xmlHttpRequest.open("GET", "../ajax", true);
	} else {
		xmlHttpRequest.open("POST", "../ajax", true);
	}
	xmlHttpRequest.onreadystatechange = callBack_ajax_update_userinfo;// 指定响应函数
	xmlHttpRequest.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");

	var user = document.getElementsByName("user").value;
	var xuehao = document.getElementsByName("xuehao").value;
	var email = document.getElementsByName("email").value;

	var body = null;
	body = "user=" + user + "&xuehao=" + xuehao + "&email=" + email;// 发送请求
	xmlHttpRequest.send(body);
}

function callBack_ajax_update_userinfo() {
	if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
		result = xmlHttpRequest.responseText;
		alert(result);
	}
}
