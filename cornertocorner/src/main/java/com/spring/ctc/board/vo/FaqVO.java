package com.spring.ctc.board.vo;

import java.sql.Date;

public class FaqVO {
	private int faq_num;
	private String faq_title;
	private String faq_content;
	private Date faq_write_date;
	private int faq_category;
	
	
	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public Date getFaq_write_date() {
		return faq_write_date;
	}
	public void setFaq_write_date(Date faq_write_date) {
		this.faq_write_date = faq_write_date;
	}
	public int getFaq_category() {
		return faq_category;
	}
	public void setFaq_category(int faq_category) {
		this.faq_category = faq_category;
	}
	
}
