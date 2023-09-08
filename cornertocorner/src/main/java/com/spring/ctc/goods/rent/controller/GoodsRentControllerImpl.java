package com.spring.ctc.goods.rent.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ctc.goods.rent.service.GoodsRentService;
import com.spring.ctc.goods.GoodsVO;

@Controller("rentController")
@RequestMapping(value="/goods")
public class GoodsRentControllerImpl implements GoodsRentController{
   @Autowired
   private GoodsRentService goodsrentservice;
   
   @Override
   @RequestMapping(value="/goodsRentSearch.do" ,method =  {RequestMethod.GET,RequestMethod.POST})
   public ModelAndView goodsRentSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName=(String)request.getAttribute("viewName");
      List<GoodsVO> carmodel = goodsrentservice.selectRentAllList();
      ModelAndView mav = new ModelAndView(viewName);
      mav.addObject("carList" , carmodel);
      /* Date car_start_date = request.getAttribute("car_start_date"); */
      return mav;
   }
   
   
   @Override
   @RequestMapping(value="/goodsRentDetail.do" ,method = {RequestMethod.GET,RequestMethod.POST})
   public ModelAndView goodsRentDetail(@RequestParam("car_name") String car_name ,
                                 @RequestParam("car_date") String user_date ,
                                 @RequestParam("car_time") String user_time ,
         HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName=(String)request.getAttribute("viewName");
      List<GoodsVO> car_imt = goodsrentservice.selectRentDetail(car_name);
      ModelAndView mav = new ModelAndView(viewName);
      mav.addObject("user_date",user_date);
      mav.addObject("user_time",user_time);      
      mav.addObject("carList", car_imt);
      return mav;
   }
   
   @Override
   @RequestMapping(value="/rentsearchWord.do" ,method =  {RequestMethod.GET,RequestMethod.POST})
   public ModelAndView goodsSearch(@RequestParam Map<String,String> carResult, HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      String viewName=(String)request.getAttribute("/goods/goodsRentSearch");
      ModelAndView mav = new ModelAndView(viewName);
      try {
         List<GoodsVO> carmodel = goodsrentservice.selectRentList(carResult);
         Map carInfo = new HashMap();
         String date = (String)carResult.get("start");
                date += (" " + (String)carResult.get("End"));
         String time = (String)carResult.get("start_time");
                time +=(" " + (String)carResult.get("end_time"));
         carInfo.put("date", date);
         carInfo.put("time", time);
         
         mav.addObject("user_car" , carInfo);
         mav.addObject("carList" , carmodel);
      }catch(Exception e) {
         return mav;  
      }
      return mav;
   }

}