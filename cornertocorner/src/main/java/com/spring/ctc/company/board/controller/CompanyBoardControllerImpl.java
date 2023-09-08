package com.spring.ctc.company.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/comBoard")
public class CompanyBoardControllerImpl implements CompanyBoardController {
	/* private static final String CURR_IMAGE_REPO_PATH = "C:\\ctc\\file_repo"; */

	//사업체모드 - 이벤트 게시물 목록 페이지 이동 (/comEventList.do)
	@Override
	@RequestMapping(value= "/comEventList.do" , method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView comEventList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		session = request.getSession();
		
		//사업체 이벤트 관리 사이드메뉴
		session.setAttribute("side_menu", "eventManage_mode"); //사업자 모드 - 이벤트관리 사이드 메뉴
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	
	}
	
	//사업체모드 - 이벤트 게시물 등록 페이지 이동 (/comEventForm.do)
		@Override
		@RequestMapping(value= "/comEventForm.do" , method = {RequestMethod.POST,RequestMethod.GET})
		public ModelAndView comEventForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
			HttpSession session = request.getSession();
			session = request.getSession();
			
			//사업체 이벤트 관리 사이드메뉴
			session.setAttribute("side_menu", "eventManage_mode"); //사업자 모드 - 이벤트관리 사이드 메뉴
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		
		}
}
