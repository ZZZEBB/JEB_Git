package com.spring.proTest.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface TestService {
	public List listMembers() throws DataAccessException;

}
