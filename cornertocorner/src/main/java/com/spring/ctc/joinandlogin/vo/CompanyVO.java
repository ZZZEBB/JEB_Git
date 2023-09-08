package com.spring.ctc.joinandlogin.vo;

import java.util.Date;


import org.springframework.stereotype.Component;

@Component("companyVO")
public class CompanyVO {
   private int com_num;
   private String com_id;
   private String com_pw;
   private String com_name;
   private String com_ceo;
   private String com_tel1;
   private String com_tel2;
   private String com_tel3;
   private String com_email;
   private String com_crn1;
   private String com_crn2;
   private String com_crn3;
   private String com_email_yn;
   private String com_zipcode;
   private String com_road_address;
   private String com_local_address;
   private String com_rest_address;
   private Date com_joindate;
   private int status;
   private Date com_unregister_date;
   private Date com_deldate;
   
   public CompanyVO() {
      
   }
   
   public CompanyVO(String com_id) {
	   this.com_id = com_id;
   }
   
   public CompanyVO(String com_name, String com_email) {
      this.com_name=com_name;
      this.com_email=com_email;
   }
   
   public CompanyVO(String com_ceo, String com_crn1, String com_crn2, String com_crn3) {
      this.com_ceo=com_ceo;
      this.com_crn1=com_crn1;
      this.com_crn2=com_crn2;
      this.com_crn3=com_crn3;
   }
   
   public int getCom_num() {
      return com_num;
   }
   public void setCom_num(int com_num) {
      this.com_num = com_num;
   }
   public String getCom_id() {
      return com_id;
   }
   public void setCom_id(String com_id) {
      this.com_id = com_id;
   }
   public String getCom_pw() {
      return com_pw;
   }
   public void setCom_pw(String com_pw) {
      this.com_pw = com_pw;
   }
   public String getCom_name() {
      return com_name;
   }
   public void setCom_name(String com_name) {
      this.com_name = com_name;
   }
   public String getCom_ceo() {
      return com_ceo;
   }
   public void setCom_ceo(String com_ceo) {
      this.com_ceo = com_ceo;
   }
   public String getCom_tel1() {
      return com_tel1;
   }
   public void setCom_tel1(String com_tel1) {
      this.com_tel1 = com_tel1;
   }
   public String getCom_tel2() {
      return com_tel2;
   }
   public void setCom_tel2(String com_tel2) {
      this.com_tel2 = com_tel2;
   }
   public String getCom_tel3() {
      return com_tel3;
   }
   public void setCom_tel3(String com_tel3) {
      this.com_tel3 = com_tel3;
   }
   public String getCom_email() {
      return com_email;
   }
   public void setCom_email(String com_email) {
      this.com_email = com_email;
   }
   public String getCom_crn1() {
      return com_crn1;
   }
   public void setCom_crn1(String com_crn1) {
      this.com_crn1 = com_crn1;
   }
   public String getCom_crn2() {
      return com_crn2;
   }
   public void setCom_crn2(String com_crn2) {
      this.com_crn2 = com_crn2;
   }
   public String getCom_crn3() {
      return com_crn3;
   }
   public void setCom_crn3(String com_crn3) {
      this.com_crn3 = com_crn3;
   }
   public String getCom_email_yn() {
      return com_email_yn;
   }
   public void setCom_email_yn(String com_email_yn) {
      this.com_email_yn = com_email_yn;
   }
   public String getCom_zipcode() {
      return com_zipcode;
   }
   public void setCom_zipcode(String com_zipcode) {
      this.com_zipcode = com_zipcode;
   }
   public String getCom_road_address() {
      return com_road_address;
   }
   public void setCom_road_address(String com_road_address) {
      this.com_road_address = com_road_address;
   }

   public String getCom_local_address() {
      return com_local_address;
   }
   public void setCom_local_address(String com_local_address) {
      this.com_local_address = com_local_address;
   }
   public String getCom_rest_address() {
      return com_rest_address;
   }
   public void setCom_rest_address(String com_rest_address) {
      this.com_rest_address = com_rest_address;
   }
   public Date getCom_joindate() {
      return com_joindate;
   }
   public void setCom_joindate(Date com_joindate) {
      this.com_joindate = com_joindate;
   }
   public int getStatus() {
      return status;
   }
   public void setStatus(int status) {
      this.status = status;
   }
   public Date getCom_unregister_date() {
      return com_unregister_date;
   }
   public void setCom_unregister_date(Date com_unregister_date) {
      this.com_unregister_date = com_unregister_date;
   }
   public Date getCom_deldate() {
      return com_deldate;
   }
   public void setCom_deldate(Date com_deldate) {
      this.com_deldate = com_deldate;
   }
   
   
}