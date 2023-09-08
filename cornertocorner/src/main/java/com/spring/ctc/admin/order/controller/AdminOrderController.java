package com.spring.ctc.admin.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AdminOrderController {

	public ModelAndView adminAllOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
