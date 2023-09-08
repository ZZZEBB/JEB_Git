package com.spring.ctc.cart.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ctc.cart.service.CartService;
import com.spring.ctc.cart.vo.CartVO;
import com.spring.ctc.joinandlogin.vo.MemberVO;

@Controller("cartController")
@RequestMapping(value = "/cart")
public class CartControllerImpl implements CartController {
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private MemberVO memberVO;

	// 장바구니 페이지 이동(/cartList.do)
	@Override
	@RequestMapping(value = "/cartList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		cartVO.setMember_id(member_id);
		System.out.println(member_id);
		System.out.println(memberVO.getMember_id());
		Map<String, List> cartMap = cartService.cartList(cartVO);
		session.setAttribute("cartMap", cartMap);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/modifyCartQty.do" ,method = RequestMethod.POST)
	public @ResponseBody String  modifyCartQty(@RequestParam("goods_code") String goods_code,@RequestParam("cart_headcount") int cart_headcount, HttpServletRequest request, HttpServletResponse response)  throws Exception {
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String member_id=memberVO.getMember_id();
		cartVO.setGoods_code(goods_code);
		cartVO.setMember_id(member_id);
		cartVO.setCart_headcount(cart_headcount);
		boolean result=cartService.modifyCartQty(cartVO);
		
		if(result==true){
		   return "modify_success";
		}else{
		  return "modify_failed";	
		}
		
	}


	@Override
	@RequestMapping(value="/addGoodsInCart.do" ,method = RequestMethod.POST,produces = "application/text; charset=utf8")
	public @ResponseBody String addGoodsInCart(@RequestParam("goods_code")	String goods_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String member_id=memberVO.getMember_id();
		cartVO.setGoods_code(goods_code);
		cartVO.setMember_id(member_id); 
		boolean isAreadyExisted=cartService.findCartGoods(cartVO);
		System.out.println("isAreadyExisted:"+isAreadyExisted);
		if(isAreadyExisted==true){
			return "already_existed";
		}else{
			cartService.addGoodsInCart(cartVO);
			return "add_success";
		}
	}


	@Override
	@RequestMapping(value="/removeCartGoods.do" ,method = {RequestMethod.POST , RequestMethod.GET})
	public ModelAndView removeCartGoods(@RequestParam Map<String,String> goods , HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		cartService.removeCartGoods(goods);
		mav.setViewName("redirect:/cart/cartList.do");
		return mav;
	}
	
	
}
