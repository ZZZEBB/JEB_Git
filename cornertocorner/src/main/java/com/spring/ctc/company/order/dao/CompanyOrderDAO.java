package com.spring.ctc.company.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ctc.order.vo.OrderVO;

public interface CompanyOrderDAO {
	
	public List<OrderVO> selectComList() throws DataAccessException;
	public List<OrderVO> comOrderFind(Map find) throws DataAccessException;

}
