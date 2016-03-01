<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
<head>
<title>留言本</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/web.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#E8FCE2" background="images/background-line.gif">
	<form name="form1" method="post" action="comments_post.jsp">
		<table width="498" border="0" align="center">
			<tr>
				<td valign="top"><div align="center">留言人：</div></td>
				<td><input name="yhm" type="text" id="yhm"></td>
				<td><img src="images/icon_group.gif" width="15" height="15"></td>
			</tr>
			<tr>
				<td valign="middle">
					<div align="center">内容:</div>
				</td>
				<td><textarea name="content" cols="55" rows="6" id="content"></textarea></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td valign="top"><div align="center">留言人主页：</div></td>
				<td><input name="url" type="text" id="url" size="40"></td>
				<td><img src="images/HOME.gif" width="16" height="16"></td>
			</tr>
			<tr>
				<td valign="top"><div align="center">留言人QQ：</div></td>
				<td><input name="qq" type="text" id="qq"></td>
				<td><img src="images/oicq.gif" width="16" height="16"></td>
			</tr>
			<tr>
				<td valign="top"><div align="center">留言人email</div></td>
				<td><input name="email" type="text" id="email"></td>
				<td><img src="images/EMAIL.gif" width="16" height="16"></td>
			</tr>
		</table>
		<p align="center">
			<input type="submit" name="Submit" value="提交"> &nbsp;&nbsp; <input
				type="button" name="Submit2" value="关闭" onClick="window.close()">
		</p>
	</form>
</body>
</html>
