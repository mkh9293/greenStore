select * from store;
select * from store_menu;
select * from review;
ALTER TABLE store MODIFY SH_PHOTO varchar(500);

delete from store_menu;

UPDATE review SET rcontent='�븞�뀞', rdate=now() where rkey=1;

SELECT * FROM review WHERE sh_id=9018 and relike = (SELECT max(relike) FROM review);

select * from store where sh_id<1000;

SELECT * FROM review;
select * from store order by SH_RCMN DESC LIMIT 6;

select * 
from store join store_menu on store.sh_id = store_menu.sh_id  
where replace(store.sh_name," ","") like replace("%�떎諛�%"," ", "")
OR replace(store.sh_way," ","") like "%醫낅줈5媛�%";

repair table store;
alter table store add FULLTEXT(sh_name,sh_way,sh_addr,sh_pride);
alter table store_menu add FULLTEXT(menu);

select *
from store inner join store_menu on store.sh_id = store_menu.sh_id
where match(store.sh_name,store.sh_addr,store.sh_way,store.sh_addr,store.sh_pride,store_menu.menu) against('*而ㅽ뵾*' IN BOOLEAN MODE)
group by store.sh_name
order by store_menu.menu desc;

select distinct *
from store where sh_addr like '%�룄遊됯뎄%' and induty_code_se = 2;
 	
select * from member;


SELECT * FROM review WHERE sh_id=9018 and relike = (SELECT max(relike) FROM review);


		SELECT * FROM review r INNER JOIN store s ON r.sh_id = s.sh_id where r.sh_id=9018;
		
		SELECT * FROM review r INNER JOIN store s ON r.sh_id = s.sh_id
