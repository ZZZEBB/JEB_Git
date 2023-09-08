package com.spring.ctc.admin.goods.service;

import java.util.List;
import java.util.Map;

import com.spring.ctc.goods.GoodsVO;

public interface AdminGoodsService {

	public List<GoodsVO> listMyOrderHistory(Map dateMap) throws Exception;
	
	public List<GoodsVO> selectAllGoodsList(Map dateMap) throws Exception;
}
