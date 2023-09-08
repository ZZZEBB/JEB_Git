package com.spring.ctc.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ctc.board.vo.QnaVO;
import com.spring.ctc.joinandlogin.vo.CompanyVO;
import com.spring.ctc.joinandlogin.vo.MemberVO;
import com.spring.ctc.mypage.vo.ReviewVO;
import com.spring.ctc.order.vo.OrderVO;

public interface MypageDAO {
	
	public MemberVO selectMember(String member_id) throws DataAccessException;
	public CompanyVO selectCompany(String company_id) throws DataAccessException;
	public List<QnaVO> myQnaList(QnaVO qnaVO) throws DataAccessException;
	public List<OrderVO> selectOrder(MemberVO memberInfo) throws DataAccessException;
	public void updateMember(Map memberInfo) throws DataAccessException;
	public void deleteMember(Map member) throws DataAccessException;
	public void deleteCompany(Map company)throws DataAccessException;
	public List<OrderVO> checkMileage() throws DataAccessException;
	public List<OrderVO> selectMyOrderHistory(Map dateMap) throws DataAccessException;
	public List<ReviewVO> reviewList(String member_id) throws DataAccessException;
	public ReviewVO reviewDetail(int review_num) throws DataAccessException;
	public int insertNewReview(Map reviewMap) throws DataAccessException;
	public void updateReview(Map reviewMap) throws DataAccessException;
	public void deleteReview(int review_num) throws DataAccessException;
	public List selectImageFileList(int review_num) throws DataAccessException;
}
