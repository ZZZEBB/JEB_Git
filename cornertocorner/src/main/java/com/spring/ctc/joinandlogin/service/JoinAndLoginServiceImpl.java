package com.spring.ctc.joinandlogin.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ctc.joinandlogin.dao.JoinAndLoginDAO;
import com.spring.ctc.joinandlogin.vo.CompanyVO;
import com.spring.ctc.joinandlogin.vo.MemberVO;

@Service
public class JoinAndLoginServiceImpl implements JoinAndLoginService{
	
	@Autowired
	private JoinAndLoginDAO joinAndLoginDAO;
	
	/*영민*/
	@Override
	   public MemberVO login(Map loginMap) throws Exception {
	      return joinAndLoginDAO.login(loginMap);
	   }
	   

	   @Override
	   public CompanyVO loginCom(Map loginComMap) throws Exception {
	      return joinAndLoginDAO.loginCom(loginComMap);
	   }
	   


	   @Override
	      public MemberVO findId(Map findIdMap) throws Exception {
	         return joinAndLoginDAO.findId(findIdMap);
	      }


	   @Override
	   public MemberVO findPw(Map findPwMap) throws Exception {
	       return joinAndLoginDAO.findPw(findPwMap);
	   }


	   @Override
	   public CompanyVO findIdCom(Map findIdComMap) throws Exception {
	      System.out.println(findIdComMap.get("com_name"));
	      System.out.println(findIdComMap.get("com_email"));
	      return joinAndLoginDAO.findIdCom(findIdComMap);
	   }


	   @Override
	   public CompanyVO findPwCom(Map findPwComMap) throws Exception {
	      return joinAndLoginDAO.findPwCom(findPwComMap);
	   }
	  /*민선*/
	@Override
	public void addMember(MemberVO memberVO) throws Exception{
		joinAndLoginDAO.insertNewMember(memberVO);
	}
	
	@Override
	public void addCom(CompanyVO companyVO) throws Exception{
		joinAndLoginDAO.insertNewCom(companyVO);
	}
	
	@Override
	public String overlapped(String id) throws Exception{
		return joinAndLoginDAO.selectOverlappedID(id);
	}
}
