package com.spring.ctc.goods.rent.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface GoodsRentController {
   public ModelAndView goodsRentSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
      @RequestMapping(value="/goodsRentDetail.do" ,method = {RequestMethod.GET,RequestMethod.POST})
      public ModelAndView goodsRentDetail(@RequestParam("car_name") String car_name ,
                                    @RequestParam("user_date") String user_date ,
                                    @RequestParam("user_time") String user_time ,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
   public ModelAndView goodsSearch( @RequestParam Map<String,String> carResult, HttpServletRequest request, HttpServletResponse response) throws Exception;
}