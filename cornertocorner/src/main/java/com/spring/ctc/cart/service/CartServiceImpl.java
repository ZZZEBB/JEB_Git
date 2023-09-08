package com.spring.ctc.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ctc.cart.dao.CartDAO;
import com.spring.ctc.cart.vo.CartVO;
import com.spring.ctc.goods.GoodsVO;
import com.sun.mail.imap.protocol.ID;

@Service("cartService")
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;
	
	public Map<String, List> cartList(CartVO cartVO) throws Exception {
		Map<String, List> cartMap = new HashMap<String, List>();
		List<CartVO> myCartList = cartDAO.selectCartList(cartVO);
		System.out.println(myCartList);
		if(myCartList.size()==0) {
			return null;
		}
		List<GoodsVO> myGoodsList =cartDAO.selectGoodsList(myCartList);
		cartMap.put("myCartList", myCartList);
		cartMap.put("myGoodsList",myGoodsList);
		return cartMap;
		}

	@Override
	public boolean findCartGoods(CartVO cartVO) throws Exception {
		return cartDAO.selectCountInCart(cartVO);
	}

	@Override
	public void addGoodsInCart(CartVO cartVO) throws Exception {
		cartDAO.insertGoodsInCart(cartVO);
		
	}
	
	@Override 
	public boolean modifyCartQty(CartVO cartVO) throws Exception {
		boolean result=true; 
		cartDAO.updateCartGoodsQty(cartVO); 
		return result; 
	}
	 

	@Override
	public void removeCartGoods(Map <String,String> goods) throws Exception {
		cartDAO.deleteCartGoods(goods);
		
	}
	
	

	
	

}
