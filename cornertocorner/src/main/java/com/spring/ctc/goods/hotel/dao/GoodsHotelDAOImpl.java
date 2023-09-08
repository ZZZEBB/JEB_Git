package com.spring.ctc.goods.hotel.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ctc.goods.GoodsVO;

@Repository("hotelDAO")
public class GoodsHotelDAOImpl implements GoodsHotelDAO {
   
   @Autowired
   private SqlSession sqlsession;

   @Override
   public List<GoodsVO> selectHotelAllList() throws DataAccessException {
      List<GoodsVO> hotel = sqlsession.selectList("mapper.goods.hotelAllList");
      return hotel;
   }

   @Override
   public List<GoodsVO> selectHotelDetailList(String goods_code) throws DataAccessException {
      List<GoodsVO> hotel = sqlsession.selectList("mapper.goods.hotelDetailList", goods_code);
      return hotel;
   }
   
   
   
   
}