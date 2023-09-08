package com.spring.ctc.goods.pack.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ctc.goods.pack.dao.GoodsPackDAO;
import com.spring.ctc.goods.pack.service.GoodsPackService;
import com.spring.ctc.goods.GoodsVO;

@Controller("PackController")
@RequestMapping(value = "/goods")
public class GoodsPackControllerImpl implements GoodsPackController {
   @Autowired
   private GoodsPackService goodsPackService;
   @Autowired
   private GoodsPackDAO goodsPackDAO;
   
   /* 패키지 목록 페이지 */
   @Override
   @RequestMapping(value = "/goodsPackageSearch.do", method = {RequestMethod.GET,RequestMethod.POST} )
   public ModelAndView goodsPackageSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String viewName = (String)request.getAttribute("viewName");
      List<GoodsVO> pack = goodsPackService.selectPackageAllList();
      ModelAndView mav = new ModelAndView(viewName);
      mav.addObject("packList", pack);
      return mav;
   }
   
   /* 패키지 상세페이지 */
   @Override
   @RequestMapping(value = "/goodsPackageDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
   public ModelAndView goodsPackageDetail(@RequestParam("package_name") String package_name, HttpServletRequest request,
                                 HttpServletResponse response) throws Exception {
      String viewName = (String)request.getAttribute("viewName");
      List<GoodsVO> packD = goodsPackService.selectPackageDetailList(package_name);
      ModelAndView mav = new ModelAndView(viewName);
      mav.addObject("packList", packD);
      return mav;
   }
   
   
   
}