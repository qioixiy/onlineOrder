<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/manager.css" rel="stylesheet" type="text/css"
	media="all" />

<link rel="stylesheet" type="text/css" href="../css/progress.css">
<title>�˵��������ҳ��</title>
</head>

<script type="text/javascript" src="../js/ajax_upload.js"
	charset="utf-8"></script>

<body>
	<div id="container">
		<div id="header">
			<h1 id="title">�˵��������ҳ��</h1>
		</div>

		<div id="main">
			<div id="content">

				<form action="menu_manager_op_result.jsp">
					<strong><p style="margin-bottom: 20px;">����µĲ�ʽ</p></strong> ����<input
						type="text" name="menu_name" /></br> ���<input type="text"
						name="menu_type" /></br> �۸�<input type="text" name="menu_price" /></br> ����</br>
					<textarea id="" cols="50" rows="10" name="menu_detail"></textarea>
					</br> <input type="submit" value="�ύ" />
				</form>

				<form action="../servlet/UploadServlet" name="f1" id="f1"
					method="post" enctype="multipart/form-data" target="if">
					<input type="file" name="file1" /><br><input type="button" name="but1"
						value="�ϴ�logo" onclick="go()" />
				</form>
				<br>
				<div id="pro" class="pro" align="left">
					<img alt="" src="../images/progress.png" width="10" height="15"
						id="imgpro">
				</div>
				<span id="prop" style="width: 15px; height: 15px; display: none;">0%</span>
				<iframe id="if" name="if" src="" style="display: none"></iframe>
			</div>
		</div>

		<div id="footer"></div>
	</div>

</body>
</html>