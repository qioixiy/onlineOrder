<%@page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />

<%
	if (!misc.Util.loginCheck(session)) {
		response.sendRedirect("../login/index.jsp");
	}
	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();

	String search = request.getParameter("search");
	if (null != search) {
		search = new String(search.getBytes("ISO-8859-1"), "gb2312");
	}
	System.out.println("search:" + search);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312" />
<!-- HTTP 1.1 -->
<meta http-equiv="pragma" content="no-cache">
	<!-- HTTP 1.0 -->
	<meta http-equiv="cache-control" content="no-cache">
		<!-- Prevent caching at the proxy server -->
		<meta http-equiv="expires" content="0">
			<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />
			<link href="../css/main.css" rel="stylesheet" type="text/css"
				media="all" />
			<title>��������ϵͳ��ҳ</title> <script type="text/javascript"
				src="../js/ajax_get_url.js"></script>
</head>

<body>
	<div id="container">
		<div id="header">
			<div class="login_status">
				<%
					String username = (String) session.getAttribute("username");
					String status = "���¼";
					if (username != null) {
						status = "��ӭ��" + session.getAttribute("username");
					}
				%>
				<p>
					<%=status%></p>
			</div>

			<div id="menu">
				<ul>
					<li><a href="../index.jsp">��ҳ</a></li>
					<%
						String user_type = "user";
						{
							Statement stmt_manager = con.createStatement();
							String sql = "select * from manager where `username`='" + username + "'";
							System.out.println(sql);
							ResultSet rs = stmt.executeQuery(sql);
							if (rs.next()) {
								System.out.println("you are manager");
								user_type = "manager";
							} else {
								;
							}
						}
						String tt = null;
						String tt_href = null;
						if (user_type.equals("manager")) {
							tt = "ϵͳ����";
							tt_href = "../manager/index.jsp";
						} else if (user_type.equals("user")) {
							tt = "�ҵ���Ϣ";
							tt_href = "user_info.jsp";
						}
					%>
					<li><a href="<%=tt_href%>"><%=tt%></a></li>
					<li><a href="../liuyan/index.jsp">�鿴����</a></li>
					<li><a href="../login/index.jsp">�˳�</a></li>
				</ul>
			</div>

			<div class="div-clear"></div>
			<form action="index.jsp" id="form_search" name="search" method="post">
				<div id="search-box">
					<input id="input_search" type="text" class="input-box" /> <input
						name="search" type="button" value="����" class="button"
						onclick="main_search()" />
				</div>
			</form>
			<div class="div-clear"></div>
		</div>
		<div id="main">
			<div class="content">
				<div class="navi">
					<div id="navi-menu">
						<ul>
							<li><a href="index.jsp?search=all">ȫ������</a></li>
							<li><a href="index.jsp?search=jiachangcai">�ҳ���</a></li>
							<li><a href="index.jsp?search=huncai">���</a></li>
							<li><a href="index.jsp?search=sucai">�ز�</a></li>
						</ul>
					</div>
				</div>
				<div class="list-all">
					<ul>
						<%
							int page_size = 5;
							String pages = request.getParameter("page");
							if (null == pages) {
								pages = "1";
							}
							System.out.println("pages:" + pages);

							ResultSet rs = null;
							String filter = null;
							String sql = "select * from menu order by id desc";
							if (search != null && (!search.equals("null")) && (!search.equals("all"))) {
								if (search.equals("sucai")) {
									filter = "�ز�";
								} else if (search.equals("huncai")) {
									filter = "���";
								}
								if (null != filter) {
									sql = "select * from menu where style='" + filter + "'";
								} else {
									sql = "select * from menu where `name` like '%" + search + "%'";
								}
								if (search.equals("jiachangcai")) {
									String f = "�ҳ���";
									sql = "select * from menu where style2='" + f + "'";
								}
							}
							System.out.println(sql);
							rs = stmt.executeQuery(sql);

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
								String style = rs.getString("style");
								String style2 = rs.getString("style2");
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
										<strong>����:</strong><%=_name%></div>
									<div class="price">
										<strong>����:</strong><%=_price%>Ԫ
									</div>
									<div class="details">
										<strong>����:</strong><%=_details%></div>
									<div class="comments">
										<a href="../pingjia/index.jsp?menu_id=<%=_id%>">�鿴����</a>
									</div>
									<div class="buy">
										<a href="../order_form/index.jsp?menu_id=<%=_id%>">�µ�</a>
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
							��<%=pageInt%>ҳ��ת����
							<%
							rs.last();
							int rowCount = rs.getRow();
							System.out.println("rowCount:" + rowCount + ",page_size:" + page_size);
							int j = 1;
							for (j = 1; j <= (rowCount + page_size - 1) / page_size; j++) {
						%>
							<a href="index.jsp?search=<%=search%>&page=<%=j%>"><%=j%></a>
							<%
								}
							%>ҳ
						</div>
					</ul>
				</div>
			</div>
			<div class="sidebar">
				<div id="gouwuche"></div>
				<div id="new">
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
		<div id="footer">
			<p>��ַ���㽭ʡ�����б�����������·205��&nbsp;&nbsp;�ܻ���0574-86155210</p>
			<p>CopyRight&nbsp;&nbsp;��������ѧԺ��Ϣ���� 2016</p>
		</div>
	</div>
</body>
</html>
