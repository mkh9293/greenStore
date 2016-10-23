package com.store.greenStore.dto;

import java.util.Date;

public class Store {
	// store 데이터
	private int sh_id;
	private String sh_name;
	private String sh_addr;
	private int induty_code_se;
	private String induty_code_se_name;
	private String sh_phone;
	private String sh_way;
	private String sh_info;
	private String sh_pride;
	private int sh_rcmn;
	private String sh_photo;
	private int sh_like;
	private Date base_ym;
	
	// menu 데이터
	private int sm_id;
	private int price;
	private String menu;
	
	private Object pointX;
	private Object pointY;
	
	//play 객체와 합치기
	private String addr1;
	private Object addr2;
	private String firstimage;
	private String title;
	

	public Object getPointX() {
		return pointX;
	}
	public void setPointX(Object pointX) {
		this.pointX = pointX;
	}
	public Object getPointY() {
		return pointY;
	}
	public void setPointY(Object pointY) {
		this.pointY = pointY;
	}
	public int getSm_id() {
		return sm_id;
	}
	public void setSm_id(int sm_id) {
		this.sm_id = sm_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getSh_id() {
		return sh_id;
	}
	public void setSh_id(int sh_id) {
		this.sh_id = sh_id;
	}
	public String getSh_name() {
		return sh_name;
	}
	public void setSh_name(String sh_name) {
		this.sh_name = sh_name;
	}
	public String getSh_addr() {
		return sh_addr;
	}
	public void setSh_addr(String sh_addr) {
		this.sh_addr = sh_addr;
	}
	public int getInduty_code_se() {
		return induty_code_se;
	}
	public void setInduty_code_se(int induty_code_se) {
		this.induty_code_se = induty_code_se;
	}
	public String getInduty_code_se_name() {
		return induty_code_se_name;
	}
	public void setInduty_code_se_name(String induty_code_se_name) {
		this.induty_code_se_name = induty_code_se_name;
	}
	public String getSh_phone() {
		return sh_phone;
	}
	public void setSh_phone(String sh_phone) {
		this.sh_phone = sh_phone;
	}
	public String getSh_way() {
		return sh_way;
	}
	public void setSh_way(String sh_way) {
		this.sh_way = sh_way;
	}
	public String getSh_info() {
		return sh_info;
	}
	public void setSh_info(String sh_info) {
		this.sh_info = sh_info;
	}
	public String getSh_pride() {
		return sh_pride;
	}
	public void setSh_pride(String sh_pride) {
		this.sh_pride = sh_pride;
	}
	public int getSh_rcmn() {
		return sh_rcmn;
	}
	public void setSh_rcmn(int sh_rcmn) {
		this.sh_rcmn = sh_rcmn;
	}
	public String getSh_photo() {
		return sh_photo;
	}
	public void setSh_photo(String sh_photo) {
		this.sh_photo = sh_photo;
	}
	public int getSh_like() {
		return sh_like;
	}
	public void setSh_like(int sh_like) {
		this.sh_like = sh_like;
	}
	public Date getBase_ym() {
		return base_ym;
	}
	public void setBase_ym(Date base_ym) {
		this.base_ym = base_ym;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public Object getAddr2() {
		return addr2;
	}
	public void setAddr2(Object addr2) {
		this.addr2 = addr2;
	}
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
