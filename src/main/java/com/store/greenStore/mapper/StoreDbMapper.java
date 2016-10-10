package com.store.greenStore.mapper;

import java.util.List;

import com.store.greenStore.dto.Store;
import com.store.greenStore.dto.StoreMenu;

public interface StoreDbMapper {
	void insert(StoreMenu db);
	Store detail(int sh_id);
	
	//app
	List<Store> appDetail(int sh_id);
}
