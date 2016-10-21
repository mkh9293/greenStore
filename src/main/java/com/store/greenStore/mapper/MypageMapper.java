package com.store.greenStore.mapper;

import java.util.List;

import com.store.greenStore.dto.ReviewLike;
import com.store.greenStore.dto.StoreLike;

public interface MypageMapper {
	
	List<StoreLike> storeLike(int mid);
	List<ReviewLike> reviewLike(int mid);



}
