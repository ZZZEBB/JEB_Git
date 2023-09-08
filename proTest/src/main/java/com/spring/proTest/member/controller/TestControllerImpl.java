package com.spring.proTest.member.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.proTest.member.service.TestService;
import com.spring.proTest.member.vo.TestVO;

@Controller("testController")
public class TestControllerImpl implements TestController{
	private static final Logger logger = LoggerFactory.getLogger(TestControllerImpl.class);
	
	@Autowired
	private TestService testService;
	
	@Autowired
	private TestVO testVO;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("testform");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/test9.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List membersList = testService.listMembers();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("listtest");
		mav.addObject("membersList", membersList);
		return mav;
		
	}
	
}
