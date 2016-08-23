select * from store;
select * from store_menu;
select * from review;
ALTER TABLE store MODIFY SH_PHOTO varchar(500);

delete from store_menu;

UPDATE review SET rcontent='안녕', rdate=now() where rkey=1;

SELECT * FROM review WHERE sh_id=9018 and relike = (SELECT max(relike) FROM review);

select * from store where sh_id<1000;

SELECT * FROM review;
select * from store order by SH_RCMN DESC LIMIT 6;
select * from store join store_menu on store.sh_id = store_menu.sh_id where store.sh_name like '%조마루%';

select * 
from store join store_menu on store.sh_id = store_menu.sh_id  
where replace(store.sh_name," ","") like replace("%다방%"," ", "")
OR replace(store.sh_way," ","") like "%종로5가%";
		
select * 
from store join store_menu on store.sh_id = store_menu.sh_id  
where match(store.sh_name,store.sh_way) against('"+*" "-다방*"' in boolean mode);
		
select * 
from store join store_menu on store.sh_id = store_menu.sh_id  
where match(store.sh_name) against('다방*' in boolean mode);
		
select * 
from store join store_menu on store.sh_id = store_menu.sh_id  
where store.sh_name like '%위생%' or
      store.sh_way like '%위생%' or
      store.sh_addr like '%위생%' or
      store.sh_pride like '%위생%' or
      store_menu.menu like '%위생%'
     
repair table store;
alter table store add FULLTEXT(sh_name,sh_way,sh_addr,sh_pride);
alter table store_menu add FULLTEXT(menu);

select *
from store inner join store_menu on store.sh_id = store_menu.sh_id
where match(store.sh_name,store.sh_addr,store.sh_way,store.sh_addr,store.sh_pride,store_menu.menu) against('*5호선 커피*' IN BOOLEAN MODE)
order by store_menu.menu;


 
select *, 
	MATCH(store_menu.menu) AGAINST('커피') AS relevance,
	MATCH(store.sh_name) AGAINST('커피') AS title_relevance,
	MATCH(store.sh_addr,store.sh_way,store.sh_pride) AGAINST('커피') AS body_relevance
from store inner join store_menu on store.sh_id = store_menu.sh_id
where match(store.sh_name,store.sh_addr,store.sh_way,store.sh_addr,store.sh_pride,store_menu.menu) against('커피')
order by relevance desc,title_relevance desc,body_relevance desc;

select *
from store inner join store_menu on store.sh_id = store_menu.sh_id
where match(store_menu.menu) AGAINST('커피') ,
	match(store.sh_name) AGAINST('커피'),
	match(store.sh_addr,store.sh_way,store.sh_pride) AGAINST('커피')
order by relevance desc,title_relevance desc,body_relevance desc;