<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>���ڹ�������ѧԺ��������������ϵͳ</title>
<meta name="keywords" content="���ڹ�������ѧԺ��������������ϵͳ" />
<meta name="description" content="���ڹ�������ѧԺ��������������ϵͳ" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="images/login.js"></script>
	<link href="css/login2.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<h1>
		���ڹ�������ѧԺ��������������ϵͳ<sup>V2016</sup>
	</h1>

	<div class="login" style="margin-top: 50px;">

		<div class="header">
			<div class="switch" id="switch">
				<a class="switch_btn_focus" id="switch_qlogin"
					href="javascript:void(0);" tabindex="7">���ٵ�¼</a> <a
					class="switch_btn" id="switch_login" href="javascript:void(0);"
					tabindex="8">����ע��</a>
				<div class="switch_bottom" id="switch_bottom"
					style="position: absolute; width: 64px; left: 0px;"></div>
			</div>
		</div>
		<div class="web_qr_login" id="web_qr_login"
			style="display: block; height: 235px;">
			<!--��¼-->
			<div class="web_login" id="web_login">
				<div class="login-box">
					<div class="login_form">
						<form action="loginCheck.jsp" name="loginform"
							accept-charset="utf-8" id="login_form" class="loginForm"
							method="post">
							<input type="hidden" name="did" value="0" /> <input
								type="hidden" name="to" value="log" />
							<div class="uinArea" id="uinArea">
								<label class="input-tips" for="u">�ʺţ�</label>
								<div class="inputOuter" id="uArea">
									<input type="text" id="u" name="user" class="inputstyle" />
								</div>
							</div>
							<div class="pwdArea" id="pwdArea">
								<label class="input-tips" for="p">���룺</label>
								<div class="inputOuter" id="pArea">
									<input type="password" id="p" name="password"
										class="inputstyle" />
								</div>
							</div>
							<div style="padding-left: 50px; margin-top: 20px;">
								<input type="submit" value="�� ¼" style="width: 150px;"
									class="button_blue" />
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--��¼end-->
		</div>

		<!--ע��-->
		<div class="qlogin" id="qlogin" style="display: none;">

			<div class="web_login">
				<form name="form2" id="regUser" accept-charset="utf-8"
					action="regUser.jsp" method="post">
					<input type="hidden" name="to" value="reg" /> <input type="hidden"
						name="did" value="0" />
					<ul class="reg_form" id="reg-ul">
						<div id="userCue" class="cue">����ע����ע���ʽ</div>
						<li><label for="user" class="input-tips2">�û�����</label>
							<div class="inputOuter2">
								<input type="text" id="user" name="user" maxlength="16"
									class="inputstyle2" />
							</div></li>
						<li><label for="passwd" class="input-tips2">���룺</label>
							<div class="inputOuter2">
								<input type="password" id="passwd" name="password"
									maxlength="16" class="inputstyle2" />
							</div></li>
						<li><label for="passwd2" class="input-tips2">ȷ�����룺</label>
							<div class="inputOuter2">
								<input type="password" id="passwd2" name="" maxlength="16"
									class="inputstyle2" />
							</div></li>
						<li>
							<div class="inputArea">
								<input type="button" id="reg"
									style="margin-top: 10px; margin-left: 85px;"
									class="button_blue" value="ͬ��Э�鲢ע��" /> <a href="#"
									class="zcxy" target="_blank">ע��Э��</a>
							</div>
						</li>
						<div class="cl"></div>
					</ul>
				</form>
			</div>
		</div>
		<!--ע��end-->
	</div>
	<div class="jianyi">*�Ƽ�ʹ��ie8�����ϰ汾ie�������Chrome�ں���������ʱ�վ</div>
</body>
</html>