package com.store.greenStore.mapper;

import com.store.greenStore.dto.Member;

public interface MemberMapper {
	public void insertUser(Member member);
	//구분자
	public Member member(String mid);
	public Member update(String mid);
	
	//member 조회
	public Member selectMember(String mid);
}
