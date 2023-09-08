package com.spring.ctc.goods.pack.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface GoodsPackController {
   
   public ModelAndView goodsPackageSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
   public ModelAndView goodsPackageDetail(@RequestParam("package_name") String package_name, HttpServletRequest request, HttpServletResponse response) throws Exception;
}