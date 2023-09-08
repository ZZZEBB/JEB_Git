package com.spring.ctc.admin.order.service;

import java.util.List;

import com.spring.ctc.joinandlogin.vo.MemberVO;
import com.spring.ctc.order.vo.OrderVO;

public interface AdminOrderService {
	
	public List<OrderVO> selectAllOrderList(MemberVO memberInfo) throws Exception;

}
