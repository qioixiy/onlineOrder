package comments;

import java.sql.*;

public class jdbc {

	public jdbc() {
		;
	}

	Connection conn = null;
	String re = "";
	String dbip = "127.0.0.1";
	String user = "root";
	String pass = "";

	public java.sql.Connection getConn() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://" + dbip + ":3306/wldc" + "?user=" + user + "&password=" + pass
					+ "&useUnicode=true&characterEncoding=gb2312";
			conn = DriverManager.getConnection(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.conn;
	}

	public String ex_chinese(String str) {
		System.out.println("-" + str);
		if (str == null) {
			str = "";
		} else {
			try {
				str = new String(str.getBytes("iso-8859-1"), "gb2312");
			} catch (Exception ex) {
			}
		}

		return str;
	}

	public String gettime() {
		String datestr = "";
		try {
			java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy年MM月dd日 HH点ss分");
			datestr = df.format(new java.util.Date());
		} catch (Exception ex) {

		}

		return datestr;
	}
}