package com.spring.ctc.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ctc.board.vo.EventVO;
import com.spring.ctc.board.vo.FaqVO;
import com.spring.ctc.board.vo.NoticeVO;

public interface BoardDAO {
	
	public List<EventVO> eventLists() throws DataAccessException;
	public Map selectEventDetail(int event_num) throws DataAccessException;
	public List<FaqVO> selectfaqList(int classification)throws DataAccessException;
	public List<NoticeVO> noticeList() throws DataAccessException;
	public Map selectNoticeDetail(int notice_num) throws DataAccessException;
	
	public void insertQnaImageFile(List fileList) throws DataAccessException;
	public Integer writeNewQna(Map<String, Object> newQnaMap) throws DataAccessException;
}
