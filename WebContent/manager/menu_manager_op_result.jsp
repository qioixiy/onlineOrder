<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	Connection con = jdbc_conn.getConn();

	String menu_image = request.getParameter("menu_image");
	String menu_name = request.getParameter("menu_name");
	String menu_type = request.getParameter("menu_type");
	String menu_subtype = request.getParameter("menu_subtype");
	String menu_price = request.getParameter("menu_price");
	String menu_detail = request.getParameter("menu_detail");
	System.out.println(menu_name + menu_type + menu_price + menu_detail);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="all" />
<title>²Ëµ¥¹ÜÀí²Ù×÷Ò³Ãæ</title>
</head>

<body>
	<div id="container">
		<div id="header">
			<h1 id="title">²Ëµ¥¹ÜÀí²Ù×÷Ò³Ãæ</h1>
		</div>

		<div id="main">
			<%
				String sql = null;
				if (menu_name == null || menu_type == null || menu_price == null || menu_detail == null) {
					System.out.println("invalid data");
				} else {
					Statement menu_smt = con.createStatement();
					sql = "INSERT INTO `menu` ( `id` , `name` , `style`, `style2`, `price`, `thumb`, `timestamp`, `details`)"
							+ "VALUES (NULL," + "'" + menu_name + "'" + ","
							+ "'" + menu_type + "'" + ","+ "'" + menu_type + "'" + "," + "'" + menu_price + "'" + ","
							+ "'" + menu_image + "'," + "NULL," + "'" + menu_detail + "'" + ")";
					System.out.println(sql);
					menu_smt.execute(sql);
				}
			%>
		</div>

		<div id="footer"></div>
	</div>

</body>
</html>