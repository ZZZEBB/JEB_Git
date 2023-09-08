package com.spring.ctc.goods.pack.service;

import java.util.List;

import com.spring.ctc.goods.GoodsVO;

public interface GoodsPackService {
   
   public List<GoodsVO> selectPackageAllList() throws Exception;
   public List<GoodsVO> selectPackageDetailList(String package_name) throws Exception;

}