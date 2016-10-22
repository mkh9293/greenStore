package com.store.greenStore.mapper;

import com.store.greenStore.dto.Image;

public interface ImageMapper {
	
	public void insert(Image image);
	public Image selectById(int id);

}
