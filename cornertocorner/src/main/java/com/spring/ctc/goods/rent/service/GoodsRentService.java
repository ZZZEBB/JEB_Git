package com.spring.ctc.goods.rent.service;

import java.util.List;
import java.util.Map;

import com.spring.ctc.goods.GoodsVO;

public interface GoodsRentService {
	public List<GoodsVO> selectRentList(Map keyword) throws Exception;
	public List<GoodsVO> selectRentAllList() throws Exception;
	public List<GoodsVO> selectRentDetail(String car_name) throws Exception;
}
