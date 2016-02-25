package db;

import java.sql.*;

public class UserRegister {
	private UserBean userBean;
	private Connection con;

	// 获得数据库连接。
	public UserRegister() {
		jdbc _jdbc = new jdbc();
		con = _jdbc.getConn();
	}

	// 设置待注册的用户信息。
	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	// 进行注册
	public void regist() throws Exception {
		String sql = "insert into userinfo(user,password) values(?,?)";

		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userBean.getUser());
			pstmt.setString(2, userBean.getPassword());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}
}