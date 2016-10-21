package com.store.greenStore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.store.greenStore.dto.Review;
import com.store.greenStore.dto.Store;

public interface RvMapper {
		public void insert(Review rv);
		public void update(Review rv);
		public void delete(int rkey);
		
		public List<Review> select(int sh_id);
		public List<Review> oneStore(int sh_id);
		public List<Review> listAll();
		public List<Review> myReview(int mid);
		
		public void reLike(int rkey);
		public void reUnlike(int rkey);
		
		List<Review> appReviewCateSearch(@Param("area")String area,@Param("cate")String cate);
		
}