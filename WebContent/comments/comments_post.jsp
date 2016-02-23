<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="wu" scope="page" class="comments.jdbc" />
<%
	Connection con = wu.getConn();
	Statement stmt = con.createStatement();
	String content = request.getParameter("content");
	content = wu.ex_chinese(content);
	String qq = request.getParameter("qq");
	qq = wu.ex_chinese(qq);
	String email = request.getParameter("email");
	email = wu.ex_chinese(email);
	String url = request.getParameter("url");
	url = wu.ex_chinese(url);
	String xm = request.getParameter("yhm");
	xm = wu.ex_chinese(xm);
	String msg = "您在留言成功。";
	String sql = "insert into liuyan(url,ip,email,qq,sj,content,xm) values('" + url + "','"
			+ request.getRemoteHost() + "','" + email + "','" + qq + "','" + wu.gettime() + "','" + content
			+ "','" + xm + "')";
	stmt.executeUpdate(sql);
	try {
		stmt.close();
		con.close();
	} catch (Exception ex) {

	}
%>
<body>
	<p>&nbsp;</p>
	<table border="1" align="center" cellspacing="0"
		bordercolorlight="000000" bordercolordark="FFFFFF" bgcolor="E0E0E0">
		<tr>
			<td>
				<table border="0" bgcolor="#0066CC" cellspacing="0" cellpadding="2"
					width="100%">
					<tr>
						<td width="342"><font color="FFFFFF">¤<%=msg%></font></td>
						<td width="18">&nbsp;</td>
					</tr>
				</table>
				<table border="0" width="100%" cellpadding="4">
					<tr>
						<td width="59" align="center" valign="top"><font
							face="Wingdings" color="#FF0000" style="font-size: 32pt">L</font></td>
						<td width="269">
							<p><%=msg%></p>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" valign="top"><input
							type="button" name="ok" value="关闭窗口" onclick="window.close()">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<script language="javascript">
			opener.location = opener.location;
			window.close();
		</script>
	</table>
</body>
</html>