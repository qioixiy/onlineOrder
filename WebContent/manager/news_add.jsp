<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<form action="../ajax">
	 主题内容<input type="text" name="title" /></br>
	 详细内容</br>
	<textarea id="" cols="100" rows="15" name="data"></textarea> </br>
	<input type="button" value="提交" onclick="ajax_add_news()"/>
</form>