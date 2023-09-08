package com.spring.ctc.joinandlogin.service;

import java.util.Map;

import com.spring.ctc.joinandlogin.vo.CompanyVO;
import com.spring.ctc.joinandlogin.vo.MemberVO;

public interface JoinAndLoginService {
	/*영민*/
	public MemberVO login(Map  loginMap) throws Exception;
	   public CompanyVO loginCom(Map loginComMap) throws Exception;
	   
	   public MemberVO findId(Map findIdMap) throws Exception;
	   public MemberVO findPw(Map findPwMap) throws Exception;
	   public CompanyVO findIdCom(Map loginIdComMap) throws Exception;
	   public CompanyVO findPwCom(Map findPwComMap) throws Exception;
	   /*민선*/
	public void addMember(MemberVO memberVO) throws Exception;
	public String overlapped(String id) throws Exception;
	public void addCom(CompanyVO companyVO) throws Exception;
}
