package com.spring.ctc.company.order.controller;

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

import com.spring.ctc.company.order.service.CompanyOrderService;
import com.spring.ctc.joinandlogin.vo.CompanyVO;
import com.spring.ctc.order.vo.OrderVO;

@Controller("companyOrder")
@RequestMapping(value="/comOrder")
public class CompanyOrderControllerImpl implements CompanyOrderController {
	@Autowired
	private CompanyOrderService companyOrderService;
	//예약목록 조회 페이지 이동
	@RequestMapping(value="/reservation.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView reservation(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		session = request.getSession();  
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		List<OrderVO> order = companyOrderService.selectOrderList();
		mav.setViewName(viewName);
		session.setAttribute("side_menu", "reservationManage_mode"); //사업자 모드 - 예약관리 사이드 메뉴
		mav.addObject("reservation",order);
		return mav;
	}
	   //예약목록 조건 검색
	   @RequestMapping(value="/reservationfind.do" ,method={RequestMethod.POST,RequestMethod.GET})
	   public ModelAndView reservationfind(@RequestParam Map<String,String> find ,HttpServletRequest request, HttpServletResponse response) throws Exception{
		   HttpSession session = request.getSession();
			session = request.getSession();
		   ModelAndView mav = new ModelAndView();
	      String viewName = (String)request.getAttribute("viewName");
	      System.out.println("asdsadsada" + find.get("member_id"));
	      mav.setViewName(viewName);
	      session.setAttribute("side_menu", "reservationManage_mode"); //사업자 모드 - 예약관리 사이드 메뉴
	      List<OrderVO> order = companyOrderService.findOrderGoods(find);
	      mav.addObject("comReser", order);
	      return mav;
	   }
}
