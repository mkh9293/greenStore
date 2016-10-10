package com.store.greenStore.mapper;

import java.util.List;

import com.store.greenStore.dto.Review;
import com.store.greenStore.dto.ReviewLike;

public interface RvLikeMapper {

	public ReviewLike select(ReviewLike reLike);
	public List<ReviewLike> selectRkeyByMkey(int mkey);
}