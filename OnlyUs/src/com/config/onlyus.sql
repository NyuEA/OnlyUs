
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
  
  --일반 회원 테이블/ 관리자는 아이디를 admin으로 일반 회원 테이블에 등록
  create table genUser
  ( userid varchar2(10) primary key,
   passwd varchar2(20) not null,
   nickname varchar2(10) not null,
  birthday Date default null,
   preferbis varchar2(10));
   
   drop table genUser;
   insert into genUser values('admin','admin','관리자',null);
   commit;
  
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
  
  --회원 쿠폰
  create table downCoupon
  ( dcouid varchar2(10) primary key, --다운받은 쿠폰아이디
    couid varchar2(10)  not null, -- 어떤쿠폰인지
    use_yn char(1) default 'n' not null, --사용여부 사용후 y로 변경
    userid varchar2(10), --누가받았는지
    constraint downcoupon_genuser_fk foreign key(userid) references genuser(userid)
  );
  
  drop table downCoupon;
  
  commit;