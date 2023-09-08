package com.spring.ctc.company.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CompanyOrderController {
	
	public ModelAndView reservation(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView reservationfind(@RequestParam Map<String,String> find ,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
