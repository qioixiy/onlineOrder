<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/manager.css" rel="stylesheet" type="text/css"
	media="all" />
<title>²Ëµ¥¹ÜÀí²Ù×÷Ò³Ãæ</title>
</head>

<body>
	<div id="container">
		<div id="header">
			<h1 id="title">²Ëµ¥¹ÜÀí²Ù×÷Ò³Ãæ</h1>
		</div>

		<div id="main">
			<div id="content">

				<form action="menu_manager_op_result.jsp">
					<strong><p style="margin-bottom:20px;">Ìí¼ÓÐÂµÄ²ËÊ½</p></strong>
					Ãû×Ö<input type="text" name="menu_name" /><p></p>
					Àà±ð<input type="text" name="menu_type" /><p></p>
					¼Û¸ñ<input type="text" name="menu_price" /><p></p>
					<textarea id="" cols="50" rows="10" name="menu_detail"></textarea><p></p>
					<input type="submit" value="Ìá½»" />
				</form>
			</div>
		</div>

		<div id="footer"></div>
	</div>

</body>
</html>