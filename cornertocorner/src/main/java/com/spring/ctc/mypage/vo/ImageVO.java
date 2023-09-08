package com.spring.ctc.mypage.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;

public class ImageVO {
   private int imageFileNO;
   private String imageFileName;
   private Date regDate;
   private int review_num;
   
   public int getImageFileNO() {
      return imageFileNO;
   }
   public void setImageFileNO(int imageFileNO) {
      this.imageFileNO = imageFileNO;
   }
   public String getImageFileName() {
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
   public Date getRegDate() {
      return regDate;
   }
   public void setRegDate(Date regDate) {
      this.regDate = regDate;
   }
   public int getReview_num() {
      return review_num;
   }
   public void setReview_num(int review_num) {
      this.review_num = review_num;
   }
   

}
