package com.spring.ctc.joinandlogin.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ctc.joinandlogin.vo.CompanyVO;
import com.spring.ctc.joinandlogin.vo.MemberVO;

@Repository
public class JoinAndLoginDAOImpl implements JoinAndLoginDAO{
	
	@Autowired 
	private SqlSession sqlSession;
	
		/*영민*/
	   /* 회원 로그인 */
	   @Override
	   public MemberVO login(Map loginMap) throws DataAccessException {
	      MemberVO member=(MemberVO)sqlSession.selectOne("mapper.login.login",loginMap);
	      return member;
	   }

	   /* 사업체 로그인 */
	   @Override
	   public CompanyVO loginCom(Map loginComMap) throws DataAccessException {
	      CompanyVO company=(CompanyVO)sqlSession.selectOne("mapper.login.loginCom", loginComMap);
	      return company;
	   }

	   /* 아이디 찾기 */
	   @Override
	   public MemberVO findId(Map findIdMap) throws DataAccessException {
	      MemberVO member=(MemberVO)sqlSession.selectOne("mapper.login.findId", findIdMap);
	      return member;
	   }

	   /* 아이디 찾기 */
	   @Override
	   public MemberVO findPw(Map findPwMap) throws DataAccessException {
	      MemberVO member=(MemberVO)sqlSession.selectOne("mapper.login.findPw", findPwMap);
	      return member;
	   }

	   /* 사업체 아이디 찾기 */
	   @Override
	   public CompanyVO findIdCom(Map findIdComMap) throws DataAccessException {
	      System.out.println(findIdComMap.get("com_name"));
	      CompanyVO company=(CompanyVO)sqlSession.selectOne("mapper.login.findIdCom", findIdComMap);
	      return company;
	   }

	   /* 사업체 아이디 찾기 */
	   @Override
	   public CompanyVO findPwCom(Map findPwComMap) throws DataAccessException {
	      CompanyVO company=(CompanyVO)sqlSession.selectOne("mapper.login.findPwCom", findPwComMap);
	      return company;
	   }
	   /*민선*/
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.login.insertNewMember",memberVO);
	}
	
	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.login.selectOverlappedID",id);
		return result;
	}
	@Override
	public void insertNewCom(CompanyVO companyVO) throws DataAccessException{
		sqlSession.insert("mapper.login.insertNewCom",companyVO);
	}
}
