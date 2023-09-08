package com.spring.ctc.goods.hotel.service;

import java.util.List;

import com.spring.ctc.goods.GoodsVO;

public interface GoodsHotelService {
   
   public List<GoodsVO> selectHotelAllList() throws Exception;
   public List<GoodsVO> selectHotelDetailList(String goods_code) throws Exception; 

}