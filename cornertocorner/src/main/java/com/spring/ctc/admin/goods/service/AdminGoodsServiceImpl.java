package com.spring.ctc.admin.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ctc.admin.goods.dao.AdminGoodsDAO;
import com.spring.ctc.goods.GoodsVO;

@Service("adminGoodsService")
public class AdminGoodsServiceImpl implements AdminGoodsService{
   
   @Autowired
   private AdminGoodsDAO adminGoodsDAO;
   
    public List<GoodsVO> listMyOrderHistory(Map dateMap) throws Exception {
         return adminGoodsDAO.selectMyOrderHistory(dateMap);
    }
    
    public List<GoodsVO> selectAllGoodsList(Map dateMap) throws Exception {
        return adminGoodsDAO.selectAllGoodsList(dateMap);
   }
}