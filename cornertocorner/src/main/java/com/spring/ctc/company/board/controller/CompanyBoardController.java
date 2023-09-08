package com.spring.ctc.company.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface CompanyBoardController {
	public ModelAndView comEventList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView comEventForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
