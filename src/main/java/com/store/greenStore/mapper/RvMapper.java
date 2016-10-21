package com.store.greenStore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.store.greenStore.dto.Review;
import com.store.greenStore.dto.Store;

public interface RvMapper {
		public void insert(Review rv);
		public void update(Review rv);
		public void delete(int rkey);
		
		//select 메소드가 좋아요 가장 많은거 1개 뽑는거. oneStore가 하나의 스토어에서 더보기 한 리뷰
		public List<Review> select(int sh_id);
		public List<Review> oneStore(int sh_id);
		public List<Review> listAll();
		public List<Review> myReview(int mid);
		
		public void reLike(int rkey);
		public void reUnlike(int rkey);
		
		List<Review> appReviewCateSearch(@Param("area")String area,@Param("cate")String cate);
		
		
}