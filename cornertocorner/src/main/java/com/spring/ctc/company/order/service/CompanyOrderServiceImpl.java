package com.spring.ctc.company.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ctc.company.order.dao.CompanyOrderDAO;
import com.spring.ctc.order.vo.OrderVO;

@Service("companyOrderService")
public class CompanyOrderServiceImpl implements CompanyOrderService {
	
	@Autowired
	   private CompanyOrderDAO companyOrderDAO;
	   
	   @Override
	   public List<OrderVO> selectOrderList() throws Exception{
	      List<OrderVO> order = companyOrderDAO.selectComList();
	      return order;
	   }
	   
	   @Override
	   public List<OrderVO> findOrderGoods(Map find) throws Exception{
	      List<OrderVO> order = companyOrderDAO.comOrderFind(find);
	      return order;
	   }

}
