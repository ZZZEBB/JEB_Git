package com.spring.ctc.mypage.service;

import java.util.List;
import java.util.Map;

import com.spring.ctc.board.vo.QnaVO;
import com.spring.ctc.joinandlogin.vo.CompanyVO;
import com.spring.ctc.joinandlogin.vo.MemberVO;
import com.spring.ctc.mypage.vo.ReviewVO;
import com.spring.ctc.order.vo.OrderVO;

public interface MypageService {
	
	public MemberVO selectMember(String member_id) throws Exception;
	public CompanyVO selectCompany(String company_id) throws Exception;
	public List<QnaVO> myQnaList(QnaVO qnaVO) throws Exception;
	public List<OrderVO> selectOrder(MemberVO memberInfo) throws Exception;
	public void difyMember(Map memberInfo) throws Exception;
	public void deleteMember(Map member) throws Exception;
	public void deleteCompany(Map comInfo) throws Exception;
	public List<OrderVO> checkMileage() throws Exception;
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception;
	public List<ReviewVO> reviewList(String member_id) throws Exception;
	public ReviewVO reviewDetail(int review_num) throws Exception;
	public int addNewReview(Map reviewMap) throws Exception;
	public void modReview(Map reviewMap) throws Exception;
	public void removeReview(int review_num) throws Exception;
}
