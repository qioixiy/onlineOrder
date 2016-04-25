package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.jdbc;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ClientApi extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	String getUuid() {
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}

	public void dispatcher(String fun_id) {
		;
	}

	private List<Map<String, String>> GetOrderListFromdb() {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();

		jdbc jdbc_conn = new jdbc();
		Connection con = jdbc_conn.getConn();
		try {
			Statement order_form_smt;
			order_form_smt = con.createStatement();
			ResultSet order_form_rs = order_form_smt.executeQuery("select * from order_form order by id desc");
			while (order_form_rs.next()) {
				String _id = order_form_rs.getString("id");
				String _status = order_form_rs.getString("status");
				String _timestamp = order_form_rs.getString("timestamp");

				String _user_id = order_form_rs.getString("user_id");
				String username = null;
				String xuehao = null;
				Statement userinfo_smt = con.createStatement();
				ResultSet userinfo_rs = userinfo_smt.executeQuery("select * from userinfo where id=" + _user_id);
				if (userinfo_rs.next()) {
					username = userinfo_rs.getString("user");
					xuehao = userinfo_rs.getString("xuehao");
				}

				String _menu_id = order_form_rs.getString("menu_id");
				String menu_name = null;
				String menu_price = null;
				Statement menu_smt = con.createStatement();
				ResultSet menu_rs = menu_smt.executeQuery("select * from menu where id=" + _menu_id);
				if (menu_rs.next()) {
					menu_name = menu_rs.getString("name");
					menu_price = menu_rs.getString("price");
				}

				String _repeat = order_form_rs.getString("repeat");
				String _spec = order_form_rs.getString("spec");
				String _dish_id = order_form_rs.getString("dish_id");

				System.out.println("id:" + _id 
						+ ",_status:" + _status
						+ ",_timestamp:" + _timestamp
						+ ",_user_id:" + _user_id
						+ ",username:" + username
						+ ",xuehao:" + xuehao
						+ ",_menu_id:" + _menu_id
						+ ",menu_name" + menu_name
						+ ",price" + menu_price
						+ ",_repeat:" + _repeat
						+ ",_spec:" + _spec
						+ ",_dish_id:" + _dish_id);
				if (_status.equals("completed")) {
					System.out.println(_status);
					continue;
				}
				Map<String, String> map = new HashMap<String, String>();
				map.put("id", _id);
				map.put("timestamp", _timestamp);
				map.put("userid", _user_id);
				map.put("username", username);
				map.put("xuehao", xuehao);
				map.put("menuid", _menu_id);
				map.put("menuname", menu_name);
				map.put("menuprice", menu_price);
				map.put("repeat", _repeat);
				map.put("spec", _spec);
				map.put("dishid", _dish_id);
				list.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	JSONObject ClientLogin(HttpServletRequest request, HttpServletResponse response) {
		String user = request.getParameter("user");
		String password = request.getParameter("password");

		Map<String, String> map = new HashMap<String, String>();
		if (misc.Util.verfiyUser(user, password)) {
			map.put("ret", "ok");

			String uuidNew = getUuid();

			jdbc jdbc_conn = new jdbc();
			Connection con = jdbc_conn.getConn();

			// check login ?
			String sql = "select * from  login where user='" + user + "';";
			ResultSet rs;
			Statement stmt;
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				String redirect = "";
				if (rs.next()) {// find user login
					map.put("uuid", uuidNew);
					map.put("detail", "already login");
					sql = "UPDATE login SET uuid = ? WHERE login.user = ?";
					PreparedStatement pstmt = con.prepareStatement(sql);
					pstmt.setString(1, uuidNew);
					pstmt.setString(2, user);
					System.out.println(pstmt.toString());
					pstmt.executeUpdate();
				} else {

					// insert login status
					sql = "insert into login(user,uuid) values(?,?)";
					try {
						map.put("uuid", uuidNew);
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setString(1, user);
						pstmt.setString(2, uuidNew);
						pstmt.executeUpdate();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			map.put("ret", "fail");
			map.put("reson", "invalid user or password");
		}
		map.put("user", user);

		return JSONObject.fromObject(map);
	}

	JSONObject GetAllOrderList(HttpServletRequest request, HttpServletResponse response) {
		String uuid = request.getParameter("uuid");

		JSONObject jobject = new JSONObject();
		jobject.put("uuid", uuid);

		String user = misc.Util.verfiyUuid(uuid);
		if (user != null) {
			List<Map<String, String>> lmss =  GetOrderListFromdb();
			jobject.put("orderlist", JSONArray.fromObject(lmss));
		} else {
			jobject.put("ret", "fail");
			jobject.put("reson", "invalid_uuid");
		}

		return jobject;
	}
	boolean UpdateOrderBindCanPan(String orderID, String canpanID)
	{
		System.out.println("orderID:" + orderID + ",canpanID:" + canpanID);
		jdbc jdbc_conn = new jdbc();
		Connection con = jdbc_conn.getConn();
		
		ResultSet rs;
		Statement stmt;
		try {
			stmt = con.createStatement();
			String sql = "UPDATE `wldc`.`order_form` SET  `status` = 'binded', `dish_id` = '" + canpanID + "' WHERE `order_form`.`id` =" + orderID + "";

			System.out.println(sql);
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
	JSONObject orderBindCanPan(HttpServletRequest request, HttpServletResponse response) {
		String uuid = request.getParameter("uuid");

		JSONObject jobject = new JSONObject();
		jobject.put("uuid", uuid);

		String user = misc.Util.verfiyUuid(uuid);
		if (user != null) {
			jobject.put("ret", "ok");
			jobject.put("id", "orderBindCanPan");
			
			String orderID = request.getParameter("orderID");
			String canpanID = request.getParameter("canpanID");
			UpdateOrderBindCanPan(orderID, canpanID);
		} else {
			jobject.put("ret", "fail");
			jobject.put("reson", "invalid_uuid");
		}

		return jobject;
	}
	JSONObject GetCanPanIdAndTotalPrice(HttpServletRequest request, HttpServletResponse response) {
		String uuid = request.getParameter("uuid");

		JSONObject jobject = new JSONObject();
		jobject.put("uuid", uuid);

		String user = misc.Util.verfiyUuid(uuid);
		if (user != null) {
			jobject.put("ret", "ok");
			jobject.put("id", "GetCanPanIdAndTotalPrice");
			
			String userID = request.getParameter("userID");
			System.out.println("userID:" + userID);
			jdbc jdbc_conn = new jdbc();
			Connection con = jdbc_conn.getConn();
			
			try {
				Statement smt = con.createStatement();
				
				String sql = "select * from userinfo where `xuehao` = '" + userID + "'";
				System.out.println(sql);
				ResultSet rs_userinfo = smt.executeQuery(sql);
				if (rs_userinfo.next()) {
					String id = rs_userinfo.getString("id"); 
					String sql_select_order_form = "SELECT * FROM `order_form` WHERE `status` = 'binded' and `user_id` =" + id;
					System.out.println(sql_select_order_form);
					ResultSet rs_order_form = smt.executeQuery(sql_select_order_form);
					Statement set_completed_stmt = con.createStatement();
					while(rs_order_form.next()) {
						String _id = rs_order_form.getString("id");
						String _timestamp = rs_order_form.getString("timestamp");
						String _user_id = rs_order_form.getString("user_id");
						String _menu_id = rs_order_form.getString("menu_id");
						String _repeat = rs_order_form.getString("repeat");
						String _spec = rs_order_form.getString("spec");
						String _status = rs_order_form.getString("status");
						String _dish_id = rs_order_form.getString("dish_id");
						
						// set order completed
						String order_completed_sql = "UPDATE `wldc`.`order_form` SET `status` = 'completed' WHERE `order_form`.`user_id` ='" + _user_id + "'";
						System.out.println(order_completed_sql);
						set_completed_stmt.executeUpdate(order_completed_sql);
						
						String menu_name = null;
						String menu_price = null;
						Statement menu_smt = con.createStatement();
						ResultSet menu_rs = menu_smt.executeQuery("select * from menu where id=" + _menu_id);
						if (menu_rs.next()) {
							menu_name = menu_rs.getString("name");
							menu_price = menu_rs.getString("price");
						} else {
							System.out.println("can find menu id");
						}
						
						System.out.println("_id:" + _id
								+ "_timestamp:" +_timestamp
								+ "_user_id:" + _user_id
								+ "_menu_id:" + _menu_id
								+ "_menu_price:" + menu_price
								+ "_repeat:" + _repeat
								+ "_spec:" + _spec
								+ "_status:" + _status
								+ "_dish_id:" + _dish_id);
						jobject.put("xuehao", userID);
						jobject.put("repeat", _repeat);
						jobject.put("price", menu_price);
						jobject.put("dish_id", _dish_id);
					}
				} else {
					System.out.println("can find xuehao from userinfo");
					jobject.put("ret", "fail");
					jobject.put("reson", "can find xuehao");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			jobject.put("ret", "fail");
			jobject.put("reson", "invalid_uuid");
		}

		return jobject;
	}

	JSONObject dispatcher(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		if (id != null) {
			switch (id) {
			case "login":
				return ClientLogin(request, response);
			case "orderlist":
				return GetAllOrderList(request, response);
			case "orderBindCanPan":
				return orderBindCanPan(request, response);
			case "GetCanPanIdAndTotalPrice":
				return GetCanPanIdAndTotalPrice(request, response);
			default:
				Map<String, String> ret = new HashMap<String, String>();
				ret.put("ret", "fail");
				ret.put("reson", "invalid_func_id");
				return JSONObject.fromObject(ret);
			}
		} else {
			Map<String, String> ret = new HashMap<String, String>();
			ret.put("ret", "fail");
			ret.put("reson", "invalid_func_id");
			return JSONObject.fromObject(ret);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession sesson = request.getSession();

		PrintWriter out = response.getWriter();
		String str = (String) sesson.getAttribute("prog");

		JSONObject jsonObject = dispatcher(request, response);
		out.print(jsonObject.toString());

		out.flush();
		out.close();
	}

	public String BuildJson() {

		// JSON格式数据解析对象
		JSONObject jo = new JSONObject();

		// 下面构造两个map、一个list和一个Employee对象
		Map<String, String> map1 = new HashMap<String, String>();
		map1.put("name", "Alexia");
		map1.put("sex", "female");
		map1.put("age", "23");

		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("name", "Edward");
		map2.put("sex", "male");
		map2.put("age", "24");

		List<Map> list = new ArrayList<Map>();
		list.add(map1);
		list.add(map2);

		// 将Map转换为JSONArray数据
		JSONArray ja1 = JSONArray.fromObject(map1);
		// 将List转换为JSONArray数据
		JSONArray ja2 = JSONArray.fromObject(list);

		System.out.println("JSONArray对象数据格式：");
		System.out.println(ja1.toString());
		System.out.println(ja2.toString());

		// 构造Json数据，包括一个map和一个Employee对象
		jo.put("map", ja1);
		jo.put("employee", ja2);
		System.out.println("\n最终构造的JSON数据格式：");
		System.out.println(jo.toString());

		return jo.toString();

	}
}