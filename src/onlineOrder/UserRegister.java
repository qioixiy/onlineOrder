package onlineOrder;

import java.sql.*;

public class UserRegister {
	private UserBean userBean;
	private Connection con;

	// ������ݿ����ӡ�
	public UserRegister() {
		String url = "jdbc:mysql://localhost:3306/wldc?" + "user=root&password=&useUnicode=true&characterEncoding=gb2312";

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ���ô�ע����û���Ϣ��
	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	// ����ע��
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