package com.spring.ctc.admin.sales.service;

import java.util.List;

import com.spring.ctc.joinandlogin.vo.MemberVO;
import com.spring.ctc.order.vo.OrderVO;

public interface AdminSalesService {
	
	public List<OrderVO> selectAllOrderList(MemberVO memberInfo) throws Exception;

}
