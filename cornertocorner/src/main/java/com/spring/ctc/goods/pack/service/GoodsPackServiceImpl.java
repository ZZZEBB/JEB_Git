package com.spring.ctc.goods.pack.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ctc.goods.pack.dao.GoodsPackDAO;
import com.spring.ctc.goods.GoodsVO;

@Service("packService")
public class GoodsPackServiceImpl implements GoodsPackService {
   @Autowired
   private GoodsPackDAO goodsPackDAO;

   @Override
   public List<GoodsVO> selectPackageAllList() throws Exception {
      return goodsPackDAO.selectPackageAllList();
   }

   @Override
   public List<GoodsVO> selectPackageDetailList(String package_name) throws Exception {
      return goodsPackDAO.selectPackageDetailList(package_name);
   }
   
   
}