package com.spring.ctc.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ctc.goods.GoodsVO;

@Repository("adminGoodsDAO")
public class AdminGoodsDAOImpl implements AdminGoodsDAO{
   @Autowired
   private SqlSession sqlSession;
   
    public List<GoodsVO> selectMyOrderHistory(Map dateMap) throws DataAccessException {
       List<GoodsVO> myOrderHistList = (List)sqlSession.selectList("mapper.admin.selectMyOrderHistoryList", dateMap);
       return myOrderHistList;
    }
    
    public List<GoodsVO> selectAllGoodsList(Map dateMap) throws DataAccessException {
        List<GoodsVO> allGoodsList = (List)sqlSession.selectList("mapper.admin.selectAllGoodsList", dateMap);
        return allGoodsList;
     }
    
}