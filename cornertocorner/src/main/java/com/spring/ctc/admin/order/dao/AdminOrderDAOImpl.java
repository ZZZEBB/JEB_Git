package com.spring.ctc.admin.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ctc.joinandlogin.vo.MemberVO;
import com.spring.ctc.order.vo.OrderVO;

@Repository("adminOrderDAO")
public class AdminOrderDAOImpl implements AdminOrderDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	//전체 주문내역 조회
	@Override
	public List<OrderVO> selectAllOrderList(MemberVO memberInfo) throws DataAccessException{
		List<OrderVO> revervation = sqlSession.selectList("mapper.admin.selectAllOrderList", memberInfo);
		return revervation;
	}

}
