package com.spring.ex02;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class UserController extends MultiActionController {
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String userID = "";
		String passwd = "";
		
		//getViewName 메서드를 호출해 요청명에서 확장명 .do를 제외한 뷰 이름을 가져옵니다.
		//여러가지 매핑주소를 받아야하므로 앞으로는 이걸로 쓰기
		String viewName = getViewName(request);
		
		ModelAndView mav = new ModelAndView();
		
		request.setCharacterEncoding("utf-8");

		userID = request.getParameter("userID");
		passwd = request.getParameter("passwd");
		//addObject : ModelAndView에 값 저장하는 메서드(Map형태로 키, 값 저장)
		mav.addObject("userID", userID);
		mav.addObject("passwd", passwd);
		// setViewName : ModelAndView 객체에 포워딩할 JSP 이름을 설정
		// result.jsp에 userID와 passwd를 포워딩하겠다.
		/* mav.setViewName("result"); */
		
		mav.setViewName(viewName);
		System.out.println("ViewName : " + viewName);
		
		return mav;
	}

	//이 방식을 이용해 .do를 제외한 요청명 구하기
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		String uri = (String)request.getAttribute("javax.servlet.include.request_uri");
		System.out.println(uri);
		
		//uri를 대부분 못가져온다(null) 그래서 이 작업이 필요함
		if(uri == null || uri.trim().equals("")) {
			//이 구문은 정확하게 가져오지만 먼저 getAttribute로 가져오는 작업을 해야한다.
			uri = request.getRequestURI();
			System.out.println("uri : " + uri); //ex) uri : /pro05/test/login.do
		}
		
		int begin = 0;
		if(!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length(); //ex) begin : http://localhost:8080/pro05/
			System.out.println("begin : " + begin);
		}
		
		int end;
		if(uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
			System.out.println("end1 : " + end);
		} else if (uri.indexOf("?") != -1 ) {
			end = uri.indexOf("?");
			System.out.println("end2 : " + end);
		} else {
			end = uri.length();
			System.out.println("end3 : " + end);
		}
				
		String fileName = uri.substring(begin, end);
		System.out.println("fileName1 : " + fileName);
		
		if(fileName.indexOf(".") != -1) {
			fileName = fileName.substring(0, fileName.lastIndexOf("."));
			System.out.println("fileName2 : " + fileName);
		}
		if(fileName.lastIndexOf("/") != -1) {
			fileName = fileName.substring(fileName.lastIndexOf("/"), fileName.length());
			System.out.println("fileName3 : " + fileName);
		}
		
		System.out.println("fileName : " + fileName);
		return fileName;
	}
	
}
