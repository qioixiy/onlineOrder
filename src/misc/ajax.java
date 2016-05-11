package misc;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.jdbc;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ajax
 */
@WebServlet("/ajax")
public class ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ajax() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	// ʵ��ajax�û����½ӿ�
	private void UpdateUserinfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user = request.getParameter("user");
		String xuehao = request.getParameter("xuehao");
		String email = request.getParameter("email");

		jdbc jdbc_conn = new jdbc();
		Connection con = jdbc_conn.getConn();
		Statement smt;
		int ret = 0;
		try {
			smt = con.createStatement();
			String sql = "UPDATE `userinfo` SET `email` = '" + email + "', `xuehao`='" + xuehao
					+ "' WHERE `userinfo`.`user` ='" + user + "'";
			System.out.println(sql);
			ret = smt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		PrintWriter out = response.getWriter();
		out.print(ret);
		out.flush();
	}

	// ����µĲ˵�ajaxʵ��
	private void SubmitNewMenu(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int ret = 1;
		jdbc jdbc_conn = new jdbc();
		Connection con = jdbc_conn.getConn();

		String menu_image = request.getParameter("menu_image");
		String menu_name = request.getParameter("menu_name");
		String menu_type = request.getParameter("menu_type");
		String menu_subtype = request.getParameter("menu_subtype");
		String menu_price = request.getParameter("menu_price");
		String menu_detail = request.getParameter("menu_detail");

		menu_image = CharCodeTrans(menu_image, "ISO-8859-1", "UTF-8");
		menu_name = CharCodeTrans(menu_name, "ISO-8859-1", "UTF-8");
		menu_type = CharCodeTrans(menu_type, "ISO-8859-1", "UTF-8");
		menu_subtype = CharCodeTrans(menu_subtype, "ISO-8859-1", "UTF-8");
		menu_detail = CharCodeTrans(menu_detail, "ISO-8859-1", "UTF-8");

		System.out.println("menu_image:" + menu_image + "menu_name:" + menu_name + "menu_type:" + menu_type
				+ "menu_subtype:" + menu_subtype + "menu_price:" + menu_price + "menu_detail:" + menu_detail);

		String sql = null;
		if (menu_name == null || menu_type == null || menu_price == null || menu_detail == null) {
			System.out.println("invalid data");
		} else {
			Statement menu_smt;
			try {
				menu_smt = con.createStatement();
				sql = "INSERT INTO `menu` ( `id` , `name` , `style`, `style2`, `price`, `thumb`, `timestamp`, `details`)"
						+ "VALUES (NULL," + "'" + menu_name + "'" + "," + "'" + menu_type + "'" + "," + "'" + menu_type
						+ "'" + "," + "'" + menu_price + "'" + "," + "'" + menu_image + "'," + "NULL," + "'"
						+ menu_detail + "'" + ")";
				System.out.println(sql);
				menu_smt.execute(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				ret = 0;
			}
		}
		PrintWriter out = response.getWriter();
		out.print(ret);
		out.flush();
	}
	
	//����µ�new ajaxʵ��
	private void AddNews(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int ret = 1;
		jdbc jdbc_conn = new jdbc();
		Connection con = jdbc_conn.getConn();

		String title = request.getParameter("title");
		String data = request.getParameter("data");

		title = CharCodeTrans(title, "ISO-8859-1", "UTF-8");
		data = CharCodeTrans(data, "ISO-8859-1", "UTF-8");

		System.out.println("title:" + title + "data:" + data);

		String sql = null;
		if (title == null || title.equals("") || data == null || data.equals("")) {
			System.out.println("invalid data");
			ret = 0;
		} else {
			Statement menu_smt;
			try {
				menu_smt = con.createStatement();
				sql = "INSERT INTO `news` ( `id` , `title` , `date`, `data`)"
						+ "VALUES (NULL,'" + title + "',NULL,'" + data + "')";
				System.out.println(sql);
				menu_smt.execute(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				ret = 0;
			}
		}
		PrintWriter out = response.getWriter();
		out.print(ret);
		out.flush();
	}
	
	// ����û�ajax ʵ��
	private void UserAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int ret = 1;
		jdbc jdbc_conn = new jdbc();
		Connection con = jdbc_conn.getConn();

		String user_name = request.getParameter("user_name");
		String user_password = request.getParameter("user_password");

		user_name = CharCodeTrans(user_name, "ISO-8859-1", "UTF-8");
		user_password = CharCodeTrans(user_password, "ISO-8859-1", "UTF-8");

		System.out.println("user_name:" + user_name + "user_password:" + user_password);

		String sql = null;
		if (user_name == null || user_name.equals("") || user_password == null || user_password.equals("")) {
			System.out.println("invalid data");
			ret = 0;
		} else {
			Statement menu_smt;
			try {
				menu_smt = con.createStatement();
				user_password = misc.Util.MD5(user_password);
				sql = "INSERT INTO `userinfo` (`id`,`user`,`xuehao`,`email`,`timestamp`,`encrypt`,`password`)" +
					"VALUES (NULL , '" + user_name + "', '000000000000', 'a@b.c', CURRENT_TIMESTAMP , '1', '" + user_password + "')";


				System.out.println(sql);
				menu_smt.execute(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				ret = 0;
			}
		}
		PrintWriter out = response.getWriter();
		out.print(ret);
		out.flush();
	}
	
	/* �����ﳵ���� */
	private void SubmitCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		int ret = 1;
		String data = request.getParameter("data");
		System.out.println("data:" + data);
		
		String username = (String) request.getSession().getAttribute("username");
		if (username == null) {
			return;
		}
		//*
		System.out.println("username:" + username);
		db.jdbc jdbc_conn = new db.jdbc();
		Connection con = jdbc_conn.getConn();
		
		Statement stmt;
		try {
			stmt = con.createStatement();
			
			//user info
			String user_id = null;
			String user_email = null;
			ResultSet rs_userinfo = stmt.executeQuery("select * from userinfo where user=" + "'" + username + "'");
			if (rs_userinfo.next()) {
				user_id = rs_userinfo.getString("id");
				user_email = rs_userinfo.getString("email");
				System.out.println("username:" + username + ",user_id:" + user_id + ",email:" + user_email);
			} else {
				response.sendRedirect("../login/index.jsp");
				return;
			}
			
			JSONObject mJSONObject = JSONObject.fromObject(data);
			JSONArray mJSONArray_Data = mJSONObject.getJSONArray("data");
			System.out.println(mJSONArray_Data.toString());
			String email_data = null;
			for ( int i = 0; i < mJSONArray_Data.size(); i++)
			{
				JSONObject __JSONObject = mJSONArray_Data.getJSONObject(i);
				String menu_id = __JSONObject.getString("menu_id");
				String num = __JSONObject.getString("repeat");;
				String sql = "INSERT INTO `order_form` ( `id` , `user_id` , `menu_id` , `repeat` , `spec` ) VALUES (NULL , '"
						+ user_id + "', '" + menu_id + "', '" + num + "', 'null')";
				System.out.println("sql:"+sql);
				stmt.execute(sql);
				
				// make email data
				ResultSet rs_menu = stmt.executeQuery("select * from menu where id=" + menu_id);
				if (rs_menu.next()) {
					String name = rs_menu.getString("name");
					String thumb = rs_menu.getString("thumb");
					String price = rs_menu.getString("price");
					if (email_data == null) {
						email_data = "����:" + name + ",����:" + num + "��,����:" + price + "Ԫ<br>";
					} else {
						email_data += "����:" + name + ",����:" + num + "��,����:" + price + "Ԫ<br>";
					}
				} else {
					System.out.println("can not find menu_id");
				}
			}
			
			// send success email

			String mailTitle = "���ύ�µĶ���";
			String mailContent = email_data;
			try {
				SendMail.sendMailWithDefaultServer(user_email, mailTitle, mailContent);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PrintWriter out = response.getWriter();
		out.print(ret);
		out.flush();
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served
		// at:").append(request.getContextPath());

		String func = request.getParameter("func");
		System.out.println("func:" + func);

		if (func != null) {
			switch (func) {
			case "update_userinfo":
				UpdateUserinfo(request, response);
				break;
			case "submit_newmenu":
				SubmitNewMenu(request, response);
				break;
			case "add_news":
				AddNews(request, response);
				break;
			case "user_add":
				UserAdd(request, response);
				break;
			case "submit_cart":
				SubmitCart(request, response);
				break;
			default:
				break;
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public static String bytesToHexString(byte[] src) {
		StringBuilder stringBuilder = new StringBuilder("");
		if (src == null || src.length <= 0) {
			return null;
		}
		for (int i = 0; i < src.length; i++) {
			int v = src[i] & 0xFF;
			String hv = Integer.toHexString(v);
			if (hv.length() < 2) {
				stringBuilder.append(0);
			}
			stringBuilder.append(hv);
		}
		return stringBuilder.toString();
	}

	public static String CharCodeTrans(String destSrc, String from, String to) {
		String str = null;
		try {
			str = new String(destSrc.getBytes(from), to);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
}
