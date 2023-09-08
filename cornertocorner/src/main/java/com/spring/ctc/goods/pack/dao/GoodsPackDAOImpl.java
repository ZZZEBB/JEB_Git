package com.spring.ctc.goods.pack.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ctc.goods.GoodsVO;

@Repository("packDAO")
public class GoodsPackDAOImpl implements GoodsPackDAO{
   
   @Autowired
   SqlSession sqlsession;

   @Override
   public List<GoodsVO> selectPackageAllList() throws DataAccessException {
      List<GoodsVO> pack = sqlsession.selectList("mapper.goods.packageAllList");
      return pack;
   }

   @Override
   public List<GoodsVO> selectPackageDetailList(String package_name) throws DataAccessException {
      List<GoodsVO> pack = sqlsession.selectList("mapper.goods.packageDetailList", package_name);
      return pack;
   }

   
}