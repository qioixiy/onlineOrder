<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	Connection con = jdbc_conn.getConn();
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
		<td width=100>用户名</td>
		<td width=100>学号</td>
		<td width=100>邮箱</td>
		<td width=100>注册时间</td>
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
			String _xuehao = user_rs.getString("xuehao");
			String _email = user_rs.getString("email");
			String _timestamp = user_rs.getString("timestamp");
	%>
	<tr>
		<td class="<%=td_class%>" width=50><%=_id%></td>
		<td class="<%=td_class%>" width=200><%=_user%></td>
		<td class="<%=td_class%>" width=200><%=_xuehao%></td>
		<td class="<%=td_class%>" width=200><%=_email%></td>
		<td class="<%=td_class%>" width=200><%=_timestamp%></td>
		<td bgcolor="#ffffff" width=50 style="text-align: center;"><a
			href="user_manager_op.jsp?type=del&user_id=<%=_id%>">删除</a></td>
		<td bgcolor="#ffffff" style="text-align: center;"><a
			href="user_manager_op.jsp?type=set_as_manager&user_id=<%=_id%>&user_name=<%=_user%>">设置为管理员</a></td>
	</tr>
	<%
		}
	%>
</table>