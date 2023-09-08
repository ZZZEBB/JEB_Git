package com.spring.ctc.goods.hotel.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.ctc.goods.GoodsVO;

public interface GoodsHotelDAO {
   public List<GoodsVO> selectHotelAllList() throws DataAccessException;
   public List<GoodsVO> selectHotelDetailList(String goods_code) throws DataAccessException; 

}