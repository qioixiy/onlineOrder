<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	if (!misc.Util.loginCheck(session)) {
		response.sendRedirect("../login/index.jsp");
	}
	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
	String _menu_id = request.getParameter("menu_id");
	ResultSet rs_pingjia = stmt.executeQuery("select * from pingjia where menu_id=" + "'" + _menu_id + "'");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="all" />
<title>����ҳ��</title>
</head>

<body>
	<div id="container">

		<div id="header">
			<div class="login_status">
				<%
					String username = (String) session.getAttribute("username");
					String status = "���¼";
					if (username != null) {
						status = "��ӭ��" + session.getAttribute("username");
					}
				%>
				<p>
					<%=status%></p>
			</div>
			<div id="menu">
				<ul>
					<li><a href="../index.jsp">��ҳ</a></li>
					<li><a href="../main/index.jsp">������ҳ</a></li>
					<li><a href="../login/index.jsp">�˳�</a></li>
				</ul>
			</div>
		</div>

		<div id="content">
			<%
				Statement stmt_menu = con.createStatement();
				ResultSet rs_menu = stmt_menu.executeQuery("select * from menu where id=" + "'" + _menu_id + "'");
				if (rs_menu.next()) {
					String name = rs_menu.getString("name");
					String thumb = rs_menu.getString("thumb");
			%>
			<h2 class="title_menu"><%=name%>(<%=_menu_id%>)
			</h2>
			<img src="../images/thumb/<%=thumb%>" width="150" height=120></img>
			<%
				} else {
					;
				}
			%>
			<div id="pingjia">
				<ul>
					<%
						if (rs_pingjia.next()) {
							System.out.println(_menu_id + " find");

							do {
								String _id = rs_pingjia.getString("id");
								String __menu_id = rs_pingjia.getString("menu_id");
								String _data = rs_pingjia.getString("data");
								String _score = rs_pingjia.getString("score");
								String _timestamp = rs_pingjia.getString("timestamp");
					%>
					<li class="li-liuyan">
						<p>
							<strong>��������:</strong><%=_data%></p>
						<p>
							����:<%=_score%></p>
						<p>
							ʱ��:<%=_timestamp%></p>
					</li>
					<%
						} while (rs_pingjia.next());
						} else {
							System.out.println(_menu_id + " no find");
					%>
					<h2>û���ҵ���Ӧ������</h2>
					;
					<%
						}
					%>
				</ul>
			</div>
		</div>
		<div class="div-clear"></div>
		<div id="footer">
			<p>��ַ���㽭ʡ�����б�����������·205��&nbsp;&nbsp;�ܻ���0574-86155210</p>
			<p>CopyRight&nbsp;&nbsp;��������ѧԺ��Ϣ���� 2016</p>
		</div>
	</div>
</body>
</html>