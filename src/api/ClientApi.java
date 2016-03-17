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

	public void dispatcher(String fun_id)
	{
		;
	}
	
	JSONArray ClientLogin(HttpServletRequest request, HttpServletResponse response)
	{
		String user = request.getParameter("user");
		String password = request.getParameter("password");

		Map<String, String> map = new HashMap<String, String>();
		map.put("user", user);
		
		return JSONArray.fromObject(map);
	}
	
	JSONArray dispatcher(HttpServletRequest request, HttpServletResponse response)
	{
		String id = request.getParameter("id");
		switch(id) {
		case "login": break;
		}
		return ClientLogin(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession sesson = request.getSession();

		PrintWriter out = response.getWriter();
		String str = (String) sesson.getAttribute("prog");
		
		
		JSONArray jsonArray = dispatcher(request, response);
		out.print(jsonArray.toString());

		out.flush();
		out.close();
	}
	public String BuildJson() {

        // JSON��ʽ���ݽ�������
        JSONObject jo = new JSONObject();

        // ���湹������map��һ��list��һ��Employee����
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

        // ��Mapת��ΪJSONArray����
        JSONArray ja1 = JSONArray.fromObject(map1);
        // ��Listת��ΪJSONArray����
        JSONArray ja2 = JSONArray.fromObject(list);

        System.out.println("JSONArray�������ݸ�ʽ��");
        System.out.println(ja1.toString());
        System.out.println(ja2.toString());

        // ����Json���ݣ�����һ��map��һ��Employee����
        jo.put("map", ja1);
        jo.put("employee", ja2);
        System.out.println("\n���չ����JSON���ݸ�ʽ��");
        System.out.println(jo.toString());

        return jo.toString();

    }
}