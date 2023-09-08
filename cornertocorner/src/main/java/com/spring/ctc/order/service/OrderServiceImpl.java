package com.spring.ctc.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ctc.order.vo.OrderVO;
import com.spring.ctc.order.dao.OrderDAO;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
    @Autowired
    private OrderDAO orderDAO;

   @Override
   public List<OrderVO> orderList() throws Exception {
      return orderDAO.orderList();
   }

   @Override
   public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception {
      List<OrderVO> orderGoodsList;
      orderGoodsList=orderDAO.listMyOrderGoods(orderVO);
      return orderGoodsList;
      
      
      
   }

   @Override
   public void addNewOrder(List<OrderVO> myOrderList) throws Exception {
      orderDAO.insertNewOrder(myOrderList);
      orderDAO.removeGoodsFromCart(myOrderList);
      
   }

   @Override
   public OrderVO findMyOrder(String order_num) throws Exception {
      return orderDAO.findMyOrder(order_num);
   }
   
   

   
}