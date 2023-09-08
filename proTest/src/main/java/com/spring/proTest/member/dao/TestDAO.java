package com.spring.proTest.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface TestDAO {
	public List listTests() throws DataAccessException;

}
