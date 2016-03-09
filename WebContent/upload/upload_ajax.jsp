<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/progress.css">
<script type="text/javascript" src="../js/ajax_upload.js" charset="utf-8"></script>
</head>

<body>
	<form action="../servlet/UploadServlet" name="f1" id="f1" method="post"
		enctype="multipart/form-data" target="if">
		<input type="file" name="file1" /><br>
		<input type="reset" name="res1" value="重置" /> <input type="button"
			name="but1" value="提交" onclick="go()" />
	</form>
	<br>
	<div id="pro" class="pro" align="left">
		<img alt="" src="../images/progress.png" width="10" height="15"
			id="imgpro">
	</div>
	<span id="prop" style="width: 15px; height: 15px; display: none;">0%</span>
	<iframe id="if" name="if" src="" style="display: none"></iframe>
</body>
</html>