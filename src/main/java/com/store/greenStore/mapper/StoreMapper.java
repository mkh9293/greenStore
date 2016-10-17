package com.store.greenStore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.store.greenStore.dto.Store;

public interface StoreMapper {
	void insert(Store data);
	List<Store> webSelectAll();
	List<Store> likeSelectAll();
	List<Store> selectAll();
	List<Store> region(String searchText);
	List<Store> category(@Param("cate")String cate);
	
	List<Store> search(String searchText);
	List<Store> cateSearch(@Param("area")String area,@Param("cate")String cate);
	
	List<Store> appCateSearch(@Param("area")String area,@Param("cate")String cate);
}
