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

function callBack_update_userinfo()
{
	callBack_default();
	location=location;
}
function ajax_update_userinfo() {
	createXMLHttpRequest();

	var func_paramer = "update_userinfo";

	var url = "../ajax";
	var user = document.getElementById("user").value;
	var xuehao = document.getElementById("xuehao").value;
	var email = document.getElementById("email").value;

	var paramer = "func=" + func_paramer + "&user=" + user + "&xuehao="
			+ xuehao + "&email=" + email;

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
	xmlHttpRequest.onreadystatechange = callBack_update_userinfo;// 指定响应函数
	xmlHttpRequest.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");

	xmlHttpRequest.send(paramer);// 发送请求;
}

function ajax_submit_newmenu() {

	createXMLHttpRequest();

	var func_paramer = "submit_newmenu";
	var url = "../ajax";
	var menu_image = document.getElementsByName("menu_image")[0].value;
	var menu_name = document.getElementsByName("menu_name")[0].value;
	var menu_type = document.getElementsByName("menu_type")[0].value;
	var menu_subtype = document.getElementsByName("menu_subtype")[0].value;
	var menu_price = document.getElementsByName("menu_price")[0].value;
	var menu_detail = document.getElementsByName("menu_detail")[0].value;

	var paramer = "func=" + func_paramer + "&menu_image=" + menu_image
			+ "&menu_name=" + menu_name + "&menu_type=" + menu_type
			+ "&menu_subtype=" + menu_subtype + "&menu_price=" + menu_price
			+ "&menu_detail=" + menu_detail;

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
	xmlHttpRequest.onreadystatechange = callBack_default;
	xmlHttpRequest.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");

	xmlHttpRequest.send(paramer);// 发送请求;
}

function callBack_default() {
	if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
		result = xmlHttpRequest.responseText;
		if (result == 1) {
			alert("success");
		} else {
			alert("failed");
		}
	}
}

function ajax_add_news()
{
	createXMLHttpRequest();

	var func_paramer = "add_news";
	var url = "../ajax";
	var title = document.getElementsByName("title")[0].value;
	var data = document.getElementsByName("data")[0].value;
	
	var paramer = "func=" + func_paramer + "&title=" + title
			+ "&data=" + data;

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
	xmlHttpRequest.onreadystatechange = callBack_default;
	xmlHttpRequest.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");

	xmlHttpRequest.send(paramer);// 发送请求;
}

function test() {
	alert("test");
}