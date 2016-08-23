package com.store.greenStore.mapper;

import java.util.List;

import com.store.greenStore.dto.ReviewLike;
import com.store.greenStore.dto.StoreLike;

public interface MypageMapper {
	
	List<StoreLike> selectStoreLike();
	List<ReviewLike> selectReviewLike();
	List<ReviewLike> selectRvLocal();
	List<ReviewLike> selectRvCate();

}
