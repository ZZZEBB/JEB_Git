package com.spring.ctc.order.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.ctc.order.vo.OrderVO;


public interface OrderDAO {
   public List<OrderVO> orderList() throws DataAccessException;
   public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws DataAccessException;
   public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException;
   public OrderVO findMyOrder(String order_num) throws DataAccessException;
   public void removeGoodsFromCart(List<OrderVO> myOrderList) throws DataAccessException;
}