package com.spring.ctc.goods.rent.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ctc.goods.GoodsVO;


@Repository("rentDAO")
public class GoodsRentDAOImpl implements GoodsRentDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	//최초전체페이지
	 @Override 
	 public List<GoodsVO> selectListRent(Map keyword) throws DataAccessException{
		 List<GoodsVO> rent = sqlSession.selectList("mapper.goods.rentList",keyword);
		 
		 return rent;
	 } 
	 //검색조건으로 상품조회
	 @Override
	 public List<GoodsVO> selectRentAllList() throws DataAccessException{
		 List<GoodsVO> rent = sqlSession.selectList("mapper.goods.rentAllList");
		 return rent;
	 }
	 //디테일페이지 상품조회
	 @Override
	 public List<GoodsVO> selectRentDetailList(String car_name) throws DataAccessException{
		 List<GoodsVO> rent = sqlSession.selectList("mapper.goods.rentOneList",car_name);
		 return rent;
	 }
}
