package com.spring.ctc.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

/*@Component("boardDetailImageVO")*/
public class BoardDetailImageVO {
	private int board_image_id;
	private int event_num;
	private int faq_num;
	private int notice_num;
	private int qna_num;
	private int qna_answer_num;
	private int review_num;
	private String board_fileName;
	private String board_reg_id;
	private String board_fileType;
	private Date board_Credate;
	private String board_filePath;

	
	public BoardDetailImageVO(){}

	public int getBoard_image_id() {
		return board_image_id;
	}

	public void setBoard_image_id(int board_image_id) {
		this.board_image_id = board_image_id;
	}

	public int getEvent_num() {
		return event_num;
	}

	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}

	public int getFaq_num() {
		return faq_num;
	}

	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}

	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public int getQna_answer_num() {
		return qna_answer_num;
	}

	public void setQna_answer_num(int qna_answer_num) {
		this.qna_answer_num = qna_answer_num;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getBoard_fileName() {
		return board_fileName;
	}

	public void setBoard_fileName(String board_fileName) {
		try {
			if(board_fileName != null && board_fileName.length() !=0) {
				this.board_fileName = URLEncoder.encode(board_fileName,"UTF-8");
			}
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getBoard_reg_id() {
		return board_reg_id;
	}

	public void setBoard_reg_id(String board_reg_id) {
		this.board_reg_id = board_reg_id;
	}

	public String getBoard_fileType() {
		return board_fileType;
	}

	public void setBoard_fileType(String board_fileType) {
		this.board_fileType = board_fileType;
	}

	public Date getBoard_Credate() {
		return board_Credate;
	}

	public void setBoard_Credate(Date board_Credate) {
		this.board_Credate = board_Credate;
	}

	public String getBoard_filePath() {
		return board_filePath;
	}

	public void setBoard_filePath(String board_filePath) {
		this.board_filePath = board_filePath;
	}
	
	
}
