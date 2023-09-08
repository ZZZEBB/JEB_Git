package com.spring.ex02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mem2.do")
public class MemberServlet02 extends HttpServlet {

	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 메서드 실행");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset = utf-8");
		
		MemberDAO02 dao = new MemberDAO02();
		String name = dao.selectName();
		int pwd = dao.selectPwd();
		PrintWriter pw = response.getWriter();
		
		/*
		 * pw.write("<script>"); pw.write("alert('이름 : " + name + "')");
		 * pw.write("</script>");
		 */
		
		
		pw.write("<script>");
		pw.write("alert('비밀번호 : " + pwd + "')");
		pw.write("</script>");
		 
	}
	
	public void destroy() {
		System.out.println("destroy 메서드 실행");
	}

}
