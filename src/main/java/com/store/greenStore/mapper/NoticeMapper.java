package com.store.greenStore.mapper;

import java.util.List;

import com.store.greenStore.dto.Notice;
import com.store.greenStore.dto.Pagination;

public interface NoticeMapper {

	void write(Notice board);
	void update(Notice board);
	void remove(int nkey);
	
	Notice listOne(int nkey);
	List<Notice> listAll();
	
	Notice searchById(int nkey);
    List<Notice> selectPage(Pagination pagination);
	int selectCount(Pagination pagination);

}
