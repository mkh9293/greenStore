package com.store.greenStore.mapper;

import com.store.greenStore.dto.Store;
import com.store.greenStore.dto.StoreMenu;

public interface StoreMenuMapper {
	void insert(StoreMenu db);
	Store detail(int sh_id);
}
