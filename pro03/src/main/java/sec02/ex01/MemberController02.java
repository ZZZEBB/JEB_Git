package sec02.ex01;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member30/*")
public class MemberController02 extends HttpServlet {
	
	MemberDAO02  memberDAO02;

	public void init(ServletConfig config) throws ServletException {
		memberDAO02 = new MemberDAO02();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset = utf-8");
		String action = request.getPathInfo();
		System.out.println("action : " + action);
		
		if(action == null || action.equals("/listMembers.do")) {
			List<MemberVo02> membersList = memberDAO02.listMember();
			request.setAttribute("membersList", membersList);
			nextPage = "/test02/listMembers02.jsp";
		} else if (action.equals("/addMember.do")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			MemberVo02 memberVo02 = new MemberVo02(id, pwd, name, email);
			memberDAO02.addMember(memberVo02);
			nextPage = "/member30/listMembers.do";
		} else if (action.equals("/memberForm.do")) {
			nextPage = "/test02/memberForm02.jsp";
		} else {
			List<MemberVo02> membersList = memberDAO02.listMember();
			request.setAttribute("membersList", membersList);
			nextPage = "/test02/listMembers02.jsp";
		}
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
	public void destroy() {
	}
}
