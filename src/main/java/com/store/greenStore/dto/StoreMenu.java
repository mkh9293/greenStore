package com.store.greenStore.dto;

public class StoreMenu {
	private int sm_id;
	private int sh_id;
	private String menu;
	private int price;
	
	public int getSm_id() {
		return sm_id;
	}
	public void setSm_id(int sm_id) {
		this.sm_id = sm_id;
	}
	public int getSh_id() {
		return sh_id;
	}
	public void setSh_id(int sh_id) {
		this.sh_id = sh_id;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

}
