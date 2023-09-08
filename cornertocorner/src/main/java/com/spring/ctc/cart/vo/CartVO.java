package com.spring.ctc.cart.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO {

	private String member_id;
	private String goods_code;
	private int cart_id;
	private int cart_headcount;
	private Date cart_credate;
	
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
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getCart_headcount() {
		return cart_headcount;
	}
	public void setCart_headcount(int cart_headcount) {
		this.cart_headcount = cart_headcount;
	}
	public Date getCart_credate() {
		return cart_credate;
	}
	public void setCart_credate(Date cart_credate) {
		this.cart_credate = cart_credate;
	}
}