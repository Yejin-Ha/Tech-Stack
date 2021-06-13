/*
# sequence 
- 순차적인 순서 번호를 자동으로 반영할수 있는 매우 유용한 기술
- 기본은 1씩 자동 증가
    - 증가치, 최대값 추가 설정도 가능
    - 권장 : 하나의 시퀀스를 다수의 table에서 사용 비추


# 대표적인 활용 영역
- 게시물 글번호에 주로 사용
- 고객 등록시에 1씩 자동 증가해서 고객 관리


# sequence 기능
- 일정 숫자만큼 자동 생성되는 특성
- 속성
    nextval : insert문장에서 사용 / 1씩 자동 증가해서 insert
    currval : 현 시점에서 sequence값을 알고자 할 때 확인용 속성
- 주의 사항 
    다수의 table에서 하나의 시퀀스를 공용으로 사용시 시퀀스도 공유된다.
    따라서 table당 고유한 시퀀스 값 즉 1씩 증가치를 보장해야할 경우엔 공유를 금지한다.


# Syntax
- 다음 명령을 통해 sequence를 설계한 후 사용이 가능하다.
    create sequence <시퀀스 명>

- 현재 시퀀스의 값을 대입하고 1을 증가시키는 명령
    insert into <table명> values (<시퀀스명>.nextval)

- 현재 시퀀스의 값을 검색하느 명령
    select <시퀀스명>.currval from dual;

- 시작 index와 증가치, 최대 index를 지정하는 시퀀스 명령어
    create sequence <시퀀스명>
        start with <시작 index>
        increment by <증가치>
        maxvalue <최대 index>;

- 시퀀스 삭제 명령어
    drop sequence <시퀀스명>;
*/	
	     
-- seq_test_no1 라는 시퀀스 생성
create sequence seq_test_no1;


-- 시퀀스를 통해 순서 데이터 insert
insert into test values (seq_test_no1.nextval);
insert into test values (seq_test_no1.nextval);
insert into test values (seq_test_no1.nextval);
/*    NO1
----------
        1
        2
        3 */



-- 해당 시퀀스의 현재 값 검색
select seq_test_no1.currval from dual;
/*   CURRVAL
    ----------
         3 */



-- 10부터 20까지 2씩 증가하는 시퀀스 생성
create sequence seq_test_no1
    start with 10
    increment by 2
    maxvalue 20;



-- 시퀀스 삭제 명령어
drop sequence seq_test_no1;
