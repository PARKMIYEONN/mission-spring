select * from t_board;

desc t_board;

delete from t_board;

commit;

create sequence seq_t_board_no;

/*
    Reply 테이블
*/

create table t_reply(
    no number(5) primary key
    , board_no number(5) not null
    , content varchar2(1000) not null
    , writer varchar2(30) not null
    , reg_date date default sysdate
    , constraint t_reply_board_no_fk foreign key(board_no)
      references t_board(no)
);

create sequence seq_t_reply_no;

select * from t_reply;

select no, title, writer, content, to_char(reg_date, 'yyyy-mm-dd') regDate
        , ( select count(*)
             from t_reply
            where board_no = b.no) as replyCnt
  from t_board b
 order by no desc;