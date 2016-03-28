<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />

<%
	if (!misc.Util.loginCheck(session)) {
		response.sendRedirect("../login/index.jsp");
	}
%>

<%
	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312" />
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="all" />
<title>自助订餐系统主页</title>
</head>

<body id="body">
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
					<li><a href="../manager/index.jsp">系统管理</a></li>
					<li><a href="../liuyan/comments.jsp">查看留言</a></li>
					<li><a
						href="http://www.gahjxy.com/xxgk/show.aspx?id=14&cid=13">关于我们</a></li>
				</ul>
			</div>
			<div class="div-clear"></div>
		</div>
		<div id="main">

			<div class="content">
				<div id="list-all">
					<ul>
						<%
							int page_size = 10;
							String pages = request.getParameter("page");
							if (null == pages) {
								pages = "1";
							}
							System.out.println("pages:" + pages);

							ResultSet rs = stmt.executeQuery("select * from menu order by id desc");

							int i = 0, pageInt = Integer.parseInt(pages);
							int skip = page_size * (pageInt - 1);
							System.out.println(skip);
							while (i < skip && rs.next()) {
								String _id = rs.getString("id");
								System.out.println(_id);
								i++;
							}
							i = 0;
							while (rs.next() && i < page_size) {
								i++;
								String _id = rs.getString("id");
								String _name = rs.getString("name");
								String _thumb = rs.getString("thumb");
								String _price = rs.getString("price");
								String _details = rs.getString("details");
								System.out.println("name:" + _name + ",thumb:" + _thumb);
						%>
						<span>
						<li class="item">
							<div class="pic">
								<a title="" rel="nofollow" href="#" target="_blank"> <img
									class="item-img" src="../images/thumb/<%=_thumb%>"></img>
								</a>
							</div>
							<div class="txt">
								<div class="title">
									<strong>菜名:</strong><%=_name%></div>
								<div class="price">
									<strong>单价:</strong><%=_price%>元
								</div>
								<div class="details">
									<strong>描述:</strong><%=_details%></div>
								<div class="comments">
									<a href="../pingjia/index.jsp?menu_id=<%=_id%>">查看评价</a>
								</div>
								<div class="buy">
									<a href="../order_form/index.jsp?menu_id=<%=_id%>">下单</a>
								</div>
							</div>
							<div class="info"></div>
							<div class="div-clear"></div>
						</li>
						</span>
						<%
							}
						%>

						<div class="skip" align="right">
							第<%=pageInt%>页，转到第
							<%
							rs.last();
							int rowCount = rs.getRow();
							System.out.println("rowCount:" + rowCount + ",page_size:" + page_size);
							int j = 1;
							for (j = 1; j <= (rowCount + page_size) / page_size; j++) {
						%>
							<a href="index.jsp?page=<%=j%>"><%=j%></a>
							<%
								}
							%>页
						</div>
					</ul>
				</div>
			</div>
			<div class="sidebar">
				<div id="gwc">
				</div>
				<div id="new">
					<div id="title">
						<span><strong>新闻信息</strong></span>
					</div>
					<div id="new-content">
						<ul>
							<%
								rs = stmt.executeQuery("select * from news order by id desc");

								int news_max_size = 10;
								int title_max_len = 7;
								for (i = 0; rs.next() && i < news_max_size; i++) {
									String _id = rs.getString("id");
									String _title = rs.getString("title");
									if (_title.length() > title_max_len) {
										_title = _title.substring(0, title_max_len) + "...";
									}
							%>
							<li><a href="../news/index.jsp?id=<%=_id%>"><%=_title%></a></li>
							<%
								}
							%>
						</ul>
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
</body>
</html>
