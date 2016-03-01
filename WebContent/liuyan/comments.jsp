<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage=""%>
<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	String login = (String)session.getAttribute("login");
	if (login == null) {
		out.println("need login");
		response.sendRedirect("../");
	}

	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
%>

<html>
<head>
<title>留言页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/web.css" rel="stylesheet" type="text/css">
</head>

<script>

	function open_window(url) {
		var newwin = window
				.open(
						url,
						"NewWin",
						"");
		//toolbar=no,resizable=yes,location=no,directories=no,status=no,menubar=no,top=100,left=50,width=720,height=400
		newwin.focus();
		return false;
	}
</script>

<body>
<div align="center" style="padding:10px;">
	<%	
		ResultSet rs = stmt.executeQuery("select * from comments order by id desc");
		String pages = request.getParameter("page");
		int pageInt = 1;
		if (pages == null) {
		} else {
			pageInt = Integer.parseInt(pages);
		}
		int i = 0;
		// skip some
		final int page_size = 5;
		while (i < page_size * (pageInt - 1) && rs.next()) {
			i++;
		}
	%>
	
	<div align="left">
		<h2>所有留言</h2>
		<a href="#" onClick="return open_window('comments_new.jsp')">添加留言</a>
		<a href="../">返回主页</a>
	</div>
	<table border="1" cellpadding="1" cellspacing="1">
		<%
			i = 0;
			while (rs.next() && i < page_size) {
				String bg_str = "#F0F0F0";
				
				i++;
				String name = rs.getString("xm");
				String email = rs.getString("email");
				String content = rs.getString("content");
				String url = rs.getString("url");
				String date = rs.getString("date");
				String ip = rs.getString("ip");
				String qq = rs.getString("qq");
		%>
		<tr>
			<td width="20%" bgcolor="<%=bg_str%>">
				<div align="center" style="font-size:15px;"><%=date%></div>
			</td>
			<td width="80%" bgcolor="<%=bg_str%>">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr align="center">
						<td >
							<a href="<%=url%>">Ta的主页</a>
						</td>
						<td>
							<strong>Ta的IP:</strong><span><%=ip%></span>
						</td>
						<td><a href="mailto:<%=email%>"><img
								src="../images/user/email.jpg" alt="<%=email%>" width="16" height="16"
								border="0" align="absmiddle"></a></td>
						<td>
							QQ:<%=qq%>
						</td>
						<td><a href="comments_del.jsp?id=<%=rs.getString("id")%>">
									<div>
										<img src="../images/user/del.jpg" alt="删除留言" width="16"
											height="16" border="0">
									</div>
							</a></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="center" valign="middle" bgcolor="#ffffff"><img
				src="../images/user/user_log_default.jpg" width="100" height="100"><br>
				<br> 留言人：<%=name%></td>
			<td bgcolor="#F2F2F2"><%=content%></td>
		</tr>
		<%
			}
		%>
		
		<!-- table end -->
		<tr bgcolor="#ffffff">
			<td></td>
			<%
				rs = stmt.executeQuery("select count(*) from comments");
				int totle_rs = 0;
				while (rs.next()) {
					totle_rs = rs.getInt(1);
				}
				int page_totle = (totle_rs + page_size - 1)/page_size;
				System.out.println("totle_rs:"+totle_rs + ",page_size:" + page_size + ",page_totle:"+page_totle);
			%>
			<td>
				<div align="right">
				共有留言<%=totle_rs%>条，这是第<%=pageInt%>页，转到第
				<%
					for (int j = 1; j <= page_totle; j++) {
				%>
					<a href="comments.jsp?page=<%=j%>"><%=j%></a>
				<%
						}
				%>页
				</div>
			</td>
		</tr>

	</table>
	</div>
</body>
</html>
<%
	try {
		rs.close();
		stmt.close();
		con.close();
	} catch (Exception ex) {
		;
	}
%>