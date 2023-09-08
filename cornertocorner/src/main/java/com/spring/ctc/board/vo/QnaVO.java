package com.spring.ctc.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("qnaVO")
public class QnaVO {
	private String member_id;
	private int qna_num;
	private int qna_answer_num;
	private String goods_code;
	private String board_fileName;
	private String qna_type;
	private String qna_title;
	private String qna_content;
	private String qna_status;
	private Date qna_write_date;
	
	public QnaVO() {}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
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

	public String getGoods_code() {
		return goods_code;
	}

	public void setGoods_code(String goods_code) {
		this.goods_code = goods_code;
	}

	public String getQna_type() {
		return qna_type;
	}

	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getQna_write_date() {
		return qna_write_date;
	}

	public void setQna_write_date(Date qna_write_date) {
		this.qna_write_date = qna_write_date;
	}


	public String getBoard_fileName() {
		try {
			if (board_fileName != null && board_fileName.length() != 0) {
				board_fileName = URLDecoder.decode(board_fileName, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return board_fileName;
	}

	public void setBoard_fileName(String board_fileName) {
		try {
			if(board_fileName!= null && board_fileName.length()!=0) {
				this.board_fileName = URLEncoder.encode(board_fileName,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getQna_status() {
		return qna_status;
	}

	public void setQna_status(String qna_status) {
		this.qna_status = qna_status;
	}
	
	
}
