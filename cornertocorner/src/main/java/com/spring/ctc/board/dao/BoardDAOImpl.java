package com.spring.ctc.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ctc.board.vo.EventVO;
import com.spring.ctc.board.vo.FaqVO;
import com.spring.ctc.board.vo.NoticeVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<EventVO> eventLists() throws DataAccessException {
		List<EventVO> eventLists = (ArrayList) sqlSession.selectList("mapper.board.eventList");
	   return eventLists;
	}
	
	@Override
	public Map selectEventDetail(int event_num) throws DataAccessException {
	   return sqlSession.selectOne("mapper.board.selectEventDetail", event_num);
	  
	}
	
	@Override
	public List<FaqVO> selectfaqList(int classification)throws DataAccessException{
		return sqlSession.selectList("mapper.board.selectFaqList", classification);
	}
	
	@Override
   public List<NoticeVO> noticeList() throws DataAccessException {
      List<NoticeVO> noticeList = sqlSession.selectList("mapper.board.noticeAllList");
      return noticeList;
   }
	   
   @Override
   public Map selectNoticeDetail(int notice_num) throws DataAccessException {
      return sqlSession.selectOne("mapper.board.selectNoticeDetail", notice_num);
     
   }
   
   @Override
   public Integer writeNewQna(Map<String, Object> newQnaMap) throws DataAccessException {
       sqlSession.insert("mapper.board.writeNewQna", newQnaMap);
       Integer qna_num = (Integer) newQnaMap.get("qna_num");
       return qna_num;
   }

   
   @Override
	public void insertQnaImageFile(List fileList) throws DataAccessException {
	   if(fileList != null && !fileList.isEmpty()) {
		    sqlSession.insert("mapper.board.insertQnaImageFile", fileList);
		}
	}

}