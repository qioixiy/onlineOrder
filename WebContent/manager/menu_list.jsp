<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	Connection con = jdbc_conn.getConn();
	Statement menu_smt = con.createStatement();
	System.out.println("get menu_list.jsp");
	String op = request.getParameter("op");
	String menu_id = request.getParameter("menu_id");
	if (op != null) {
		if (op.equals("del")) {
			String sql = "delete from `menu` where `id` = " + menu_id;
			System.out.println(sql);
			menu_smt.execute(sql);
		}
	}

	ResultSet meun_rs = menu_smt.executeQuery("select * from menu order by id desc");
%>
<table id="table-userinfo">
	<%
		String td_class = "td_class_1";
		int index = 0;
	%>
	<tr bgcolor="ccccc0">
		<strong>
			<td width=50>序号</td>
			<td width=150>菜名</td>
			<td width=150>菜的类别</td>
			<td width=50>价格</td>
			<td width=180>时间</td>
			<td width=150>简介、说明</td>
			<td width=150></td>
		</strong>
	</tr>
	<%
		int index_id = 0;
		while (meun_rs.next()) {
			if (0 == index++ % 2) {
				td_class = "td_class_1";
			} else {
				td_class = "td_class_2";
			}
			String _id = meun_rs.getString("id");
			String _name = meun_rs.getString("name");
			String _style = meun_rs.getString("style");
			String _price = meun_rs.getString("price");
			String _timestamp = meun_rs.getString("timestamp");
			String _details = meun_rs.getString("details");
			index_id++;
	%>
	<tr>
		<td class="<%=td_class%>" width=50><%=index_id%></td>
		<td class="<%=td_class%>" width=200><%=_name%></td>
		<td class="<%=td_class%>" width=50><%=_style%></td>
		<td class="<%=td_class%>" width=50><%=_price%></td>
		<td class="<%=td_class%>" width=50><%=_timestamp%></td>
		<td class="<%=td_class%>" width=50><%=_details%></td>
		<td bgcolor="ffffff" width=50 style="text-align: center;"><a
			href="#" onclick="get_url('menu_list.jsp?op=del&menu_id=<%=_id%>')">删除</a></td>
	</tr>
	<%
		}
	%>
</table>