package com.spring.ctc.goods.flight.service;

import java.util.List;
import java.util.Map;

import com.spring.ctc.goods.GoodsVO;

public interface GoodsFlightService {
	public List<GoodsVO> selectListFlight(Map keyword)throws Exception;
}
