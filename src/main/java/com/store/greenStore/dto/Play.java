package com.store.greenStore.dto;

public class Play {

	private long readcount;
	private String addr1;
	private Object addr2;
	private String firstimage;
	private String title;
	
	/* mapx, mapy의 type이 이상함..그래서 object형으로 받음 */
	private Object mapx;
	private Object mapy;
	
	public long getReadcount() {
		return readcount;
	}
	public void setReadcount(long readcount) {
		this.readcount = readcount;
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
	
	public Object getMapx() {
		return mapx;
	}
	public void setMapx(Object mapx) {
		this.mapx = mapx;
	}
	public Object getMapy() {
		return mapy;
	}
	public void setMapy(Object mapy) {
		this.mapy = mapy;
	}
}
