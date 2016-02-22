<%@page import="java.sql.*" contentType="text/html;charset=gb2312"%>
<%@page import="java.util.*"%>
<%

 String user = new String(request.getParameter("user"));
 String password = new String(request.getParameter("password"));
 System.out.println();
 Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wldc","root","");
 Statement stmt=con.createStatement();
 String sql="select * from  userinfo where user='"+user+"';";
 ResultSet rs=stmt.executeQuery(sql);
if(rs.next()) {
	String _password=new String(rs.getString("password"));
	if(_password.equals(password)) {
		session.setAttribute("user",user);
		response.sendRedirect("loginSuccess.jsp");
	} else {
		response.sendRedirect("index.jsp");
	}
} else {
	response.sendRedirect("index.jsp");
}
%>