package com.spring.ctc.board.vo;

import java.util.Date;

public class NoticeVO {
   private int notice_num;
   private String notice_title;
   private String notice_content;
   private Date notice_write_date;
   private String notice_category;
   
   public int getNotice_num() {
      return notice_num;
   }
   public void setNotice_num(int notice_num) {
      this.notice_num = notice_num;
   }
   public String getNotice_title() {
      return notice_title;
   }
   public void setNotice_title(String notice_title) {
      this.notice_title = notice_title;
   }
   public String getNotice_content() {
      return notice_content;
   }
   public void setNotice_content(String notice_content) {
      this.notice_content = notice_content;
   }
   public Date getNotice_write_date() {
      return notice_write_date;
   }
   public void setNotice_write_date(Date notice_write_date) {
      this.notice_write_date = notice_write_date;
   }
   public String getNotice_category() {
      return notice_category;
   }
   public void setNotice_category(String notice_category) {
      this.notice_category = notice_category;
   }
   
}