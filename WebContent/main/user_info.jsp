<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />

<%
	if (!misc.Util.loginCheck(session)) {
		response.sendRedirect("../login/index.jsp");
	}
	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
	String user = (String) session.getAttribute("username");
	String _id = "";
	String _user = "";
	String _xuehao = "";
	String _email = "";
	String _timestamp = "";
	if (user != null) {
		String sql = "select * from userinfo where user=" + "'" + user + "'";
		System.out.println(sql);
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			System.out.println("find userinfo with " + user);
			_id = rs.getString("id");
			_user = rs.getString("user");
			_xuehao = rs.getString("xuehao");
			_email = rs.getString("email");
			_timestamp = rs.getString("timestamp");
		}
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312" />
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="../js/ajax_api.js"></script>
<title>个人信息</title>
</head>

<body>
	<div id="container">
		<div id="header">
			<div class="login_status">
				<%
					String username = (String) session.getAttribute("username");
					String status = "请登录";
					if (username != null) {
						status = "欢迎你" + session.getAttribute("username");
					}
				%>
				<p>
					<%=status%></p>
			</div>

			<div id="menu">
				<ul>
					<li><a href="../index.jsp">首页</a></li>
					<li><a href="index.jsp">返回主页</a></li>
					<li><a href="../login/index.jsp">退出</a></li>
				</ul>
			</div>

			<div class="div-clear"></div>
		</div>
		<div id="main">
			<div style="padding: 10px; background-color: #ddd;">
				<div
					style="float: left; width: 50%; min-height: 300px; background-color: #eee; padding: 10px;">
					<h2>我的信息</h2>
					<a href="javascript:void(0)" onclick="userInfoEdit(this)">编辑</a>
					<div id="d1" style="background-color: #edd; padding: 10px;">
						<p id="user-id" name=<%=_id%>></p>
						<table>
							<tr>
								<td><strong> 用户名</strong></td>
								<td><%=_user%></td>
							</tr>
							<tr>
								<td><strong>学号</strong></td>
								<td><%=_xuehao%></td>
							</tr>
							<tr>
								<td><strong>邮箱</strong></td>
								<td><%=_email%></td>
							</tr>
							<tr>
								<td><strong>注册时间</strong></td>
								<td><%=_timestamp%></td>
							</tr>
						</table>
					</div>
					<div id="d2" style="display: none">
						<form action="menu_manager_op_result.jsp">
							<p>
								用户<input type="text" name="user" value="<%=_user%>" />
							</p>
							<p>
								学号<input type="text" name="xuehao" value="<%=_xuehao%>" />
							</p>
							<p>
								邮箱<input type="text" name="email" value="<%=_email%>" />
							</p>
							<input type="button" value="提交修改"
								onclick="ajax_update_userinfo()" /><a href="javascript:void(0)"
								onclick="userInfoCancelEdit(this)">取消编辑</a>
						</form>
					</div>
				</div>
				<div
					style="min-height: 300px; background-color: #aee; padding: 10px;">
					<h2>我的订单</h2>
					<div
						style="background-color: #edd; padding: 10px; border: 1px solid #ccc;">
						<table>
							<tr>
								<td>订单</td>
								<td>下单时间</td>
								<td>菜名</td>
								<td>份数</td>
								<td>餐盘号</td>
							</tr>
							<%
								String sql = "select * from order_form where user_id=" + "'" + _id + "'";
								System.out.println(sql);
								ResultSet rs = stmt.executeQuery(sql);
								int index = 0;
								while (rs.next()) {
									String timestamp, menu_id, repeat, dish_id;
									timestamp = rs.getString("timestamp");
									menu_id = rs.getString("menu_id");
									repeat = rs.getString("repeat");
									dish_id = rs.getString("dish_id");
									index++;
							%>
							<tr>
								<td><%=index%></td>
								<td><%=timestamp%></td>
								<td><%=menu_id%></td>
								<td><%=repeat%></td>
								<td><%=dish_id%></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="div-clear"></div>
		<div id="footer">
			<p>地址：浙江省宁波市北仑区振兴西路205号&nbsp;&nbsp;总机：0574-86155210</p>
			<p>CopyRight&nbsp;&nbsp;公安海警学院信息公开 2016</p>
		</div>
	</div>
	<script type="text/javascript">
		function userInfoEdit() {
			document.getElementById("d1").style.display = "none";
			document.getElementById("d2").style.display = "block";
		}
		function userInfoCancelEdit() {
			document.getElementById("d2").style.display = "none";
			document.getElementById("d1").style.display = "block";
		}
	</script>
</body>
</html>
