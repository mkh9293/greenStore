select * from store;
select * from store_menu;
select * from review;
ALTER TABLE store MODIFY SH_PHOTO varchar(500);

delete from store_menu;

UPDATE review SET rcontent='안녕', rdate=now() where rkey=1;

SELECT * FROM review WHERE sh_id=9018 and relike = (SELECT max(relike) FROM review);

select * from store where sh_id<1000;

SELECT * FROM review;
select * from store order by SH_RCMN;

select * 
from store join store_menu on store.sh_id = store_menu.sh_id  
where replace(store.sh_name," ","") like replace("%다방%"," ", "")
OR replace(store.sh_way," ","") like "%종로5가%";

repair table store;
alter table store add FULLTEXT(sh_name,sh_way,sh_addr,sh_pride);
alter table store_menu add FULLTEXT(menu);

select *
from store inner join store_menu on store.sh_id = store_menu.sh_id
where match(store.sh_name,store.sh_addr,store.sh_way,store.sh_addr,store.sh_pride,store_menu.menu) against('*커피*' IN BOOLEAN MODE)
group by store.sh_name
order by store_menu.menu desc;

select distinct *
from store where sh_addr like '%도봉구%' and induty_code_se = 2;
 	
select * from member;
delete from member;
select  s.SH_ID, SH_NAME, SH_ADDR, MENU, induty_code_se_name, SH_RCMN, SH_LIKE, SH_PHOTO, MIN(PRICE) AS PRICE 
from store s join store_menu m on s.sh_id = m.sh_id  
where match(s.sh_name,s.sh_addr,s.sh_way,s.sh_pride,m.menu) against('*co*' IN BOOLEAN MODE)
group by sh_id
order by sh_rcmn desc;

select  s.SH_ID, SH_NAME, SH_ADDR, MENU,induty_code_se ,induty_code_se_name, SH_RCMN, SH_LIKE, SH_PHOTO, MIN(PRICE) AS PRICE 
from store s join store_menu m on s.sh_id = m.sh_id
where sh_addr like '%서울특별시%' and
induty_code_se_name like '%VTR대여%'
group by sh_id
order by sh_rcmn desc;

select * from store where sh_id = 2350; 
select * from store_menu;

select store_menu.menu
from store join store_menu on store.sh_id = store_menu.sh_id  
where store.sh_id = 2350;

select distinct *
from store_like sl join review_like rl on sl.mkey = rl.mkey
where sl.mkey = 4;

select *
from review_like;
select *
from store_like;
insert store_like (mkey,sh_id) values (3,9016);
insert review_like (rkey,MKEY) values (2,3);
select *
from review_like;
insert notice (ntitle,ncontent,ndate) values ("함께 그린 스토어 오픈 기념 공지","함께 그린 스토어 오픈! ",sysdate());

SELECT * FROM review r INNER JOIN store s ON r.sh_id = s.sh_id order by rdate desc;

delete from store_like;
select *
		from store join store_menu on store.sh_id = store_menu.sh_id
		where store.sh_id = 2350;
select *
from store;

SELECT * 
		FROM review join member on review.mkey = member.mkey 
		WHERE sh_id = 9015 
		order by relike limit 1;
		
update store set sh_like = 0;
UPDATE review SET rcontent='안녕', rdate=now() where rkey=1;

SELECT *
		FROM store
		ORDER BY sh_like DESC LIMIT 0,6

		SELECT *
		FROM store
		ORDER BY sh_like DESC LIMIT 0,20
		
SELECT * FROM review r INNER JOIN store s ON r.sh_id = s.sh_id where r.sh_id=9018;

select * from store s join store_like sl on s.sh_id = sl.sh_id where sl.mkey = 3;

select * from review r join review_like rl on r.rkey = rl.rkey join store s  on s.sh_id = r.sh_id where rl.mkey = 3;

select * from notice;

select s.SH_ID, SH_NAME, SH_ADDR, MENU, induty_code_se_name, SH_RCMN, SH_LIKE, SH_PHOTO, MIN(PRICE) AS PRICE 
			from store s join store_menu m on s.sh_id = m.sh_id  
			where match(s.sh_name,s.sh_addr,s.sh_way,s.sh_pride,m.menu) against('+"고기"' IN BOOLEAN MODE)
			group by sh_id
			order by sh_rcmn desc;
			
			SELECT * FROM review r JOIN store s ON r.sh_id = s.sh_id 
		 left outer join member m on r.mkey = m.mkey order by r.rkey;
		
		 select * from review r join member m on r.mkey = m.mkey
		 delete from review;
		select * from review;
		select * from store;
		select * from member;
		delete from member;
		select *
		from member
		where MID = 234 or MNAME = "문광훈";