package com.spring.ctc.admin.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ctc.admin.order.dao.AdminOrderDAO;
import com.spring.ctc.joinandlogin.vo.MemberVO;
import com.spring.ctc.order.vo.OrderVO;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService{
	
	@Autowired
	AdminOrderDAO adminOrderDAO;
	
	public List<OrderVO> selectAllOrderList(MemberVO memberInfo) throws Exception{
		return adminOrderDAO.selectAllOrderList(memberInfo);
	}

}
