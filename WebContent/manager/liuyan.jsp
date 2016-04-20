<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />

<%
	Connection con = jdbc_conn.getConn();
	Statement smt = con.createStatement();
	String func_id = request.getParameter("func_id");
	if (func_id == null) {
		System.out.println("unkown func_id, func_id == null");
		return;
	}
	if (func_id.equals("list_all")) {
%>
<table id="table-userinfo">
	<tr bgcolor="ccccc0">
		<td width=50>id</td>
		<td width=100>留言日期</td>
		<td width=100>摘要</td>
	</tr>
	<%
		String td_class = "td_class_1";
			String bg_str = "#F0F0F0";
			int index = 0;

			String sql = "select * from comments order by id DESC";
			ResultSet news_rs = smt.executeQuery(sql);
			while (news_rs.next()) {
				String _id = news_rs.getString("id");
				String _date = news_rs.getString("date");
				String _content = news_rs.getString("content");
				_content = _content.substring(0, Math.min(40, _content.length()));

				System.out.println("id:" + _id);
				System.out.println("_date:" + _date);
				System.out.println("_content:" + _content);
	%>
	<tr>
		<td class="<%=td_class%>" width=50><%=_id%></td>
		<td class="<%=td_class%>" width=150><%=_date%></td>
		<td class="<%=td_class%>" width=300><%=_content%></td>
		<td bgcolor="#ffffff" style="text-align: center;"><a href="#"
			onclick="get_url('liuyan.jsp?func_id=del&id=<%=_id%>')">删除</a></td>
	</tr>
	<%
		}
	%>
</table>
<%
	} else if (func_id.equals("del")) {
		String _id = request.getParameter("id");
		System.out.println("del _id=" + _id);
		String sql = "delete from comments where id=" + _id;
		System.out.println(sql);
		smt.execute(sql);
		%>
		删除成功
		<%
	} else {
		System.out.println("unkown func_id");
	}
%>
