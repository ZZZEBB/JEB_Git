package com.spring.ctc.admin.sales.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ctc.admin.sales.service.AdminSalesService;
import com.spring.ctc.joinandlogin.vo.CompanyVO;
import com.spring.ctc.joinandlogin.vo.MemberVO;
import com.spring.ctc.order.vo.OrderVO;

@Controller
@RequestMapping(value="/adminSales")
public class AdminSalesControllerImpl implements AdminSalesController{
	@Autowired
	AdminSalesService adminSalesService;
	@Autowired
	MemberVO memberVO;

	//관리자 모드 - 메인페이지(매출관리 페이지, /adminSalesMain.do)
	@RequestMapping(value= "/adminSalesMain.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminSalesMain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session = request.getSession();
		ModelAndView mav = new ModelAndView(viewName);
        //관리자 - 매출관리 사이드메뉴
		session.setAttribute("side_menu", "salesManage_mode"); 
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
		List<OrderVO> reservation = adminSalesService.selectAllOrderList(memberVO);
		
		mav.addObject("orderInfo" , reservation);
        return mav;
	}
}
