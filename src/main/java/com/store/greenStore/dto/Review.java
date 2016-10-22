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
	private String sh_addr;
	private int INDUTY_CODE_SE;
	private String INDUTY_CODE_SE_NAME;
	
	//member data
	private int mid;
	private String mphoto;
	private String mname;
	
	public String getMphoto() {
		return mphoto;
	}

	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public int getINDUTY_CODE_SE() {
		return INDUTY_CODE_SE;
	}

	public void setINDUTY_CODE_SE(int iNDUTY_CODE_SE) {
		INDUTY_CODE_SE = iNDUTY_CODE_SE;
	}

	public String getINDUTY_CODE_SE_NAME() {
		return INDUTY_CODE_SE_NAME;
	}

	public void setINDUTY_CODE_SE_NAME(String iNDUTY_CODE_SE_NAME) {
		INDUTY_CODE_SE_NAME = iNDUTY_CODE_SE_NAME;
	}

	public String getSh_addr() {
		return sh_addr;
	}

	public void setSh_addr(String sh_addr) {
		this.sh_addr = sh_addr;

	}

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

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}
	
	
}
