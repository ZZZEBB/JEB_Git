package com.spring.ctc.main.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("mainDAO")
public class MainDAOImpl implements MainDAO{
	@Autowired
	private SqlSession sqlSession;
	
	/*
	 * @Override public List<String> selectKeywordSearch(String keyword) throws
	 * DataAccessException { List<String>
	 * list=(ArrayList)sqlSession.selectList("mapper.main.selectKeywordSearch",
	 * keyword); return list; }
	 */

}
