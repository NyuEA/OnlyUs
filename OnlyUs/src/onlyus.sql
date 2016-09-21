
--업체 회원 테이블
create table bisUser
( bisid varchar2(10) primary key,
  passwd varchar2(20) not null,
  bisname varchar2(10) not null,
  post1 varchar2(3) not null,
  post2 varchar2(3) not null,
  addr1 varchar2(500) not null,
  addr2 varchar2(500) not null,
  phone1 varchar2(3) not null,
  phone2 varchar2(4) not null,
  phone3 varchar2(4) not null);
  select * from bisUser;
--충남
insert into bisUser(bisid, passwd, bisname, post1, post2, addr1, addr2, phone1, phone2, phone3)
values('s1','s1','맘스터치' ,'310','83','충남 천안 서북구','신당동 271-9 ','041','554','3392'); 
--서울
insert into bisUser(bisid, passwd, bisname, post1, post2, addr1, addr2, phone1, phone2, phone3) 
values('s2','s2','배스킨라빈스 압구정2호점' ,'310','83','서울특별시 강남구 압구정로28길 11 ','서울특별시 강남구 신사동 581-9','02','511','9100');
--경기
insert into bisUser(bisid, passwd, bisname, post1, post2, addr1, addr2, phone1, phone2, phone3) 
values('s3','s3','공차 산본역점' ,'111','111','경기도 군포시 산본로323번길 10-22 청운빌딩','경기도 군포시 산본동 1131-2 청운빌딩','031','391','0505');
--전북
insert into bisUser(bisid, passwd, bisname, post1, post2, addr1, addr2, phone1, phone2, phone3) 
values('s4','s4','쥬씨 영등동점' ,'111','111','전라북도 익산시 고봉로24길 38 대일빌딩','전라북도 익산시 영등동 767-1 105호','063','834','0770');
--전남
insert into bisUser(bisid, passwd, bisname, post1, post2, addr1, addr2, phone1, phone2, phone3) 
values('s5','s5','맥도날드 여수학동DT점' ,'111','111','전라남도 여수시 거북선공원1길 9','전라남도 여수시 학동 82-3 ','070','7209','0674');
--충북
insert into bisUser(bisid, passwd, bisname, post1, post2, addr1, addr2, phone1, phone2, phone3) --생선국수, 어탕국수
values('s6','s6','찐한식당' ,'111','111','충청북도 옥천군 청산면 지전길 14 음식점','충청북도 옥천군 청산면 교평리 257-5 ','043','732','3859');
--강원
insert into bisUser(bisid, passwd, bisname, post1, post2, addr1, addr2, phone1, phone2, phone3) 
values('s7','s7','춘천통나무집닭갈비' ,'111','111','강원도 춘천시 신북읍 신샘밭로 763 ','강원도 춘천시 신북읍 천전리 38-26 ','033','241','5999');
--경북
insert into bisUser(bisid, passwd, bisname, post1, post2, addr1, addr2, phone1, phone2, phone3) 
values('s8','s8','맘모스제과' ,'111','111','경상북도 안동시 문화광장길 34 ','경상북도 안동시 남부동 164-1 ','054','857','6000');
--경남
insert into bisUser(bisid, passwd, bisname, post1, post2, addr1, addr2, phone1, phone2, phone3) 
values('s9','s9','아브라카다브라' ,'111','111','경상남도 창원시 마산회원구 합성남7길 9 겜블리모텔 ','경상남도 창원시 마산회원구 합성동 266-31 1층 1 ','055','604','9986');
--제주
insert into bisUser(bisid, passwd, bisname, post1, post2, addr1, addr2, phone1, phone2, phone3) --흑돼지
values('s10','s10','자매국수' ,'111','111','제주특별자치도 제주시 삼성로 67','제주특별자치도 제주시 일도2동 1034-10 ','064','727','1112');
commit;
alter table bisUser modify(bisname varchar2(30));
select * from bisUser;
drop table bisUser;
  --일반 회원 테이블/ 관리자는 아이디를 admin으로 일반 회원 테이블에 등록
  create table genUser
  ( userid varchar2(10) primary key,
   passwd varchar2(20) not null,
   nickname varchar2(10) not null,
  phone varchar2(11) not null);
   
  alter table genUser add phone varchar2(11);
  alter table genUser modify (phone varchar(11) not null);
  alter table genUser drop (preferbis);
  alter table genUser add phone2 varchar2(4) not null;
  alter table genUser add phone3 varchar2(4) not null;
   drop table genUser;
   delete from genUser where userid='admin';
   insert into genUser values('admin','admin','관리자' ,'01011111111');
      insert into genUser values('ydw','ydw ','일반회원' ,'01012345678');
   commit;
   
   select * from genUser;
  
  -- 광고 테이블
  create table ad
  ( adid varchar2(10) primary key,
    adurl varchar2(200) not null,
    period_f date not null,
    period_t date not null,
    show_yn char(1) default 'n' not null,
    clickcount number(4) default 0,
    bisid varchar2(10),
    constraint ad_bisuser_fk foreign key(bisid) references bisUser(bisid)
  );
  drop table ad;
  -- 쿠폰 테이블
  create table coupon
  ( couid varchar2(10) primary key,
    amount number(2) not null,
    period_f date not null, --시작날짜
    period_t date not null, --종료날짜
    show_yn char(1) default 'n' not null,
    clickcount number(4) default 0,
    bisid varchar2(10),
    constraint coupon_bisuser_fk foreign key(bisid) references bisUser(bisid)
  );
  drop table coupon;
  insert into coupon values('c1','9','2016-10-01','2016-11-01','N',0,'s1','싸이버거 10% 할인권'); 
  insert into coupon values('c2','9','2016-10-01','2016-11-01','N',0,'s1','햄버거 주문시 콜라 증정'); 
  insert into coupon values('c3','9','2016-10-01','2016-11-01','N',0,'s1','단품주문시 세트로!!'); 
  insert into coupon values('c4','9','2016-10-01','2016-11-01','N',0,'s1','1000원 할인권(10000원이상 구매시)'); 
  
insert into coupon values('c5','9','2016-10-01','2016-11-01','N',0,'s2','무료 블랙펄 추가'); 
insert into coupon values('c6','9','2016-10-01','2016-11-01','N',0,'s2','사이즈 업'); 
insert into coupon values('c7','9','2016-10-01','2016-11-01','N',0,'s2','무표 밀크 폼 추가'); 
insert into coupon values('c8','9','2016-10-01','2016-11-01','N',0,'s2','무료 알로에 추가'); 
commit;
insert into coupon values('c9','9','2016-10-01','2016-11-01','N',0,'s3','사이즈 업'); 
insert into coupon values('c10','9','2016-10-01','2016-11-01','N',0,'s3','음료 1+1 쿠폰'); 
insert into coupon values('c11','9','2016-10-01','2016-11-01','N',0,'s3','200원 할인권'); 
insert into coupon values('c12','9','2016-10-01','2016-11-01','N',0,'s3','500원 할인권'); 
commit;
insert into coupon values('c13','9','2016-10-01','2016-11-01','N',0,'s4','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c14','9','2016-10-01','2016-11-01','N',0,'s4','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c15','9','2016-10-01','2016-11-01','N',0,'s4','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c16','9','2016-10-01','2016-11-01','N',0,'s4','1000원 할인권(10000원이상 구매시)');

insert into coupon values('c17','9','2016-10-01','2016-11-01','N',0,'s5','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c18','9','2016-10-01','2016-11-01','N',0,'s5','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c19','9','2016-10-01','2016-11-01','N',0,'s5','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c20','9','2016-10-01','2016-11-01','N',0,'s5','1000원 할인권(10000원이상 구매시)'); 

insert into coupon values('c21','9','2016-10-01','2016-11-01','N',0,'s6','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c22','9','2016-10-01','2016-11-01','N',0,'s6','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c23','9','2016-10-01','2016-11-01','N',0,'s6','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c24','9','2016-10-01','2016-11-01','N',0,'s6','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c25','9','2016-10-01','2016-11-01','N',0,'s6','1000원 할인권(10000원이상 구매시)'); 

insert into coupon values('c26','9','2016-10-01','2016-11-01','N',0,'s7','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c27','9','2016-10-01','2016-11-01','N',0,'s7','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c28','9','2016-10-01','2016-11-01','N',0,'s7','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c29','9','2016-10-01','2016-11-01','N',0,'s7','1000원 할인권(10000원이상 구매시)'); 

insert into coupon values('c30','9','2016-10-01','2016-11-01','N',0,'s8','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c31','9','2016-10-01','2016-11-01','N',0,'s8','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c32','9','2016-10-01','2016-11-01','N',0,'s8','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c33','9','2016-10-01','2016-11-01','N',0,'s8','1000원 할인권(10000원이상 구매시)'); 

insert into coupon values('c34','9','2016-10-01','2016-11-01','N',0,'s9','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c35','9','2016-10-01','2016-11-01','N',0,'s9','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c36','9','2016-10-01','2016-11-01','N',0,'s9','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c37','9','2016-10-01','2016-11-01','N',0,'s9','1000원 할인권(10000원이상 구매시)'); 

insert into coupon values('c38','9','2016-10-01','2016-11-01','N',0,'s10','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c39','9','2016-10-01','2016-11-01','N',0,'s10','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c40','9','2016-10-01','2016-11-01','N',0,'s10','1000원 할인권(10000원이상 구매시)'); 
insert into coupon values('c41','9','2016-10-01','2016-11-01','N',0,'s10','1000원 할인권(10000원이상 구매시)'); 


  
    alter table coupon add content varchar(500);
    commit;
    update coupon  set content = '싸이버거 10% 할인권' where couid = 'c1'; 
    select * from coupon;
  --회원 쿠폰
  create table downCoupon
  ( dcouid varchar2(10) primary key, --다운받은 쿠폰아이디
    couid varchar2(10)  not null, -- 어떤쿠폰인지
    use_yn char(1) default 'n' not null, --사용여부 사용후 y로 변경
    userid varchar2(10), --누가받았는지
    constraint downcoupon_genuser_fk foreign key(userid) references genuser(userid)
  );
  insert into downCoupon values('dc1','c1','n','ydw');
  insert into downCoupon values('dc2','c2','n','ydw');
  insert into downCoupon values('dc3','c3','n','ydw');
    insert into downCoupon values('dc4','c4','n','ydw');
  drop table downCoupon;
  
  commit;
    purge RECYCLEBIN;
    
    select DOWNCOUPON.dcouid, to_char(COUPON.period_f,'YYYY/MM/dd') period_f, to_char(COUPON.period_t,'YYYY/MM/dd') period_t, BISUSER.BISNAME,  DOWNCOUPON.use_yn, DOWNCOUPON.userid, COUPON.content
		from DOWNCOUPON , COUPON , BISUSER
		where DOWNCOUPON.COUID = COUPON.COUID 
    and COUPON.BISID = BISUSER.BISID
    and userid = 'ydw';