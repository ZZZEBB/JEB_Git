package com.spring.ctc.mypage.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component("reviewVO")
public class ReviewVO {
   private String member_id;
   private int review_num;
   private int parent_num;
   private String goods_code;
   private String review_title;
   private String review_content;
   private Date review_write_date;
   private String imageFileName;
   
   public ReviewVO() {
      
   }
   public String getMember_id() {
      return member_id;
   }
   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }
   public int getReview_num() {
      return review_num;
   }
   public void setReview_num(int review_num) {
      this.review_num = review_num;
   }
   public int getParent_num() {
      return parent_num;
   }
   public void setParent_num(int parent_num) {
      this.parent_num = parent_num;
   }
   public String getGoods_code() {
      return goods_code;
   }
   public void setGoods_code(String goods_code) {
      this.goods_code = goods_code;
   }
   public String getReview_content() {
      return review_content;
   }
   public void setReview_content(String review_content) {
      this.review_content = review_content;
   }
   public Date getReview_write_date() {
      return review_write_date;
   }
   public void setReview_write_date(Date review_write_date) {
      this.review_write_date = review_write_date;
   }
   public String getReview_title() {
      return review_title;
   }
   public void setReview_title(String review_title) {
      this.review_title = review_title;
   }
   public String getImageFileName() {
      try {
         if (imageFileName != null && imageFileName.length() != 0) {
            imageFileName = URLDecoder.decode(imageFileName, "UTF-8");
         }
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      return imageFileName;
   }
   public void setImageFileName(String imageFileName) {
      try {
         if (imageFileName!= null && imageFileName.length()!=0) {
            this.imageFileName = URLEncoder.encode(imageFileName, "UTF-8");
         }
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
   }
   


}