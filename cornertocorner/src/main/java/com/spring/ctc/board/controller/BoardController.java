package com.spring.ctc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface BoardController {
	
	//이벤트 목록 조회(/eventList.do)
	public ModelAndView eventList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//이벤트 상세 조회(/eventDetail.do)
	public ModelAndView eventDetail(@RequestParam("event_num") int event_num, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//고객센터 - 1:1 문의 페이지 이동 (/oneQnaForm.do)
	public ModelAndView oneQnaForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//고객센터 메인 - 자주묻는질문 페이지 이동(/faq.do)
	public ModelAndView faq(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//고객센터 - 공지사항 목록 페이지 이동(/noticeList.do)
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//고객센터 - 공지사항 상세 페이지 이동(/noticeDetail.do)
	public ModelAndView noticeDetail(@RequestParam("notice_num") int notice_num, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity addNewQna(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
}
