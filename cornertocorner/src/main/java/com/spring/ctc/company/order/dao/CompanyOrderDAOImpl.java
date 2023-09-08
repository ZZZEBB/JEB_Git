package com.spring.ctc.company.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ctc.order.vo.OrderVO;

@Repository("companyOrderDAO")
public class CompanyOrderDAOImpl implements CompanyOrderDAO {
	
	@Autowired
   private SqlSession sqlSession;
   
   //사업자 모드 - 메인(예약관리 페이지)
   public List<OrderVO> selectComList() throws DataAccessException{
      List<OrderVO> comOrder = sqlSession.selectList("mapper.company.selectReservationList");
      return comOrder;
   }
   
   //예약목록 조회
   public List<OrderVO> comOrderFind(Map find) throws DataAccessException{
      List<OrderVO> comOrder = sqlSession.selectList("mapper.company.selectCompanyOrderList",find);
      return comOrder;
   }

}
