<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<form action="../ajax">
	 ��������<input type="text" name="title" /></br>
	 ��ϸ����</br>
	<textarea id="" cols="100" rows="15" name="data"></textarea> </br>
	<input type="button" value="�ύ" onclick="ajax_add_news()"/>
</form>