package com.store.greenStore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.store.greenStore.dto.Store;
import com.store.greenStore.dto.StoreMenu;

public interface StoreDbMapper {
	void insert(StoreMenu db);
	Store detail(@Param("sh_id")int sh_id, @Param("mk")int mk);
	
	//app
	List<Store> appDetail(int sh_id);
}
