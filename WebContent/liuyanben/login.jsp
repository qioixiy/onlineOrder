<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/web.css" rel="stylesheet" type="text/css">
</head>

<body>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<table width="300" border="0" align="center" cellpadding="2"
		cellspacing="1" bgcolor="#000066">
		<tr>
			<td height="25">
				<div align="center">
					<font color="#FFFFFF"><strong>请先登陆</strong></font>
				</div>
			</td>
		</tr>
		<tr>
			<td bgcolor="#FFFFFF">
				<form name="form1" method="post" action="login_in.jsp">
					<table width="100%" border="0">
						<tr>
							<td>
								<div align="right">用户名：</div>
							</td>
							<td><input name="yhm" type="text" id="yhm"></td>
						</tr>
						<tr>
							<td>
								<div align="right">密&nbsp;&nbsp;码：</div>
							</td>
							<td><input name="yhmm" type="password" id="yhmm" value=""></td>
						</tr>
						<tr>
							<td>
								<div align="right"></div>
							</td>
							<td><input type="submit" name="Submit" value="登陆">
								&nbsp;&nbsp;&nbsp; <input type="reset" name="Submit2" value="取消"></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
