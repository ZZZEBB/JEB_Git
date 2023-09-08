package com.spring.ctc.order.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ctc.goods.GoodsVO;
import com.spring.ctc.joinandlogin.vo.MemberVO;
import com.spring.ctc.order.service.OrderService;
import com.spring.ctc.order.vo.OrderVO;

@Controller("OrderController")
@RequestMapping(value="/order")
public class OrderControllerImpl implements OrderController {
   @Autowired
   private OrderService orderService;
   @Autowired
   private OrderVO orderVO;
   
   
   //상품 예약/결제 페이지
   @Override
   @RequestMapping(value= "/order.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView order(HttpServletRequest request, HttpServletResponse response) throws Exception{
      String viewName = (String)request.getAttribute("viewName");
      ModelAndView mav = new ModelAndView(viewName);
      return mav;
   }
   
   //상품 예약/결제 완료 페이지
      @Override
      @RequestMapping(value= "/finishOrder.do" ,method={RequestMethod.POST,RequestMethod.GET})
      public ModelAndView finishOrder(HttpServletRequest request, HttpServletResponse response) throws Exception{
         String viewName = (String)request.getAttribute("viewName");
         ModelAndView mav = new ModelAndView(viewName);
         return mav;
      }

      @Override
      @RequestMapping(value = "/orderEachGoods.do", method = RequestMethod.POST)
      public ModelAndView orderEachGoods(@ModelAttribute("orderVO") OrderVO _orderVO, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
         GoodsVO goodsVO = new GoodsVO();
         request.setCharacterEncoding("utf-8");
         HttpSession session = request.getSession();
         session = request.getSession();
         
         Boolean isLogOn=(Boolean)session.getAttribute("isLogOn");
         String action=(String)session.getAttribute("action");
         
         
         if (isLogOn==null || isLogOn==false) {
            session.setAttribute("orderInfo", _orderVO);
            session.setAttribute("action", "/order/order/do");
            return new ModelAndView("redirect:/joinAndLogin/loginForm.do");
         }else {
            if (action!=null && action.equals("/order/order.do")) {
               orderVO = (OrderVO)session.getAttribute("orderInfo");
               session.removeAttribute("action");
            } else {
               orderVO=_orderVO;
            }
         }
         
         String viewName = (String)request.getAttribute("viewName");
         ModelAndView mav = new ModelAndView(viewName);
         
         List myOrderList = new ArrayList<OrderVO>();
         myOrderList.add(orderVO);
         
         MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
         session.setAttribute("myOrderList", myOrderList);
         session.setAttribute("orderer", memberInfo);
         
         
         return mav;
      }
      

		/*
		 * @Override
		 * 
		 * @RequestMapping(value = "/orderAllCartGoods.do",
		 * method={RequestMethod.POST,RequestMethod.GET}) public ModelAndView
		 * orderAllCartGoods(@RequestParam("cart_headcount") String[] cart_headcount,
		 * HttpServletRequest request, HttpServletResponse response) throws Exception {
		 * String viewName = (String)request.getAttribute("viewName"); ModelAndView mav
		 * = new ModelAndView(viewName); HttpSession session = request.getSession(); Map
		 * cartMap=(Map)session.getAttribute("cartMap"); List myOrderList = new
		 * ArrayList<OrderVO>();
		 * 
		 * List<GoodsVO> myGoodList = (List<GoodsVO>)cartMap.get("myGoodsLsit");
		 * MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
		 * 
		 * for(int i=0; i<=cart_headcount.length;i++) { String[]
		 * cart_goods=cart_headcount[i].split(":"); for(int j=0;
		 * j<myGoodList.size();j++) { GoodsVO goodsVO = myGoodList.get(j); String
		 * goods_code = goodsVO.getGoods_code(); if (goods_code==(cart_goods[0])) {
		 * OrderVO _orderVO = new OrderVO(); String goods_name =
		 * goodsVO.getGoods_name(); int goods_saleprice = goodsVO.getGoods_saleprice();
		 * _orderVO.setGoods_code(goods_code); _orderVO.setGoods_name(goods_name);
		 * _orderVO.setGoods_saleprice(goods_saleprice); myOrderList.add(_orderVO);
		 * break;
		 * 
		 * } } } session.setAttribute("myGoodsList", myGoodList);
		 * session.setAttribute("myOrderList", myOrderList);
		 * session.setAttribute("orderer", memberVO); return mav; }
		 */


      @Override //ppt18번 - 2
      @RequestMapping(value = "/payToOrderGoods.do", method = RequestMethod.POST)
      public ModelAndView payToOrderGoods(@RequestParam Map<String, String> receiverMap, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
         String viewName = (String)request.getAttribute("viewName");
         ModelAndView mav = new ModelAndView(viewName);
         HttpSession session = request.getSession();
         MemberVO memberVO = (MemberVO)session.getAttribute("orderer");
         String member_id = memberVO.getMember_id();
         String orderer_name = memberVO.getMember_name();
         //String orderer_hp = memberVO.getMember_ph1()+"-"+memberVO.getMember_ph2()+"-"+memberVO.getMember_ph3();
         List<OrderVO> myOrderList = (List<OrderVO>)session.getAttribute("myOrderList");
         for(int i=0; i<myOrderList.size();i++) {
            OrderVO orderVO = (OrderVO)myOrderList.get(i);
            orderVO.setMember_id(member_id);
            orderVO.setCard_pay_month(receiverMap.get("card_pay_month"));
            orderVO.setCard_com_name(receiverMap.get("card_com_name"));
            myOrderList.set(i, orderVO);  
         }
         
         orderService.addNewOrder(myOrderList);
         mav.addObject("myOrderInfo", receiverMap);
         mav.addObject("myOrderList", myOrderList);
         return mav;
      }
      
}