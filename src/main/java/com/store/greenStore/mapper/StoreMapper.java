package com.store.greenStore.mapper;

import java.util.List;

import com.store.greenStore.dto.Store;

public interface StoreMapper {
	void insert(Store data);
	List<Store> selectAll();
	List<Store> selectById(String searchText);
}
