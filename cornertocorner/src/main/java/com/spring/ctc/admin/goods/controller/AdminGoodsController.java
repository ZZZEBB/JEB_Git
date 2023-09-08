package com.spring.ctc.admin.goods.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminGoodsController {

	public ModelAndView adminGoodsList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listGoodsHistory(@RequestParam Map<String, String> dateMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
