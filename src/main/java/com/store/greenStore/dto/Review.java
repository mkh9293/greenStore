package com.store.greenStore.dto;
import java.util.Date;
public class Review {
	private int rkey;
	private int mkey;
	private int sh_id;
	private String rcontent;
	private int relike;
	private Date rdate;
	private String sh_name;
	
	
	public int getRkey() {
		return rkey;
	}
	
	public String getSh_name() {
		return sh_name;
	}

	public void setSh_name(String sh_name) {
		this.sh_name = sh_name;
	}

	public void setRkey(int rkey) {
		this.rkey = rkey;
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
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public int getRelike() {
		return relike;
	}
	public void setRelike(int relike) {
		this.relike = relike;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	
	
}
