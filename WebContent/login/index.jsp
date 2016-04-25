<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统登录</title>
<link href="css/login.css" rel="stylesheet" rev="stylesheet"
	type="text/css" media="all" />
<link href="css/demo.css" rel="stylesheet" rev="stylesheet"
	type="text/css" media="all" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script>

<script>
	$(function() {
		// 选择行高亮
		$(".i-text").focus(function() {
			$(this).addClass('h-light');
		});

		$(".i-text").focusout(function() {
			$(this).removeClass('h-light');
		});
		// 输入提示
		$("#username").focus(function() {
			var username = $(this).val();
			if (username == '输入账号') {
				$(this).val('');
			}
		});
		// 输入提示
		$("#username").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入账号');
			}
		});
		// 输入提示
		$("#password").focus(function() {
			var username = $(this).val();
			if (username == '输入密码') {
				$(this).val('');
			}
		});
		// 输入提示
		$("#yzm").focus(function() {
			var username = $(this).val();
			if (username == '输入验证码') {
				$(this).val('');
			}
		});
		// 输入提示
		$("#yzm").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入验证码');
			}
		});
		// 输入提示
		$(".registerform").Validform({
			tiptype : function(msg, o, cssctl) {
				var objtip = $(".error-box");
				cssctl(objtip, o.type);
				objtip.text(msg);
			},
			ajaxPost : true
		});

	});

</script>


</head>

<body>


	<div class="header">
		<h1 class="headerLogo">
			<a title="后台管理系统" target="_blank" href="#"><img alt="logo"
				src="images/logo.gif"></a>
		</h1>
		<div class="headerNav">
			<a target="_blank" href="#">关于我们</a>
		</div>
	</div>

	<div class="banner">

		<div class="login-aside">
			<div id="o-box-up"></div>
			<div id="o-box-down" style="table-layout: fixed;">
				<div class="error-box"></div>

				<form class="registerform_" action="loginCheck.jsp">
					<div class="fm-item">
						<label for="logonId" class="form-label">自助订餐系统登陆：</label> <input
							type="text" value="" maxlength="100" id="username" name="user" class="i-text"
							ajaxurl="demo/valid.jsp" datatype="s4-18"
							errormsg="用户名至少4个字符,最多18个字符！">
							<div class="ui-form-explain"></div>
					</div>

					<div class="fm-item">
						<label for="logonId" class="form-label">登陆密码：</label> <input
							type="password" value="" maxlength="100" id="password" name="password"
							class="i-text" datatype="*4-16" nullmsg="请设置密码！"
							errormsg="密码范围在4~16位之间！">
							<div class="ui-form-explain"></div>
					</div>
					<div class="fm-item pos-r">
						<label for="logonId" class="form-label">验证码</label> <input
							type="text" value="" maxlength="100" id="yzm" class="i-text yzm"
							nullmsg="请输入验证码！" name="rand">
							<div class="ui-form-explain">
								<img src="../verfiy_code/gen_code.jsp" onerror="this.src='../images/code_default.jpg'" class="yzm-img" />
							</div>
					</div>

					<div class="fm-item">
						<label for="logonId" class="form-label"></label>
						<p>
							<a href="register.jsp">还没有账号？免费注册</a>
						</p>
						<input type="submit" value="" tabindex="4" id="send-btn"
							class="btn-login">
							<div class="ui-form-explain"></div>
					</div>

				</form>

			</div>

		</div>

		<div class="bd">
			<ul>
				<li
					style="background: url(themes/theme-pic1.jpg) #CCE1F3 center 0 no-repeat;"><a
					href="#"></a></li>
				<li
					style="background: url(themes/theme-pic2.jpg) #BCE0FF center 0 no-repeat;"><a
					href="#"></a></li>
			</ul>
		</div>

		<div class="hd">
			<ul></ul>
		</div>
	</div>
	<script type="text/javascript">
		jQuery(".banner").slide({
			titCell : ".hd ul",
			mainCell : ".bd ul",
			effect : "fold",
			autoPlay : true,
			autoPage : true,
			trigger : "click"
		});
	</script>


	<div class="banner-shadow"></div>

	<div class="footer">
		<p>Copyright 2015-2016, All Rights Reserved</p>
	</div>

	<div style="text-align: center;">
		<p style="display: none;">
			联系方式<a href="#" target="_blank"> </a>
		</p>
	</div>

</body>
</html>
