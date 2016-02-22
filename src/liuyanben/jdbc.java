package liuyanben;

import java.sql.*;

public class jdbc {

	public jdbc() {
		;
	}

	Connection conn = null;
	String re = "";
	// 设置你的数据库ip
	String dbip = "127.0.0.1";
	// 设置你的数据库用户名和密码：
	String use = "root";
	String pass = "";

	public java.sql.Connection getConn() {
		System.out.println("---------------------------------------------");
		try {
			Class.forName("org.gjt.mm.mysql.Driver").newInstance();
			String url = "jdbc:mysql://" + dbip + ":3306/wldc" + "?user=" + use + "&password=" + pass
					+ "&useUnicode=true&characterEncoding=utf8";
			conn = DriverManager.getConnection(url);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.conn;
	}

	public String ex_chinese(String str) {
		if (str == null) {
			str = "";
		} else {
			try {
				//str = new String(str.getBytes("iso-8859-1"), "gb2312");
			} catch (Exception ex) {
			}
		}
		return str;
	}

	public String gettime() {
		String datestr = "";
		try {
			java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy年MM月dd日 HH点ss分");
			java.util.Date date = new java.util.Date();
			datestr = df.format(new java.util.Date());
		} catch (Exception ex) {

		}

		return datestr;
	}
}