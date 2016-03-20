<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312" />
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="all" />
<title>��������ϵͳ��ҳ</title>
</head>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />
<%
	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
%>
<body>
	<div id="container">
		<div id="header">
			<div class="login_status">
				<%
					String status = (String)session.getAttribute("username");
					if (status == null) {
						status = "���¼";
					} else {
						status = "��ӭ��" + session.getAttribute("username");
					}
				%>
				<p> <%=status%></p>
			</div>

			<div id="menu">
				<ul>
					<li><a href="../index.jsp">��ҳ</a></li>
					<li><a href="../manager/index.jsp">ϵͳ����</a></li>
					<li><a href="../liuyan/comments.jsp">�鿴����</a></li>
					<li><a href="http://www.gahjxy.com/xxgk/show.aspx?id=14&cid=13">��������</a></li>
				</ul>
			</div>
			<div class="div-clear"></div>
			<div id="title">
				<h1>��������ϵͳ</h1>
			</div>
		</div>
		<div id="main">
			<div class="cat"></div>
			<div class="content">
				<div id="shop-all-list">
					<ul>
						<%
							int page_size = 5;
							String pages = request.getParameter("page");
							if (null == pages) {
								pages="1";
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
						%>

						<%
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
						<li class="item">
							<div class="pic">
								<a title="" rel="nofollow" href="#" target="_blank">
									<img src="../images/thumb/<%=_thumb%>" width="150" height=120></img>
								</a>
							</div>
							<div class="txt">
								<div class="title">����:<%=_name%></div>
								<div class="price">����:<%=_price%>Ԫ</div>
								<div class="details">����:<%=_details%></div>
								<div class="comments"><a href="../pingjia/index.jsp?menu_id=<%=_id%>">�鿴����</a></div>
								<div class="buy"><a href="../order_form/index.jsp?menu_id=<%=_id%>">�µ�</a></div>
							</div>
							<div class="info"></div>
							<div class="div-clear"></div>
						</li>
						<%
							}
						%>

						<div class="skip" align="right">
							��<%=pageInt%>ҳ��ת����
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
							%>ҳ
						</div>
					</ul>
				</div>
			</div>
			<div class="sidebar">
				<div class="new">
					<div id="title">
						<span><strong>������Ϣ</strong></span>
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
		<div id="footer"></div>
	</div>
</body>
</html>
