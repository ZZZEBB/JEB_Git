package com.spring.ctc.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ctc.board.vo.QnaVO;
import com.spring.ctc.joinandlogin.vo.CompanyVO;
import com.spring.ctc.joinandlogin.vo.MemberVO;
import com.spring.ctc.mypage.vo.ImageVO;
import com.spring.ctc.mypage.vo.ReviewVO;
import com.spring.ctc.order.vo.OrderVO;


@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO {
   @Autowired
   private SqlSession sqlSession;
   
   @Override
   public MemberVO selectMember(String member_id) throws DataAccessException{
		MemberVO member = sqlSession.selectOne("mapper.mypage.selectMyMember", member_id);
		System.out.println(member);
		return member;
   }
   
   @Override
   public CompanyVO selectCompany(String company_id) throws DataAccessException{
	   CompanyVO com = sqlSession.selectOne("mapper.mypage.selectMyCompany", company_id);
	   return com;
   }
   
   //나의 문의내역
   public List<QnaVO> myQnaList(QnaVO qnaVO) throws DataAccessException {
	   List<QnaVO> myQnaList = sqlSession.selectList("mapper.board.myQnaList", qnaVO);
	   return myQnaList;
	}
   
   //상품결제목록 출력
   @Override
   public List<OrderVO> selectOrder(MemberVO memberInfo) throws DataAccessException{
	   List<OrderVO> revervation = sqlSession.selectList("mapper.mypage.selectOrderList", memberInfo);
	   return revervation;
   }
   
   public void updateMember(Map memberInfo) throws DataAccessException{
	   sqlSession.update("mapper.mypage.updateMember",memberInfo);
   }
   
   public void deleteMember(Map member) throws DataAccessException{
	      sqlSession.update("mapper.mypage.deleteMember",member);
	   }
   
   public void deleteCompany(Map company)throws DataAccessException{
	      sqlSession.update("mapper.mypage.deleteCompany",company);
	   }
   
   @Override
   public List<OrderVO> checkMileage() throws DataAccessException {
      List<OrderVO> mileage = sqlSession.selectList("mapper.order.checkMileage");
      return mileage;
   }

   @Override
   public List<OrderVO> selectMyOrderHistory(Map dateMap) throws DataAccessException {
      List<OrderVO> myOrderHistList = (List)sqlSession.selectList("mapper.order.selectMyOrderHistoryList", dateMap);
      return myOrderHistList;
   }

   @Override
   public List<ReviewVO> reviewList(String member_id) throws DataAccessException {
      List<ReviewVO> review = sqlSession.selectList("mapper.mypage.reviewList", member_id);
      return review;
   }

   @Override
   public ReviewVO reviewDetail(int review_num) throws DataAccessException {
      return sqlSession.selectOne("mapper.mypage.reviewDetail", review_num);
   }

   @Override
   public int insertNewReview(Map reviewMap) throws DataAccessException {
      int review_num = selectNewReview_num();
      reviewMap.put("review_num", review_num);
      sqlSession.insert("mapper.mypage.insertNewReview", reviewMap);
      return review_num;
   }

   @Override
   public void updateReview(Map reviewMap) throws DataAccessException {
      sqlSession.update("mapper.mypage.updateReview", reviewMap);
      
   }

   @Override
   public void deleteReview(int review_num) throws DataAccessException {
      sqlSession.delete("mapper.mypage.deleteReview", review_num);
      
   }

   @Override
   public List selectImageFileList(int review_num) throws DataAccessException {
      List<ImageVO> imageFileList = null;
      imageFileList = sqlSession.selectList("mapper.mypage.selectImageFileList", review_num);
      return imageFileList;   
   }
   
   private int selectNewReview_num() throws DataAccessException {
      return sqlSession.selectOne("mapper.mypage.selectNewReviewNO");
   }
   
   private int selectNewImageFileNO() throws DataAccessException {
      return sqlSession.selectOne("mapper.board.selectNewImageFileNO");
   }
 }