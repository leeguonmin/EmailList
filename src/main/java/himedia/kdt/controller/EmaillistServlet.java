package himedia.kdt.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import learnbyteaching.emaillist.dao.EmailListDao;
import learnbyteaching.emaillist.dao.EmailListDaoImpl;
import learnbyteaching.emaillist.vo.EmailVo;

// extends 확장 
@WebServlet(name="Emaillist", urlPatterns="/el")     // http://localhost:8080/Emaillist/el 치면 Model 2 방법 나와유
public class EmaillistServlet extends BaseServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionName = req.getParameter("a");
		//if (actionName == null) {
		//	actionName = "list";
		//}
		
		// a=form -> form.jsp 로 요청되어 제어권 이전
		if ("form".equals(actionName)) {
			
		} 
   		
		// Dao로부터 데이터 객체를 불러옴
		EmailListDao dao = new EmailListDaoImpl(dbUser, dbPass);
		// 받아와 
		List<EmailVo> list = dao.getList();
		// 요청에 속성으로 추가 
		req.setAttribute("list",  list);
		
		// 목록 표시 페이지 (즉, index.jsp 로 요청을 전달)
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp");
		rd.forward(req, resp);
		
		
	}

}
