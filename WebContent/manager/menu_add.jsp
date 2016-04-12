<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<form action="../servlet/UploadServlet" name="f1" id="f1" method="post"
	enctype="multipart/form-data" target="if">
	<input type="file" name="file1" /><br>
	<input type="button" name="but1" value="上传logo" onclick="go()" />
</form>
<br>
<div id="pro" class="pro" align="left" style="display: none">
	<img alt="" src="../images/progress.png" width="10" height="2" id="imgpro">
</div>
<span id="prop" style="width: 15px; height: 15px; display: none;" style="display: none">0%</span>
<iframe id="if" name="if" src="" style="display: none"></iframe>

<form action="../ajax">
	图片<input type="text" name="menu_image" value="请上传" readonly/></br>
	名字<input type="text" name="menu_name" /></br>
	 类别<input type="text" name="menu_type" /></br>
	 子类别<input type="text" name="menu_subtype" /></br>
	 价格<input type="text" name="menu_price" /></br>
	 描述</br>
	<textarea id="" cols="50" rows="10" name="menu_detail"></textarea> </br>
	<input type="button" value="提交" onclick="ajax_submit_newmenu()"/>
</form>