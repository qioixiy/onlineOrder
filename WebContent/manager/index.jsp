<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	String func_id = request.getParameter("func_id");
	
	Connection con = jdbc_conn.getConn();
	Statement manager_smt = con.createStatement();
	String user = (String) session.getAttribute("username");
	
	ResultSet rs = manager_smt.executeQuery("select * from manager where username=" + "'" + user + "'");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/manager.css" rel="stylesheet" type="text/css" media="all"/>
<title>ϵͳ����ҳ��</title>
</head>

<body>

	<%
		if (rs.next()) {
			System.out.println(user + " find");
	%>

	<div id="container">
		<div id="header">
			<h1 id="h1-header">ϵͳ����ҳ��</h1>
		</div>

		<div id="main">
			<div id="menu">
				<ul>
					<li><a href="./index.jsp?func_id=user_manager">��Ա����</a></li>
					<li><a href="#">��������</a></li>
					<li><a href="#">��Ӳ˵���Ϣ</a></li>
					<li><a href="#">������ҵ��Ϣ������</a></li>
				</ul>
			</div>

			<div id="content">
				<%
					if (null == func_id) {
						;
					} else if (func_id.equals("user_manager")) {
						Statement user_smt = con.createStatement();
						ResultSet user_rs = user_smt.executeQuery("select * from userinfo order by id desc");
						System.out.println("func_id.equals(\"user_manager\")");
				%>
				<table id="table-user-manager" border="1" cellpadding="0" cellspacing="0">
				<%
						while (user_rs.next()) {
							String _id = user_rs.getString("id");
							String _user = user_rs.getString("user");
							String _encrypt = user_rs.getString("encrypt");

							System.out.println("id:" + _id + ",user:" + _user + ",encrypt:" + _encrypt);
				%>
					<tr >
						<td width=50><%=_id%></td>
						<td width=100><%=_user%></td>
						<td width=50><%=_encrypt%></td>
					</tr>
				<%
						}
				%>
				</table>
				<%
					}
				%>

			</div>
		</div>

		<div id="footer"></div>
	</div>

	<%
		} else {
			System.out.println(user + " no find");
	%>
	<h2 id="h2-err">�㲻��ϵͳ����Ա</h2>
	<a href="../">���ص�¼ҳ��</a>
	<%
		}
	%>

</body>
</html>