package com.spring.ctc.goods.flight.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface GoodsFlightController {
	
	public ModelAndView goodsFlightSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goodsFlightKeywordSearch(@RequestParam Map<String,String> model,  HttpServletRequest request, HttpServletResponse response) throws Exception;
}
