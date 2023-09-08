package com.spring.ctc.goods.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ctc.goods.hotel.dao.GoodsHotelDAO;
import com.spring.ctc.goods.GoodsVO;

@Service("hotelService")
public class GoodsHotelServiceImpl implements GoodsHotelService {
   @Autowired
   private GoodsHotelDAO goodsHotelDAO;

   @Override
   public List<GoodsVO> selectHotelAllList() throws Exception {
      return goodsHotelDAO.selectHotelAllList();
   }

   @Override
   public List<GoodsVO> selectHotelDetailList(String goods_code) throws Exception {
      return goodsHotelDAO.selectHotelDetailList(goods_code);
   }
   
   

}