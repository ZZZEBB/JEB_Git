package com.spring.ctc.order.service;

import java.util.List;

import com.spring.ctc.order.vo.OrderVO;

public interface OrderService {
   public List<OrderVO> orderList() throws Exception;
   public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception;
   public void addNewOrder(List<OrderVO> myOrderList) throws Exception;
   public OrderVO findMyOrder(String order_num) throws Exception;

}