package com.spring.ctc.admin.sales.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AdminSalesController {

	public ModelAndView adminSalesMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
