<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<form action="../servlet/UploadServlet" name="f1" id="f1" method="post"
	enctype="multipart/form-data" target="if">
	<input type="file" name="file1" /><br>
	<input type="button" name="but1" value="�ϴ�logo" onclick="go()" />
</form>
<br>
<div id="pro" class="pro" align="left" style="display: none">
	<img alt="" src="../images/progress.png" width="10" height="2" id="imgpro">
</div>
<span id="prop" style="width: 15px; height: 15px; display: none;" style="display: none">0%</span>
<iframe id="if" name="if" src="" style="display: none"></iframe>

<form action="../ajax">
	ͼƬ<input type="text" name="menu_image" value="���ϴ�" readonly/></br>
	����<input type="text" name="menu_name" /></br>
	 ���<input type="text" name="menu_type" /></br>
	 �����<input type="text" name="menu_subtype" /></br>
	 �۸�<input type="text" name="menu_price" /></br>
	 ����</br>
	<textarea id="" cols="50" rows="10" name="menu_detail"></textarea> </br>
	<input type="button" value="�ύ" onclick="ajax_submit_newmenu()"/>
</form>