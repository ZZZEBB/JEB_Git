package sec02.ex02;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member152/*")
public class MemberController03 extends HttpServlet {
	
	MemberDAO03  memberDAO03;

	public void init(ServletConfig config) throws ServletException {
		memberDAO03 = new MemberDAO03();
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
			List<MemberVo03> membersList = memberDAO03.listMembers();
			request.setAttribute("membersList", membersList);
			nextPage = "/test03/listMembers.jsp";
		} else if (action.equals("/addMember.do")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			MemberVo03 memberVo03 = new MemberVo03(id, pwd, name, email);
			memberDAO03.addMember(memberVo03);
			request.setAttribute("msg", "addMember");
			nextPage = "/member152/listMembers.do";
		} else if (action.equals("/memberForm.do")) {
			nextPage = "/test03/memberForm03.jsp";
		} else if (action.equals("/modMemberForm.do")){
			String id = request.getParameter("id");
			MemberVo03 memInfo = memberDAO03.findMember(id);
			request.setAttribute("memInfo", memInfo);
			nextPage = "/test03/modMemberForm03.jsp";
		} else if(action.equals("/modMember.do")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			MemberVo03 memberVo03 = new MemberVo03(id, pwd, name, email);
			memberDAO03.modMember(memberVo03);
			request.setAttribute("msg", "modified");
			nextPage = "/member152/listMembers.do";
		} else if(action.equals("/delMember.do")) {
			String id = request.getParameter("id");
			memberDAO03.delMember(id);
			request.setAttribute("msg", "deleted");
			nextPage = "/member152/listMembers.do";
		} else {
			List<MemberVo03> membersList = memberDAO03.listMembers();
			request.setAttribute("membersList", membersList);
			nextPage = "/test03/listMembers.jsp";
		}
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
	public void destroy() {
	}
}
