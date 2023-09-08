package com.spring.ctc.goods.pack.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.ctc.goods.GoodsVO;

public interface GoodsPackDAO {
   public List<GoodsVO> selectPackageAllList() throws DataAccessException;
   public List<GoodsVO> selectPackageDetailList(String package_name) throws DataAccessException;

}