package com.store.greenStore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.store.greenStore.dto.Review;
import com.store.greenStore.dto.ReviewLike;
import com.store.greenStore.dto.StoreLike;

public interface RvMapper {
		public void insert(Review rv);
		public void update(Review rv);
		public void delete(int rkey);
		
		//select 메소드가 좋아요 가장 많은거 1개 뽑는거. oneStore가 하나의 스토어에서 더보기 한 리뷰
		public List<Review> select(int sh_id);
		public List<Review> oneStore(int sh_id);
		public List<Review> listAll();

		public List<Review> weblistAll(@Param("mk")int mk);

		public List<Review> myReview(int mid);
		
		public int findMid(int rkey);
		
		//리뷰좋아요
		public void reLike(int rkey);
		public void reUnlike(int rkey);
		
		//앱
		List<Review> appReviewCateSearch(@Param("area")String area,@Param("cate")String cate);
		
		List<Review> region(String searchText);
		
		public Review selectById(int rkey);
		
		ReviewLike rvlikePlus(@Param("rk")int rk, @Param("mk")int mk);
		ReviewLike rvlikeMin(@Param("rk")int rk, @Param("mk")int mk);
}