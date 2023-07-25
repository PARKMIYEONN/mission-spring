-- 회원테이블
create table t_member(
    id varchar2(30) primary key
    , password varchar2(30) not null
    , name varchar2(20) not null
    , type char(1) default 'U'      -- 일반유저 'U', 관리자 'S'
);

insert into t_member
 values ('admin', 'admin', '관리자', 'S');
 
insert into t_member(id, password, name)
 values('hong', 'hong1234', '홍길동');
 
commit;

select *
  from t_member;