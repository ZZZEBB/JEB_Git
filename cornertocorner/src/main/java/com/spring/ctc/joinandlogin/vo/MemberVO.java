package com.spring.ctc.joinandlogin.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
   
   private int member_num;
   private String member_id;
   private String member_pw;
   private String member_name;
   private String member_ph1;
   private String member_ph2;
   private String member_ph3;
   private String member_rrn1;
   private String member_rrn2;
   private String member_email;
   private String member_email_yn;
   private String member_zipcode;
   private String member_road_address;
   private String member_local_address;
   private String member_rest_address;
   private Date member_joindate;
   private int status;
   private Date member_unregister_date;
   private Date member_deldate;
   private int member_mileage;
   
   
   
   
   
   public int getMember_mileage() {
	return member_mileage;
}

public void setMember_mileage(int member_mileage) {
	this.member_mileage = member_mileage;
}

public MemberVO() {
      
   }
   
   public MemberVO(String member_name, String member_email) {
      this.member_name = member_name;
      this.member_email = member_email;
   }
   
   public MemberVO(String member_id, String member_rrn1, String member_rrn2) {
      this.member_id = member_id;
      this.member_rrn1 = member_rrn1;
      this.member_rrn2 = member_rrn2;
   }

   public int getMember_num() {
      return member_num;
   }

   public void setMember_num(int member_num) {
      this.member_num = member_num;
   }

   public String getMember_id() {
      return member_id;
   }

   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }

   public String getMember_pw() {
      return member_pw;
   }

   public void setMember_pw(String member_pw) {
      this.member_pw = member_pw;
   }

   public String getMember_name() {
      return member_name;
   }

   public void setMember_name(String member_name) {
      this.member_name = member_name;
   }

   public String getMember_ph1() {
      return member_ph1;
   }

   public void setMember_ph1(String member_ph1) {
      this.member_ph1 = member_ph1;
   }

   public String getMember_ph2() {
      return member_ph2;
   }

   public void setMember_ph2(String member_ph2) {
      this.member_ph2 = member_ph2;
   }

   public String getMember_ph3() {
      return member_ph3;
   }

   public void setMember_ph3(String member_ph3) {
      this.member_ph3 = member_ph3;
   }

   public String getMember_rrn1() {
      return member_rrn1;
   }

   public void setMember_rrn1(String member_rrn1) {
      this.member_rrn1 = member_rrn1;
   }

   public String getMember_rrn2() {
      return member_rrn2;
   }

   public void setMember_rrn2(String member_rrn2) {
      this.member_rrn2 = member_rrn2;
   }

   public String getMember_email() {
      return member_email;
   }

   public void setMember_email(String member_email) {
      this.member_email = member_email;
   }

   public String getMember_email_yn() {
      return member_email_yn;
   }

   public void setMember_email_yn(String member_email_yn) {
      this.member_email_yn = member_email_yn;
   }

   public String getMember_zipcode() {
      return member_zipcode;
   }

   public void setMember_zipcode(String member_zipcode) {
      this.member_zipcode = member_zipcode;
   }

   public String getMember_road_address() {
      return member_road_address;
   }

   public void setMember_road_address(String member_road_address) {
      this.member_road_address = member_road_address;
   }

   public String getMember_local_address() {
      return member_local_address;
   }

   public void setMember_local_address(String member_local_address) {
      this.member_local_address = member_local_address;
   }

   public String getMember_rest_address() {
      return member_rest_address;
   }

   public void setMember_rest_address(String member_rest_address) {
      this.member_rest_address = member_rest_address;
   }

   public Date getMember_joindate() {
      return member_joindate;
   }

   public void setMember_joindate(Date member_joindate) {
      this.member_joindate = member_joindate;
   }

   public int getStatus() {
      return status;
   }

   public void setStatus(int status) {
      this.status = status;
   }

   public Date getMember_unregister_date() {
      return member_unregister_date;
   }

   public void setMember_unregister_date(Date member_unregister_date) {
      this.member_unregister_date = member_unregister_date;
   }

   public Date getMember_deldate() {
      return member_deldate;
   }

   public void setMember_deldate(Date member_deldate) {
      this.member_deldate = member_deldate;
   }
   
   

}