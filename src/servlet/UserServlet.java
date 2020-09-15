package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import vo.UserVO;

@WebServlet("/ajax/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");

		BufferedReader br = request.getReader(); 
		String str;
		StringBuffer sb = new StringBuffer();

		while ((str = br.readLine()) != null) {
			sb.append(str);
		}

		Gson g = new Gson();
		UserVO uv = g.fromJson(sb.toString(), UserVO.class);
		Map<String, Object> rMap = new HashMap<>();

	
		if("test".equals(uv.getUiId())) {
			if("test".equals(uv.getUiPwd())) {
				rMap.put("result", uv);
				HttpSession hs = request.getSession();
				hs.setAttribute("user", uv);
	
			}
		}
		
		
		PrintWriter pw = response.getWriter();
		pw.print(g.toJson(rMap));

	}

}
