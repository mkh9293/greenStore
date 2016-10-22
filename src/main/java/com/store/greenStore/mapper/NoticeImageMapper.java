package com.store.greenStore.mapper;

import com.store.greenStore.dto.Notice;

public interface NoticeImageMapper {
	public void insert(int noticeId, int imageId);
	public void delete(int noticeId);
	public void updateArticleImage(Notice nb);
}
