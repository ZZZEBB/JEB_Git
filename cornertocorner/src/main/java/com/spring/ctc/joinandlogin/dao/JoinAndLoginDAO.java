package com.spring.ctc.joinandlogin.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ctc.joinandlogin.vo.CompanyVO;
import com.spring.ctc.joinandlogin.vo.MemberVO;

public interface JoinAndLoginDAO {
	
	/*영민*/
	public MemberVO login(Map loginMap) throws DataAccessException;
	public CompanyVO loginCom(Map loginComMap) throws DataAccessException;
	public MemberVO findId(Map findIdMap) throws DataAccessException;
	public MemberVO findPw(Map findPwMap) throws DataAccessException;
	public CompanyVO findIdCom(Map findIdComMap) throws DataAccessException;
	public CompanyVO findPwCom(Map findPwComMap) throws DataAccessException;
	
	/*민선*/
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	public void insertNewCom(CompanyVO companyVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	

	   
	   

}
