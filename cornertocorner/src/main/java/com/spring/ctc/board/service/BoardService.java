package com.spring.ctc.board.service;

import java.util.List;
import java.util.Map;

import com.spring.ctc.board.vo.EventVO;
import com.spring.ctc.board.vo.FaqVO;
import com.spring.ctc.board.vo.NoticeVO;
public interface BoardService {

	public List<EventVO> eventList() throws Exception;
	public Map eventDetail(int event_num) throws Exception;
	public List<FaqVO> faqList(int classification)throws Exception;
	public List<NoticeVO> noticeList() throws Exception;
	public Map noticeDetail(int notice_num) throws Exception;
	
	public int addNewQna(Map<String, Object> newQnaMap) throws Exception;
}
