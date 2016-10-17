package com.store.greenStore.mapper;

import java.util.List;

import com.store.greenStore.dto.LikeDto;
import com.store.greenStore.dto.StoreLike;

public interface LikeMapper {
	//사용자가 좋아요한 리뷰, 스토어 조회
	List<LikeDto> searchLikeByMkey(int mkey);
	
	//스토어 좋아요
	void storeLike(StoreLike storeLike);
	
	//스토어 좋아요 +1
	void storeLikeUp(int sh_id);
}
