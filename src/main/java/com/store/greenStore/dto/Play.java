package com.store.greenStore.dto;

public class Play {
	
	private Object contentid;
	private long readcount;
	private String addr1;
	private Object addr2;
	private String firstimage;
	private String title;
	private String tel;
	private String firstimage2;
	private String cat1;
	private Object sigungucode;
	private Object overview;
	
	public String getCat1() {
		return cat1;
	}
	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}
	public Object getSigungucode() {
		return sigungucode;
	}
	public void setSigungucode(Object sigungucode) {
		this.sigungucode = sigungucode;
	}
	public Object getOverview() {
		return overview;
	}
	public void setOverview(Object overview) {
		this.overview = overview;
	}
	/* mapx, mapy의 type이 이상함..그래서 object형으로 받음 */
	private Object mapx;
	private Object mapy;
	
	public Object getContentid() {
		return contentid;
	}
	public void setContentid(Object contentid) {
		this.contentid = contentid;
	}
	
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFirstimage2() {
		return firstimage2;
	}
	public void setFirstimage2(String firstimage2) {
		this.firstimage2 = firstimage2;
	}
	
}
