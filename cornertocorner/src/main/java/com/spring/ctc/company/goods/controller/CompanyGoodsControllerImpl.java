package com.spring.ctc.company.goods.controller;

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

import com.spring.ctc.company.goods.service.CompanyGoodsService;
import com.spring.ctc.joinandlogin.vo.CompanyVO;
import com.spring.ctc.order.vo.OrderVO;

@Controller("companyGoods")
@RequestMapping(value="/comGoods")
public class CompanyGoodsControllerImpl implements CompanyGoodsController{
   
   
}