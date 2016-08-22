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
		and replace(store.sh_way," ","") like "%종로5가%";
		
			select * 
		from store join store_menu on store.sh_id = store_menu.sh_id  
		where match(store.sh_name,store.sh_way) against('"+*" "-다방*"' in boolean mode);
		
				select * 
		from store join store_menu on store.sh_id = store_menu.sh_id  
		where match(store.sh_name) against('다방*' in boolean mode);
		
		select * 
		from store join store_menu on store.sh_id = store_menu.sh_id  
		where store.sh_name like '%중랑구 찜%' or
		      store.sh_way like '%중랑구 찜%' or
		      store.sh_addr like '%중랑구 찜%' or
		      store.sh_pride like '%중랑구 찜%' or
		      store_menu.menu like '%중랑구 찜%'