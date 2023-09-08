package com.spring.ctc.order.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("OrderVO")
public class OrderVO {
	
	private String member_id;
	private String goods_code;
	private int order_num;
	private String goods_name;
	private String goods_category;
	private int goods_saleprice;
	private Date order_date;
	private int order_status;
	private int pay_status;
	private Date pay_order_time;
	private String card_com_name;
	private String card_pay_month;
	private int refund_price;
	private int total_charge_price;
	private int use_mileage;
	private int plus_mileage;
	private String license_id;
	private Date license_date;
	private Date reser_start_date;
	private Date reser_end_date;
	private String reser_period;
	private int reser_headcount;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getGoods_code() {
		return goods_code;
	}
	public void setGoods_code(String goods_code) {
		this.goods_code = goods_code;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_category() {
		return goods_category;
	}
	public void setGoods_category(String goods_category) {
		this.goods_category = goods_category;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	public int getPay_status() {
		return pay_status;
	}
	public void setPay_status(int pay_status) {
		this.pay_status = pay_status;
	}
	public Date getPay_order_time() {
		return pay_order_time;
	}
	public void setPay_order_time(Date pay_order_time) {
		this.pay_order_time = pay_order_time;
	}
	public int getGoods_saleprice() {
		return goods_saleprice;
	}
	public void setGoods_saleprice(int goods_saleprice) {
		this.goods_saleprice = goods_saleprice;
	}
	public String getCard_com_name() {
		return card_com_name;
	}
	public void setCard_com_name(String card_com_name) {
		this.card_com_name = card_com_name;
	}
	public String getCard_pay_month() {
		return card_pay_month;
	}
	public void setCard_pay_month(String card_pay_month) {
		this.card_pay_month = card_pay_month;
	}
	public int getRefund_price() {
		return refund_price;
	}
	public void setRefund_price(int refund_price) {
		this.refund_price = refund_price;
	}
	public int getTotal_charge_price() {
		return total_charge_price;
	}
	public void setTotal_charge_price(int total_charge_price) {
		this.total_charge_price = total_charge_price;
	}
	public int getUse_mileage() {
		return use_mileage;
	}
	public void setUse_mileage(int use_mileage) {
		this.use_mileage = use_mileage;
	}
	public int getPlus_mileage() {
		return plus_mileage;
	}
	public void setPlus_mileage(int plus_mileage) {
		this.plus_mileage = plus_mileage;
	}
	public String getLicense_id() {
		return license_id;
	}
	public void setLicense_id(String license_id) {
		this.license_id = license_id;
	}
	public Date getLicense_date() {
		return license_date;
	}
	public void setLicense_date(Date license_date) {
		this.license_date = license_date;
	}
	public Date getReser_start_date() {
		return reser_start_date;
	}
	public void setReser_start_date(Date reser_start_date) {
		this.reser_start_date = reser_start_date;
	}
	public Date getReser_end_date() {
		return reser_end_date;
	}
	public void setReser_end_date(Date reser_end_date) {
		this.reser_end_date = reser_end_date;
	}
	public String getReser_period() {
		return reser_period;
	}
	public void setReser_period(String reser_period) {
		this.reser_period = reser_period;
	}
	public int getReser_headcount() {
		return reser_headcount;
	}
	public void setReser_headcount(int reser_headcount) {
		this.reser_headcount = reser_headcount;
	}
	
	
}