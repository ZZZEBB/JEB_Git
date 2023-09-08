package com.spring.ctc.goods.rent.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;


import com.spring.ctc.goods.GoodsVO;

public interface GoodsRentDAO {
	public List<GoodsVO> selectListRent(Map keyword) throws DataAccessException;
	 public List<GoodsVO> selectRentAllList() throws DataAccessException;
	 public List<GoodsVO> selectRentDetailList(String car_name) throws DataAccessException;
}
