package com.spring.ctc.goods.hotel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ctc.goods.hotel.dao.GoodsHotelDAO;
import com.spring.ctc.goods.hotel.service.GoodsHotelService;
import com.spring.ctc.goods.GoodsVO;

@Controller("HotelController")
@RequestMapping(value = "/goods")
public class GoodsHotelControllerImpl implements GoodsHotelController{
   @Autowired
   private GoodsHotelService goodsHotelService;
   @Autowired
   private GoodsHotelDAO goodsHotelDAO;

   /* 호텔 목록 조회 페이지 */
   @Override
   @RequestMapping(value ="/goodsHotelSearch.do", method = {RequestMethod.GET,RequestMethod.POST}  )
   public ModelAndView goodsHotelSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName=(String)request.getAttribute("viewName");
      List<GoodsVO> hotel = goodsHotelService.selectHotelAllList();
      ModelAndView mav = new ModelAndView(viewName);
      mav.addObject("hotelList", hotel);
      return mav;
   }

   /* 호텔상세페이지 */
   @Override
   @RequestMapping(value ="/goodsHotelDetail.do", method = {RequestMethod.GET,RequestMethod.POST}  )
   public ModelAndView goodsHotelDetail(@RequestParam("goods_code") String goods_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName=(String)request.getAttribute("viewName");
      List<GoodsVO> hotelDetail = goodsHotelService.selectHotelDetailList(goods_code);
      ModelAndView mav = new ModelAndView(viewName);
      mav.addObject("hotelList", hotelDetail);
      return mav;
   }

}