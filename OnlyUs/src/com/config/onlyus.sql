
--��ü ȸ�� ���̺�
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
  
  --�Ϲ� ȸ�� ���̺�/ �����ڴ� ���̵� admin���� �Ϲ� ȸ�� ���̺� ���
  create table genUser
  ( userid varchar2(10) primary key,
   passwd varchar2(20) not null,
   nickname varchar2(10) not null,
  birthday Date default null,
   preferbis varchar2(10));
   
   drop table genUser;
   insert into genUser values('admin','admin','������',null);
   commit;
  
  -- ���� ���̺�
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
  
  -- ���� ���̺�
  create table coupon
  ( couid varchar2(10) primary key,
    amount number(2) not null,
    period_f date not null, --���۳�¥
    period_t date not null, --���ᳯ¥
    show_yn char(1) default 'n' not null,
    clickcount number(4) default 0,
    bisid varchar2(10),
    constraint coupon_bisuser_fk foreign key(bisid) references bisUser(bisid)
  );
  
  --ȸ�� ����
  create table downCoupon
  ( dcouid varchar2(10) primary key, --�ٿ���� �������̵�
    couid varchar2(10)  not null, -- ���������
    use_yn char(1) default 'n' not null, --��뿩�� ����� y�� ����
    userid varchar2(10), --�����޾Ҵ���
    constraint downcoupon_genuser_fk foreign key(userid) references genuser(userid)
  );
  
  drop table downCoupon;
  
  commit;