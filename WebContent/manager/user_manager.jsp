<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	Connection con = jdbc_conn.getConn();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="all" />
<title>��Ա����ҳ��</title>
</head>

<body>
	<div id="container">
		<div id="header">
			<h1 id="title">��Ա����ҳ��</h1>
		</div>

		<div id="main">
			<div id="menu-v">
				<ul>
					<li><a href="index.jsp">���ع�����ҳ</a></li>
					<li><a href="user_manager.jsp">�鿴����</a></li>
				</ul>
			</div>

			<div id="content">
				<%
					Statement user_smt = con.createStatement();
					ResultSet user_rs = user_smt.executeQuery("select * from userinfo order by id desc");
				%>
				<table id="table-userinfo">
					<%
						String td_class = "td_class_1";
						String bg_str = "#F0F0F0";
						int index = 0;
					%>
					<tr bgcolor="ccccc0">
						<td width=50>id</td>
						<td width=100>�û���</td>
						<td width=50>encrypt?</td>
					</tr>
					<%
						while (user_rs.next()) {
							if (0 == index++ % 2) {
								td_class = "td_class_1";
							} else {
								td_class = "td_class_2";
							}
							String _id = user_rs.getString("id");
							String _user = user_rs.getString("user");
							String _encrypt = user_rs.getString("encrypt");

							System.out.println("id:" + _id + ",user:" + _user + ",encrypt:" + _encrypt);
					%>
					<tr>
						<td class="<%=td_class%>" width=50><%=_id%></td>
						<td class="<%=td_class%>" width=200><%=_user%></td>
						<td class="<%=td_class%>" width=50><%=_encrypt%></td>
						<td bgcolor="#ffffff" width=50 style="text-align: center;"><a
							href="user_manager_op.jsp?type=del&user_id=<%=_id%>">ɾ��</a></td>
						<td bgcolor="#ffffff" style="text-align: center;"><a
							href="user_manager_op.jsp?type=set_as_manager&user_id=<%=_id%>&user_name=<%=_user%>">����Ϊ����Ա</a></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>

		<div id="footer"></div>
	</div>

</body>
</html>