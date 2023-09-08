package com.spring.ctc.admin.goods.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
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

import com.spring.ctc.admin.goods.service.AdminGoodsService;
import com.spring.ctc.goods.GoodsVO;
import com.spring.ctc.joinandlogin.vo.MemberVO;

@Controller("adminGoods")
@RequestMapping(value="/adminGoods")
public class AdminGoodsControllerImpl implements AdminGoodsController{
      @Autowired
      private AdminGoodsService adminGoodsService;
      @Autowired
      private MemberVO memberVO;
      @Autowired
      private GoodsVO goodsVO;
   
   
    //관리자 모드 - 상품관리 페이지, /adminGoodsList.do)
      @RequestMapping(value="/adminGoodsList.do" ,method={RequestMethod.POST,RequestMethod.GET})
      public ModelAndView adminGoodsList(HttpServletRequest request, HttpServletResponse response) throws Exception{
    	  String viewName = (String)request.getAttribute("viewName");
    	  HttpSession session = request.getSession();
         session = request.getSession();  
         ModelAndView mav = new ModelAndView(viewName);
         //관리자 - 주문관리 사이드메뉴
 		session.setAttribute("side_menu", "goodsManage_mode"); 
 		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
		List<GoodsVO> goods = adminGoodsService.selectAllGoodsList(goodsVO);
		
		mav.addObject("orderInfo" , reservation);
        return mav;
      }
      
      // 개월수로 조회
      @RequestMapping(value = "/listGoodsHistory.do", method={RequestMethod.POST,RequestMethod.GET})
      public ModelAndView listGoodsHistory(@RequestParam Map<String, String> dateMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
           String viewName = (String)request.getAttribute("viewName");
       
	       ModelAndView mav = new ModelAndView(viewName);
	       HttpSession session = request.getSession();
	       //관리자 사이드메뉴
	       session.setAttribute("side_menu", "goodsManage_mode"); 
	       memberVO = (MemberVO)session.getAttribute("memberInfo");
	       String member_id = memberVO.getMember_id();
	       String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
	       String beginDate = null, endDate = null;
	       String[] tempDate = calcSearchPeriod(fixedSearchPeriod).split(",");
	       beginDate=tempDate[0];
	       endDate=tempDate[1];
	       dateMap.put("beginDate", beginDate);
	       dateMap.put("endDate", endDate);
	       dateMap.put("member_id", member_id);
	       List<GoodsVO> myOrderHistList=adminGoodsService.listMyOrderHistory(dateMap);
	       String beginDate1[]=beginDate.split("-");
	       String endDate1[]=endDate.split("-");
	       mav.addObject("beginYear", beginDate1[0]);
	       mav.addObject("beginMonth", beginDate1[1]);
	       mav.addObject("beginDay", beginDate1[2]);
	       mav.addObject("endYear", endDate1[0]);
	       mav.addObject("endYear", endDate1[1]);
	       mav.addObject("endYear", endDate1[2]);
	       mav.addObject("myOrderHistList", myOrderHistList);
	       mav.addObject("member", memberVO);
       
        return mav;
     }
      
      protected String calcSearchPeriod(String fixedSearchPeriod){
            String beginDate=null;
            String endDate=null;
            String endYear=null;
            String endMonth=null;
            String endDay=null;
            String beginYear=null;
            String beginMonth=null;
            String beginDay=null;
            DecimalFormat df = new DecimalFormat("00");
            Calendar cal=Calendar.getInstance();
            
            endYear   = Integer.toString(cal.get(Calendar.YEAR));
            endMonth  = df.format(cal.get(Calendar.MONTH) + 1);
            endDay   = df.format(cal.get(Calendar.DATE));
            endDate = endYear +"-"+ endMonth +"-"+endDay;
            
            if(fixedSearchPeriod == null) {
               cal.add(cal.MONTH,-4);
            }else if(fixedSearchPeriod.equals("one_week")) {
               cal.add(Calendar.DAY_OF_YEAR, -7);
            }else if(fixedSearchPeriod.equals("two_week")) {
               cal.add(Calendar.DAY_OF_YEAR, -14);
            }else if(fixedSearchPeriod.equals("one_month")) {
               cal.add(cal.MONTH,-1);
            }else if(fixedSearchPeriod.equals("two_month")) {
               cal.add(cal.MONTH,-2);
            }else if(fixedSearchPeriod.equals("three_month")) {
               cal.add(cal.MONTH,-3);
            }else if(fixedSearchPeriod.equals("four_month")) {
               cal.add(cal.MONTH,-4);
            }
            
            beginYear   = Integer.toString(cal.get(Calendar.YEAR));
            beginMonth  = df.format(cal.get(Calendar.MONTH) + 1);
            beginDay   = df.format(cal.get(Calendar.DATE));
            beginDate = beginYear +"-"+ beginMonth +"-"+beginDay;
            
            return beginDate+","+endDate;
         }
}