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
		<td width=100>主要内容</td>
		<td width=100>发布日期</td>
		<td width=100>摘要</td>
	</tr>
	<%
		String td_class = "td_class_1";
			String bg_str = "#F0F0F0";
			int index = 0;

			String sql = "select * from news order by id DESC";
			ResultSet news_rs = smt.executeQuery(sql);
			while (news_rs.next()) {
				String _id = news_rs.getString("id");
				String _title = news_rs.getString("title");
				String _date = news_rs.getString("date");
				String _data = news_rs.getString("data");
				_data = _data.substring(0, Math.min(40, _data.length()));

				System.out.println("id:" + _id);
				System.out.println("_title:" + _title);
				System.out.println("_date:" + _date);
				System.out.println("_data:" + _data);
	%>
	<tr>
		<td class="<%=td_class%>" width=50><%=_id%></td>
		<td class="<%=td_class%>" width=200><%=_title%></td>
		<td class="<%=td_class%>" width=200><%=_date%></td>
		<td class="<%=td_class%>" width=200><%=_data%></td>
		<td bgcolor="#ffffff" style="text-align: center;"><a href="#"
			onclick="get_url('news.jsp?func_id=del&id=<%=_id%>')">删除</a></td>
	</tr>
	<%
		}
	%>
</table>
<%
	} else if (func_id.equals("add_news")) {
%>
<form action="../ajax">
	主题内容<input type="text" name="title" /></br> 详细内容</br>
	<textarea id="" cols="100" rows="15" name="data"></textarea>
	</br> <input type="button" value="提交" onclick="ajax_add_news()" />
</form>
<%
	} else if (func_id.equals("del")) {
		String _id = request.getParameter("id");
		System.out.println("del _id=" + _id);
		String sql = "delete from news where id=" + _id;
		smt.execute(sql);
		%>
		删除成功
		<%
	} else {
		System.out.println("unkown func_id");
	}
%>
