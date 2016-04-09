<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />

<%
	if (!misc.Util.loginCheck(session)) {
		response.sendRedirect("../login/index.jsp");
	}
	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
	String user = (String) session.getAttribute("username");
	String _id = "";
	String _user = "";
	String _xuehao = "";
	String _email = "";
	String _timestamp = "";
	if (user != null) {
		String sql = "select * from userinfo where user=" + "'" + user + "'";
		System.out.println(sql);
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			System.out.println("find userinfo with " + user);
			_id = rs.getString("id");
			_user = rs.getString("user");
			_xuehao = rs.getString("xuehao");
			_email = rs.getString("email");
			_timestamp = rs.getString("timestamp");
		}
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312" />
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="../js/ajax_api.js"></script>
<title>������Ϣ</title>
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
					<li><a href="index.jsp">������ҳ</a></li>
					<li><a href="../login/index.jsp">�˳�</a></li>
				</ul>
			</div>

			<div class="div-clear"></div>
		</div>
		<div id="main">
			<div style="padding: 10px; background-color: #ddd;">
				<div
					style="float: left; width: 50%; min-height: 300px; background-color: #eee; padding: 10px;">
					<h2>�ҵ���Ϣ</h2>
					<a href="javascript:void(0)" onclick="userInfoEdit(this)">�༭</a>
					<div id="d1" style="background-color: #edd; padding: 10px;">
						<p id="user-id" name=<%=_id%>></p>
						<table>
							<tr>
								<td><strong> �û���</strong></td>
								<td><%=_user%></td>
							</tr>
							<tr>
								<td><strong>ѧ��</strong></td>
								<td><%=_xuehao%></td>
							</tr>
							<tr>
								<td><strong>����</strong></td>
								<td><%=_email%></td>
							</tr>
							<tr>
								<td><strong>ע��ʱ��</strong></td>
								<td><%=_timestamp%></td>
							</tr>
						</table>
					</div>
					<div id="d2" style="display: none">
						<form action="menu_manager_op_result.jsp">
							<p>
								�û�<input type="text" name="user" value="<%=_user%>" />
							</p>
							<p>
								ѧ��<input type="text" name="xuehao" value="<%=_xuehao%>" />
							</p>
							<p>
								����<input type="text" name="email" value="<%=_email%>" />
							</p>
							<input type="button" value="�ύ�޸�"
								onclick="ajax_update_userinfo()" /><a href="javascript:void(0)"
								onclick="userInfoCancelEdit(this)">ȡ���༭</a>
						</form>
					</div>
				</div>
				<div
					style="min-height: 300px; background-color: #aee; padding: 10px;">
					<h2>�ҵĶ���</h2>
					<div
						style="background-color: #edd; padding: 10px; border: 1px solid #ccc;">
						<table>
							<tr>
								<td>����</td>
								<td>�µ�ʱ��</td>
								<td>����</td>
								<td>����</td>
								<td>���̺�</td>
							</tr>
							<%
								String sql = "select * from order_form where user_id=" + "'" + _id + "'";
								System.out.println(sql);
								ResultSet rs = stmt.executeQuery(sql);
								int index = 0;
								while (rs.next()) {
									String timestamp, menu_id, repeat, dish_id;
									timestamp = rs.getString("timestamp");
									menu_id = rs.getString("menu_id");
									repeat = rs.getString("repeat");
									dish_id = rs.getString("dish_id");
									index++;
							%>
							<tr>
								<td><%=index%></td>
								<td><%=timestamp%></td>
								<td><%=menu_id%></td>
								<td><%=repeat%></td>
								<td><%=dish_id%></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="div-clear"></div>
		<div id="footer">
			<p>��ַ���㽭ʡ�����б�����������·205��&nbsp;&nbsp;�ܻ���0574-86155210</p>
			<p>CopyRight&nbsp;&nbsp;��������ѧԺ��Ϣ���� 2016</p>
		</div>
	</div>
	<script type="text/javascript">
		function userInfoEdit() {
			document.getElementById("d1").style.display = "none";
			document.getElementById("d2").style.display = "block";
		}
		function userInfoCancelEdit() {
			document.getElementById("d2").style.display = "none";
			document.getElementById("d1").style.display = "block";
		}
	</script>
</body>
</html>
