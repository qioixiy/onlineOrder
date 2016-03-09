<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/manager.css" rel="stylesheet" type="text/css"
	media="all" />

<link rel="stylesheet" type="text/css" href="../css/progress.css">
<title>菜单管理操作页面</title>
</head>

<script type="text/javascript" src="../js/ajax_upload.js"
	charset="utf-8"></script>

<body>
	<div id="container">
		<div id="header">
			<h1 id="title">菜单管理操作页面</h1>
		</div>

		<div id="main">
			<div id="content">
				<strong><p style="margin-bottom: 20px;">添加新的菜式</p></strong>
				<form action="../servlet/UploadServlet" name="f1" id="f1"
					method="post" enctype="multipart/form-data" target="if">
					<input type="file" name="file1" /><br> <input type="button"
						name="but1" value="上传logo" onclick="go()" />
				</form>
				<br>
				<div id="pro" class="pro" align="left">
					<img alt="" src="../images/progress.png" width="10" height="15"
						id="imgpro">
				</div>
				<span id="prop" style="width: 15px; height: 15px; display: none;">0%</span>
				<iframe id="if" name="if" src="" style="display: none"></iframe>
				
				<form action="menu_manager_op_result.jsp">
					名字<input type="text" name="menu_name" /></br> 类别<input type="text"
						name="menu_type" /></br> 价格<input type="text" name="menu_price" /></br> 描述</br>
					<textarea id="" cols="50" rows="10" name="menu_detail"></textarea>
					</br> <input type="submit" value="提交" />
				</form>
			</div>
		</div>

		<div id="footer"></div>
	</div>

</body>
</html>