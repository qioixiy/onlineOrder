package onlineOrder;

import java.sql.*;

public class UserRegister {
	private UserBean userBean;
	private Connection con;

	// 获得数据库连接。
	public UserRegister() {
		String url = "jdbc:mysql://localhost:3306/wldc?" + "user=root&password=&useUnicode=true&characterEncoding=gb2312";

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 设置待注册的用户信息。
	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	// 进行注册
	public void regist() throws Exception {
		String reg = "insert into userinfo(user,password) values(?,?)";

		try {
			PreparedStatement pstmt = con.prepareStatement(reg);
			System.out.println("a");
			pstmt.setString(1, userBean.getUser());
			System.out.println("a");
			pstmt.setString(2, userBean.getPassword());
			System.out.println("a");
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}
}