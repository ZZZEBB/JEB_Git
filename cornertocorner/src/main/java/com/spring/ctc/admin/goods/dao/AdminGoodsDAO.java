package com.spring.ctc.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ctc.goods.GoodsVO;

public interface AdminGoodsDAO {
	
	public List<GoodsVO> selectMyOrderHistory(Map dateMap) throws DataAccessException;

	public List<GoodsVO> selectAllGoodsList(Map dateMap) throws DataAccessException;
}
