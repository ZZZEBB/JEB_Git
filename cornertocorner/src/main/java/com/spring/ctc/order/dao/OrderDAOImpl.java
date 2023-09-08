package com.spring.ctc.order.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ctc.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO{
   
    @Autowired
      private SqlSession sqlsession;

   @Override
   public List<OrderVO> orderList() throws DataAccessException {
      List<OrderVO> order = sqlsession.selectList("mapper.order.orderList");
         return order;
   }

   @Override
   public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws DataAccessException {
      List<OrderVO> orderGoodsList = new ArrayList<OrderVO>();
      orderGoodsList=(ArrayList)sqlsession.selectList("mapper.order.selectMyOrderList", orderVO);
      return orderGoodsList;
   }

   @Override
   public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException {
		/* int order_num = selectOrderID(); */
      for(int i=0; i<myOrderList.size();i++) {
         OrderVO orderVO = (OrderVO)myOrderList.get(i);
         sqlsession.insert("mapper.order.insertNewOrder", orderVO);
      }
   }

   @Override
   public OrderVO findMyOrder(String order_num) throws DataAccessException {
      OrderVO orderVO =(OrderVO) sqlsession.selectOne("mapper.order.selectMyOrder", order_num);
      return orderVO;
   }
   
   /*
   public void removeGoodsFromCart(OrderVO orderVO) throws DataAccessException {
      sqlsession.delete("mapper.order.deleteGoodsFromCart", orderVO);
   }
     */ 
   @Override
   public void removeGoodsFromCart(List<OrderVO> myOrderList) throws DataAccessException {
      for(int i=0; i<myOrderList.size();i++) {
         OrderVO orderVO = (OrderVO) myOrderList.get(i);
         sqlsession.delete("mapper.order.deleteGoodsFromCart", orderVO);
      }
      
   }
   
   private int selectOrderID() throws DataAccessException{
      return sqlsession.selectOne("mapper.order.selectOrderID");
   }
   
   

   
}