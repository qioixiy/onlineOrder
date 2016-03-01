<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<html>
<head>
<title>留言本</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" background="images/background-line.gif">
	<form name="form1" method="post" action="comments_post.jsp">
		<table align="center">
			<tr>
				<td valign="top"><div align="center">留言人：</div></td>
				<td><input name="yhm" type="text" id="yhm"></td>
			</tr>
			<tr>
				<td valign="middle">
					<div align="center">内容:</div>
				</td>
				<td><textarea name="content" cols="50" rows="6" id="content"></textarea></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td valign="top"><div align="center">主页：</div></td>
				<td><input name="url" type="text" id="url" size="40"></td>
			</tr>
			<tr>
				<td valign="top"><div align="center">QQ：</div></td>
				<td><input name="qq" type="text" id="qq"></td>
			</tr>
			<tr>
				<td valign="top"><div align="center">email</div></td>
				<td><input name="email" type="text" id="email"></td>
			</tr>
		</table>
		<p align="center">
			<input type="submit" name="Submit" value="提交">
			<input type="button" name="Submit2" value="关闭" onClick="window.close()">
		</p>
	</form>
</body>
</html>
