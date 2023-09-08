package com.spring.ctc.company.order.service;

import java.util.List;
import java.util.Map;

import com.spring.ctc.order.vo.OrderVO;

public interface CompanyOrderService {
	
	public List<OrderVO> selectOrderList() throws Exception;
	public List<OrderVO> findOrderGoods(Map find) throws Exception;

}
