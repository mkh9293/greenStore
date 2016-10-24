package com.store.greenStore.mapper;

import java.util.List;

import com.store.greenStore.dto.Notice;

public interface NoticeMapper {

	void write(Notice board);
	void update(Notice board);
	void delete(int nkey);
	public Notice selectById(int nkey);
	Notice listOne(int nkey);
	List<Notice> listAll();
	Notice searchById(int nkey);


}
