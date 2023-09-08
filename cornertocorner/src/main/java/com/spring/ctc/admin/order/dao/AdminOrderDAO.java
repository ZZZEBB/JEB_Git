package com.spring.ctc.admin.order.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.ctc.joinandlogin.vo.MemberVO;
import com.spring.ctc.order.vo.OrderVO;

public interface AdminOrderDAO {

	public List<OrderVO> selectAllOrderList(MemberVO memberInfo) throws DataAccessException;
}
