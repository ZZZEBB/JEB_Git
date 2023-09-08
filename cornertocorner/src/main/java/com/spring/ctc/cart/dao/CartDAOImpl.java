package com.spring.ctc.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ctc.cart.vo.CartVO;
import com.spring.ctc.goods.GoodsVO;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException {
		List<CartVO> cartList =(List) sqlSession.selectList("mapper.cart.selectCartList",cartVO);
		return cartList;
	}
	
	public List<GoodsVO> selectGoodsList(List<CartVO> cartList) throws DataAccessException {
		
		List<GoodsVO> myGoodsList;
		myGoodsList = sqlSession.selectList("mapper.cart.selectGoodsList",cartList);
		return myGoodsList;
	}

	@Override
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException {
		String  result =sqlSession.selectOne("mapper.cart.selectCountInCart",cartVO);
		return Boolean.parseBoolean(result);
	}

	@Override
	public void insertGoodsInCart(CartVO cartVO) throws DataAccessException {
		int cart_id=selectMaxCartId();
		cartVO.setCart_id(cart_id);
		sqlSession.insert("mapper.cart.insertGoodsInCart",cartVO);
		
	}
	

	@Override
	public void updateCartGoodsQty(CartVO cartVO) throws DataAccessException {
		sqlSession.insert("mapper.cart.updateCartGoodsQty",cartVO);		
	}

	@Override
	public void deleteCartGoods(Map <String,String> goods) throws DataAccessException {
		sqlSession.delete("mapper.cart.deleteCartGoods",goods);
		
	}
	
	private int selectMaxCartId() throws DataAccessException{
		int cart_id =sqlSession.selectOne("mapper.cart.selectMaxCartId");
		return cart_id;
	}
	
	
	
	
	
	

}
