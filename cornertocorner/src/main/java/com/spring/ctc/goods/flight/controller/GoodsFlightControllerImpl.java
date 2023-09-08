package com.spring.ctc.goods.flight.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ctc.goods.flight.service.GoodsFlightService;
import com.spring.ctc.goods.GoodsVO;

@Controller("flightController")
@RequestMapping(value="/goods")
public class GoodsFlightControllerImpl implements GoodsFlightController{
	@Autowired
	private GoodsFlightService goodsflightservice;
	
	@Override
	@RequestMapping(value="/goodsFlightSearch.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView goodsFlightSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/goodsFlightKeyWordSearch.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView goodsFlightKeywordSearch(@RequestParam Map<String,String> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		 List<GoodsVO> keyword = goodsflightservice.selectListFlight(model); 
		 
		ModelAndView mav = new ModelAndView(viewName);
		 mav.addObject("keyword" , keyword); 
		return mav;
	}
}
