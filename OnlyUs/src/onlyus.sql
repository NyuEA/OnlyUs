
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
insert into bisUser(bisid, passwd, bisname, post1, post2, addr1, addr2, phone1, phone2, phone3) 
values('s1','s1','맘스터치' ,'310','83','충남 천안 서북구','신당동 271-9 ','041','554','3392');

alter table bisUser modify(post1 varchar2(3));

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