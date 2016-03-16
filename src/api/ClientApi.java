package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ClientApi extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession sesson = request.getSession();

		PrintWriter out = response.getWriter();
		String str = (String) sesson.getAttribute("prog");
		String res = (String) sesson.getAttribute("result");
		String err = (String) sesson.getAttribute("error");
		System.out.println(str + "," + res + "," + err);

		String user = request.getParameter("user");
		String password = request.getParameter("password");
		System.out.println(user + password);
		List list = new ArrayList();
		list.add( "first" );
		list.add( "second" );
		JSONArray jsonArray2 = JSONArray.fromObject( list );
		//out.print(jsonArray2.toString());

		//BuildJson();
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