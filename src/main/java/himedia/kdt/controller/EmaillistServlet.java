package himedia.kdt.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// extends 확장 
@WebServlet(name="Emaillist", urlPatterns="/el")     // http://localhost:8080/Emaillist/el 치면 Model 2 방법 나와유
public class EmaillistServlet extends BaseServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionName = req.getParameter("a");
		if (actionName == null) {
			actionName = "list";
		}
		
		
		// 목록 표시 페이지 (즉, index.jsp 로 요청을 전달)
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp");
		rd.forward(req, resp);
		
	}

}
