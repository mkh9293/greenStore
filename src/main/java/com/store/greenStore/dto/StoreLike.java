package com.store.greenStore.dto;

public class StoreLike {

	private int mkey;
	private int sh_id;
	private String sh_name;
	private String sh_photo;
	private String mname;
	private int mid;
	private String sh_addr;
	private String sh_phone;
	private int flag;
	
	public String getSh_addr() {
		return sh_addr;
	}
	public void setSh_addr(String sh_addr) {
		this.sh_addr = sh_addr;
	}
	public String getSh_phone() {
		return sh_phone;
	}
	public void setSh_phone(String sh_phone) {
		this.sh_phone = sh_phone;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getSh_name() {
		return sh_name;
	}
	public void setSh_name(String sh_name) {
		this.sh_name = sh_name;
	}
	public String getSh_photo() {
		return sh_photo;
	}
	public void setSh_photo(String sh_photo) {
		this.sh_photo = sh_photo;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMkey() {
		return mkey;
	}
	public void setMkey(int mkey) {
		this.mkey = mkey;
	}
	public int getSh_id() {
		return sh_id;
	}
	public void setSh_id(int sh_id) {
		this.sh_id = sh_id;
	}
	
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	
}
