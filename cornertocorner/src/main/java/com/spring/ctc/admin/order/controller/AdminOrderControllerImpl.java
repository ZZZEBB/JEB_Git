package com.spring.ctc.admin.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ctc.admin.order.service.AdminOrderService;
import com.spring.ctc.joinandlogin.vo.MemberVO;
import com.spring.ctc.order.vo.OrderVO;

@Controller
@RequestMapping(value="/adminOrder")
public class AdminOrderControllerImpl implements AdminOrderController{
	
	@Autowired
	AdminOrderService adminOrderService;
	@Autowired
	MemberVO memberVO;

	//관리자 모드 - 주문관리 페이지, /adminAllOrderList.do)
	@RequestMapping(value= "/adminAllOrderList.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminAllOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session = request.getSession();
		ModelAndView mav = new ModelAndView(viewName);
        //관리자 - 주문관리 사이드메뉴
		session.setAttribute("side_menu", "reservationManage_mode"); 
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
		List<OrderVO> reservation = adminOrderService.selectAllOrderList(memberVO);
		
		mav.addObject("orderInfo" , reservation);
        return mav;
	}
	

}
