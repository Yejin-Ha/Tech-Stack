-- cascade constraint : 자식 테이블이 존재하더라도 삭제하는 명령
drop table book cascade constraint;

drop sequence seq_book_no;
create sequence seq_book_no;

drop table book;
create table book(
    bk_no number(6) primary key,
    title varchar2(20) not null,
    author varchar2(20) not null,
    price number(6, 2) not null
);
