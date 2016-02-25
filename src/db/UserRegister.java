package db;

import java.sql.*;

public class UserRegister {
	private UserBean userBean;
	private Connection con;

	// ������ݿ����ӡ�
	public UserRegister() {
		jdbc _jdbc = new jdbc();
		con = _jdbc.getConn();
	}

	// ���ô�ע����û���Ϣ��
	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	// ����ע��
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