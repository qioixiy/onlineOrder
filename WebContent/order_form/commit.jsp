<%@page import="misc.SendMail"%>
<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />

<%
	if (!misc.Util.loginCheck(session)) {
		response.sendRedirect("../login/index.jsp");
	}
	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
	String menu_id = request.getParameter("menu_id");
	String num = request.getParameter("num");
	String username = (String) session.getAttribute("username");
	String user_id = null;
	String user_email = null;
	ResultSet rs_userinfo = stmt.executeQuery("select * from userinfo where user=" + "'" + username + "'");
	if (rs_userinfo.next()) {
		user_id = rs_userinfo.getString("id");
		user_email = rs_userinfo.getString("email");
		System.out.println("username:" + username + ",user_id:" + user_id);
	} else {
		response.sendRedirect("../login/index.jsp");
		return;
	}
	ResultSet rs_menu = stmt.executeQuery("select * from menu where id=" + menu_id);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="all" />
<title>�µ�ҳ��</title>
</head>
<body>

	<%
		if (rs_menu.next()) {
			String name = rs_menu.getString("name");
			String thumb = rs_menu.getString("thumb");
			String price = rs_menu.getString("price");
	%>

	<div id="container">
		<div id="header">
			<div id="menu">
				<ul>
					<li><a href="../index.jsp">��ҳ</a></li>
					<li><a href="../main/index.jsp">������ҳ</a></li>
					<li><a href="../login/index.jsp">�˳�</a></li>
				</ul>
			</div>
		</div>
		<div class="content">
			<h2><%=name%>(<%=menu_id%>)
			</h2>
			<img src="../images/thumb/<%=thumb%>" width="150" height=120></img>
			<%
				try {
						Statement stmt_order = con.createStatement();
						String sql = "INSERT INTO `order_form` ( `id` , `user_id` , `menu_id` , `repeat` , `spec` ) VALUES (NULL , '"
								+ user_id + "', '" + menu_id + "', '" + num + "', 'null')";
						System.out.println(sql);
						boolean result = stmt_order.execute(sql);
						System.out.println(result);

						String mailTitle = "���ύ�µĶ���";
						String mailContent = "����:" + name + ",����:" + num + "��,����:" + price + "Ԫ";
						SendMail.sendMailWithDefaultServer(user_email, mailTitle, mailContent);
			%>
			<p>�µ��ɹ�</p>
			<a href="../main/index.jsp">������ҳ</a>
			<%
				} catch (Exception e) {
						e.printStackTrace();
					}
				}
			%>
		</div>
		<div class="div-clear"></div>
		<div id="footer">
			<p>��ַ���㽭ʡ�����б�����������·205��&nbsp;&nbsp;�ܻ���0574-86155210</p>
			<p>CopyRight&nbsp;&nbsp;��������ѧԺ��Ϣ���� 2016</p>
		</div>
	</div>

</body>
</html>