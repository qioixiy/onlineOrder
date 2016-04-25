package misc;

import java.security.MessageDigest;
import java.sql.*;

import javax.servlet.http.HttpSession;

import db.jdbc;

public class Util {
	public static boolean verfiyUser(String userName, String password) {
		jdbc jdbc_conn = new jdbc();
		Connection con = jdbc_conn.getConn();
		Statement stmt;
		try {
			stmt = con.createStatement();
			String sql = "select * from  userinfo where user='" + userName + "';";
			ResultSet rs;
			try {
				rs = stmt.executeQuery(sql);
				String redirect = "";
				if (rs.next()) {
					String db_password = new String(rs.getString("password"));
					String encrypt = new String(rs.getString("encrypt"));

					// get real password
					if (encrypt.equals("1")) {
						password = MD5(password);
					}

					// check password
					if (db_password.equals(password)) {
						System.out.println(userName + " login");
						return true;
					}
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return false;
	}
	
	public static String verfiyUuid(String uuid) {
		String user = null;
		jdbc jdbc_conn = new jdbc();
		Connection con = jdbc_conn.getConn();
		Statement stmt;
		try {
			stmt = con.createStatement();
			String sql = "select * from  login where uuid='" + uuid + "';";
			ResultSet rs;
			try {
				rs = stmt.executeQuery(sql);
				String redirect = "";
				if (rs.next()) {
					user = new String(rs.getString("user"));
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return user;
	}

	// 生成MD5
	public static String MD5(String s) {
		final char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };

		try {
			byte[] btInput = s.getBytes();
			// 获得MD5摘要算法的 MessageDigest 对象
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			// 使用指定的字节更新摘要
			mdInst.update(btInput);
			// 获得密文
			byte[] md = mdInst.digest();
			// 把密文转换成十六进制的字符串形式
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];
				str[k++] = hexDigits[byte0 & 0xf];
			}
			return new String(str);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static boolean loginCheck(HttpSession session) {
		String status = (String) session.getAttribute("username");
		if (status == null) {
			System.out.println("without login");
			return false;
		} else {
			System.out.println("has login");
			return true;
		}
	}
}
