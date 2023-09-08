package com.spring.ctc.cart.service;

import java.util.List;
import java.util.Map;

import com.spring.ctc.cart.vo.CartVO;

public interface CartService {

	public Map<String, List> cartList(CartVO cartVO) throws Exception;
	public boolean findCartGoods(CartVO cartVO) throws Exception;
	public void addGoodsInCart(CartVO cartVO) throws Exception;
	public boolean modifyCartQty(CartVO cartVO) throws Exception;
	public void removeCartGoods(Map <String,String> goods) throws Exception;

}
