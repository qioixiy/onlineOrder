<%@page import="java.sql.*" import="java.util.*"
	import="java.security.MessageDigest"
	contentType="text/html;charset=gb2312"%>

<jsp:useBean id="jdbc_conn" scope="page" class="db.jdbc" />

<%
	String username = new String(request.getParameter("user"));
	String password = new String(request.getParameter("password"));

	Connection con = jdbc_conn.getConn();
	Statement stmt = con.createStatement();
	String sql = "select * from  userinfo where user='" + username + "';";
	ResultSet rs = stmt.executeQuery(sql);

	String redirect = "";
	if (rs.next()) {
		String db_password = new String(rs.getString("password"));
		String encrypt = new String(rs.getString("encrypt"));
		
		// get real password
		if (encrypt.equals("1")) {
			final char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D',
					'E', 'F' };

			try {
				byte[] btInput = password.getBytes();
				// ���MD5ժҪ�㷨�� MessageDigest ����
				MessageDigest mdInst = MessageDigest.getInstance("MD5");
				// ʹ��ָ�����ֽڸ���ժҪ
				mdInst.update(btInput);
				// �������
				byte[] md = mdInst.digest();
				// ������ת����ʮ�����Ƶ��ַ�����ʽ
				int j = md.length;
				char str[] = new char[j * 2];
				int k = 0;
				for (int i = 0; i < j; i++) {
					byte byte0 = md[i];
					str[k++] = hexDigits[byte0 >>> 4 & 0xf];
					str[k++] = hexDigits[byte0 & 0xf];
				}
				password = new String(str);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// check password
		if (db_password.equals(password)) {
			System.out.println(username + " login");
			session.setAttribute("username", username);
			redirect = "loginSuccess.jsp";
		}

		// verfiy code
		String rand = (String) session.getAttribute("rand");
		String input = request.getParameter("rand");
		System.out.println(rand + ":" + input);
		if (!rand.equals(input)) {
			redirect="Error.jsp";
			System.out.println("verfiy code Error");
		}
		System.out.println(redirect);
		if (redirect.equals("")) {
			redirect="index.jsp";
		}
	}
	response.sendRedirect(redirect);
%>