/*
    테이블명 : t_board
    글번호     no          number(5)
    제목       title       varchar2(200)
    작성자     writer      varchar2(30)
    등록일     reg_date    date
*/

create table t_board(
    no number(5)
    , title varchar2(200)
    , writer varchar2(30)
    , reg_date date
);

describe t_board;
desc t_board;

drop table t_board;

/*
    테이블명 : t_board
    글번호     no          number(5)
    제목       title       varchar2(200) 필수항목
    작성자     writer      varchar2(30)  필수항목
    등록일     reg_date    date          현재시간 등록
*/

create table t_board(
    no number(5)          primary key   -- unique + not null
    , title varchar2(200) not NULL
    , writer varchar2(30) not null
    , reg_date date     default sysdate
);

desc t_board;

alter table t_board 
  add content varchar2(4000);
  
alter table t_board
  add view_cnt char(3);
  
alter table t_board
modify view_cnt number(5) default 0;

insert into t_board(no, title, writer, reg_date, content, view_cnt)
 values(1, '제목입니다', '닌자', sysdate, '내용입니다', 0);
 
insert into t_board
 values(2, '제목입니다', '닌자', sysdate, '내용입니다', 0);
 
insert into t_board(no, title, writer, content)
 values(3, '제목3', '길동', '내용3');
 
select * from t_board;

update t_board
   set view_cnt = 20, title = '변경된 제목'
 where no = 2;
 
commit;

 
-- delete t_board;

select * from employees;

-- 입사년도가 2001, 2002, 2003년인 사원 조회
select to_char(hire_date, 'yyyy') as 입사년도
  from employees;
  
select to_char(hire_date, 'yyyy') 입사년도, e.*
  from employees e
 where to_char(hire_date, 'yyyy') = 2001
    or to_char(hire_date, 'yyyy') = 2002
    or to_char(hire_date, 'yyyy') = 2003;
    
select to_char(hire_date, 'yyyy') 입사년도, e.*
  from employees e
 where to_char(hire_date, 'yyyy') in ('2001', '2002', '2003');    
 
-- 연도같은 경우 숫자와 문자를 구분하지 않아도 문제가 생기지 않지만, 03같이 표현되는 월의 경우 문제가 생길 수 있기 때문에 문자로 표현을 하기 위해 ''를 씌워주는 것이 좋음

-- 커미션(commission)_pct)이 없는 사원목록 조회
select * 
  from employees
 where commission_pct is null;
 
 
-- 전체사원목록을 조회, 단 comminssion_pct null인 경우 0 변환
select employee_id, first_name, nvl(commission_pct, 0)as commission_pct
  from employees;
  
  
-- 사원ID, 사원이름, manager_id 조회
-- 단, manager_id가 없는경우 'manager 없음' 조회

select employee_id, first_name
     , nvl(to_char(manager_id), '매니저 없음') as manager_id
  from employees;
  
-- 부서번호가 80인 사원수 조회
select count(*) 사원수
  from employees e
 where department_id = 80;
 
select department_id 부서명, count(*) 사원수
  from employees
 group by department_id;
 
 
/*
    salary(연봉) 20000 이상     '고액연봉자'
                10000~ 20000  '평균연봉자'
                10000미만      '최저연봉자'
*/
select employee_id, salary
     , case when salary >= 20000 then '고액연봉자'
            when salary >= 10000 then '평균연봉자'
            else '최저연봉자'
        end as 연봉타입
  from employees;
  
select rownum, employee_id
  from employees
 where rownum >=5;
 
-- from과 where절에서는 rownum을 몰라! 그래서 from절에서 미리 나와야 돼

select e.*
  from (select rownum as rnum, employee_id from employees )e
 where e.rnum between 5 and 10;

/*
    employee 번호, 이름, 전화번호와 지역을 id순으로 오름차순 조회
    지역은 전화번호의 앞자리로 구분
        515 => 서울
        590 => 대전
        650 => 광주
        603 => 부산
        그 외의 경우 기타
*/

select employee_id, first_name, phone_number, substr(phone_number, 1, 3)
  from employees;
  
select employee_id, first_name, phone_number
     , case when substr(phone_number, 1, 3) = 515 then '서울'
            when substr(phone_number, 1, 3) = 590 then '대전'
            else '다른지역'
        end
  from employees;

select employee_id, first_name, phone_number
     , case substr(phone_number, 1, 3) 
            when '515' then '서울'
            when '590' then '대전'
            when '650' then '광주'
            when '604' then '부산'
            else '기타'
        end 지역
  from employees
 order by 1 asc;
 
-- like %A같이 %를 앞에 쓰는 건 좋은 방법이 아님. 모든 데이터를 확인해 봐야 하기 때문. 이럴 땐 instr같은 걸 사용하는 것이 좋음.
-- 제목이나 작성자같이 기본키가 아닌 값들로 검색을 하려면 데이터가 많을 경우 오랜 시간이 걸리기 때문에 인덱스를 만들어 주어야 된다.
-- 데이터베이스의 목적은 데이터를 유지시키고 그 데이터를 빠르고 편하게 데이터를 이르메가 하고 싶을 것이기 때문에 여러가지 방식을 알고 있어야 한다.

create sequence seq_01;

select seq_01.nextval from dual;

create sequence seq_02
 start with 2023000001;
 
select seq_02.nextval from dual;

create sequence seq_03
 start with 10
 increment by 10;
 
select seq_03.nextval from dual;









