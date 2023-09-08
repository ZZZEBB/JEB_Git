package com.spring.ctc.admin.sales.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ctc.admin.sales.dao.AdminSalesDAO;
import com.spring.ctc.joinandlogin.vo.MemberVO;
import com.spring.ctc.order.vo.OrderVO;

@Service("adminSalesService")
public class AdminSalesServiceImpl implements AdminSalesService{
	@Autowired
	AdminSalesDAO adminSalesDAO;
	
	public List<OrderVO> selectAllOrderList(MemberVO memberInfo) throws Exception{
		return adminSalesDAO.selectAllOrderList(memberInfo);
	}

}
