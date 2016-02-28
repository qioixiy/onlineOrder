<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312" />
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="all" />
<title>自助订餐系统主页</title>
</head>
<body>
	<div id="container">
		<div id="header">
			<div id="menu">
				<ul>
					<li><a href="../index.jsp">首页</a></li>
					<li><a href="#">系统管理</a></li>
					<li><a href="#">发布新闻、信息</a></li>
					<li><a href="#">关于我们</a></li>
				</ul>
			</div>
			<h1 style="border: 0px; margin-top: 50px; text-align: center">自助订餐系统</h1>
		</div>
		<div id="main">
			<div class="cat"></div>
			<div class="content">
				<div id="shop-all-list">
					<ul>
						<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
						<%
							Connection con = jdbc_conn.getConn();
							Statement stmt = con.createStatement();
							String sql = "select * from menu order by id desc";
							ResultSet rs = stmt.executeQuery(sql);
							String pages = request.getParameter("page");
							int pageInt = 1, i = 1;
							if (pages == null) {
							} else {
								pageInt = Integer.parseInt(pages);
							}
							while (i < 5 * (pageInt - 1) && rs.next()) {
								i++;
							}
						%>
						<%
							i = 0;
							while (rs.next() & i < 5) {
								i++;
								String _name = rs.getString("name");
								String _thumb = rs.getString("thumb");
						%>
						<li class="item">
							<div class="pic">
								<a title="" rel="nofollow" href="/" target="_blank"> <img
									src="../image/<%=_thumb%>" width="150"></img>
								</a>
							</div>
							<div class="txt">
								<div class="title"><%=_name%></div>
								<div class="comment"><%=_thumb%></div>
							</div>
							<div class="info"></div>
							<div class="div-clear"></div>
						</li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</div>
		<div id="footer"></div>
	</div>
</body>
</html>
