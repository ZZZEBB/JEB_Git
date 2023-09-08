package sec01.ex01;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/boad/*")
public class TestController extends HttpServlet {
	
	TestService testService;
	TestVO testVO;

	public void init(ServletConfig config) throws ServletException {
		testService = new TestService();
		testVO = new TestVO();
		System.out.println("init 메서드 실행");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset = utf-8");
		String action = request.getPathInfo();
		System.out.println("action : " + action);
		
		try {
			List<TestVO> studentsList = new ArrayList<TestVO>();
		
			if(action == null) {
				studentsList = testService.listStudents();
				request.setAttribute("studentsList", studentsList);
				nextPage = "/test01/studentlists.jsp";
				
			} else if(action.equals("/liststudents.do")) {
				
				studentsList = testService.listStudents();
				request.setAttribute("studentsList", studentsList);
				nextPage = "/test01/studentlists.jsp";
				
			} else if(action.equals("/addForm.do")) {
				nextPage = "/test01/addstudent.jsp";
				
			} else if(action.equals("/addstudent.do")){
				
				int id = Integer.parseInt(request.getParameter("id"));
				String userName = request.getParameter("userName");
				String univ = request.getParameter("univ");
				String birth = request.getParameter("birth");
				String email = request.getParameter("email");
				
				testVO.setId(id);
				testVO.setUserName(userName);
				testVO.setUniv(univ);
				testVO.setBirth(birth);
				testVO.setEmail(email);
				
				testService.addStudent(testVO);
				
				nextPage = "/boad/liststudents.do";
				
			} else {
				nextPage = "/test01/studentlists.jsp";
			}
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		} catch(NumberFormatException e) {
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void destroy() {
		System.out.println("destroy 메서드 실행");
	}
		
}
