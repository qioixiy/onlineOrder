<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>留言本</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/web.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
	function openw(url) {
		var newwin = window
				.open(
						url,
						"NewWin",
						"toolbar=no,resizable=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,top=220,left=220,width=500,height=330");
		// newwin.focus();
		return false;
	}
	function opend(url) {
		var newwin = window
				.open(
						url,
						"NewWin",
						"toolbar=no,resizable=yes,location=no,directories=no,status=no,menubar=no,scrollbars=no,top=100,left=50,width=650,height=350");
		// newwin.focus();
		return false;
	}
</script>
<body leftmargin="0" topmargin="1">
	<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
	<%
		Connection con = jdbc_conn.getConn();
		Statement stmt = con.createStatement();
		String sql = "select * from comments order by id desc";
		ResultSet rs = stmt.executeQuery(sql);
		String pages = request.getParameter("page");
		int pageInt = 1, i = 1;
		if (pages == null) {
		} else {
			pageInt = Integer.parseInt(pages);
		}
		while (i < 20 * (pageInt - 1) && rs.next()) {
			i++;
		}
	%>
	<table width="775" border="0" align="center" cellpadding="0"
		cellspacing="1">
		<p>所有留言</p>
		<tr>
			<td>
				<table width="100%" border="0" cellpadding="2" cellspacing="1"
					bgcolor="ffffff">
					<tr>
						<td colspan="2" bgcolor="#E8FCE2">
							<div align="center">
								<table width="100%" border="0" cellpadding="1" cellspacing="1">
									<tr>
										<td><div align="center">
												<a href="#" onClick="return opend('comments_new.jsp')">添加留言</a>
											</div></td>
										<td><div align="center">
												<a href="/onlineOrder">返回主页</a>
											</div></td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
					<%
						i = 0;
						String str = "#E8FCE2", str1 = "";
						java.util.Random rd = new java.util.Random();
						while (rs.next() & i < 20) {
							i++;
							String email = rs.getString("email");
							String content = rs.getString("content");
							if (str.equals("#E8FCE2")) {
								str = "#D1E79E";
							} else {
								str = "#E8FCE2";
							}
					%>
					<tr>
						<td width="23%" bgcolor="<%=str%>">
							<div align="center"><%=rs.getString("sj")%></div>
						</td>
						<td width="77%" bgcolor="<%=str%>">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<div align="center">
											<a href="<%=rs.getString("url")%>"><img
												src="images/HOME.gif" alt="个人主页" width="16" height="16"
												border="0" align="absmiddle"></a>留言人主页
										</div>
									</td>
									<td>
										<div align="center">
											<img src="images/ip.gif" alt="<%=rs.getString("ip")%>"
												width="13" height="15" align="absmiddle">留言人IP
										</div>
									</td>
									<td>
										<div align="center">
											<a href="mailto:<%=email%>"><img src="images/EMAIL.gif"
												alt="<%=email%>" width="16" height="16" border="0"
												align="absmiddle"></a>留言人email
										</div>
									</td>
									<td>
										<div align="center">
											<img src="images/oicq.gif" alt="<%=rs.getString("qq")%>"
												width="16" height="16" align="absmiddle">留言人QQ
										</div>
									</td>
									<td><a href="comments_del.jsp?id=<%=rs.getString("id")%>">
											<div align="center">
												<img src="images/dele_1.gif" alt="删除" width="14" height="16"
													border="0" align="absmiddle">删除留言
											</div>
									</a></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="middle" bgcolor="<%=str%>"><img
							src="images/tx/<%=rd.nextInt(30) + 1%>.gif" width="100"
							height="100"><br> <br> 留言人：<%=rs.getString("xm")%>
						</td>
						<td bgcolor="#FFFFFF"><%=content%></td>
					</tr>
					<%
						}
					%>
					<tr bgcolor="#F9CDBB">
						<td>&nbsp;</td>
						<%
							sql = "select count(*) from comments";
							rs = stmt.executeQuery(sql);
							while (rs.next())
								i = rs.getInt(1);
						%>
						<td>
							<div align="right">
								总共有留言<%=i%>条/<%=(i + 19) / 20%>页，这是第<%=pageInt%>页，转到第
								<%
								for (int j = 1; j < (i + 40) / 20; j++) {
							%>
								<a href="ly.jsp?page=<%=j%>">^<%=j%>^
								</a>
								<%
									}
									try {
										rs.close();
										stmt.close();
										con.close();
									} catch (Exception ex) {
									}
								%>
								页
							</div>
						</td>
					</tr>
					<tr>
						<td bgcolor="<%=str%>">&nbsp;</td>
						<td bgcolor="<%=str%>">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
</body>
</html>