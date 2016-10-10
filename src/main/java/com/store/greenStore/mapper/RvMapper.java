package com.store.greenStore.mapper;

import java.util.List;

import com.store.greenStore.dto.Review;

public interface RvMapper {
		public void insert(Review rv);
		public void update(Review rv);
		public void delete(int rkey);
		
		public List<Review> select(int sh_id);
		public List<Review> oneStore(int sh_id);
		public List<Review> listAll();
		
		public void reLike(int rkey);
		public void reUnlike(int rkey);
		
		
}