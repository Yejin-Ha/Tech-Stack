/*
# DML : Data Mainpulation Language
- 데이터 조작 언어
- select / insert / update / delete 모두 다 DML이다.
- 이미 존재하는 table에 데이터 저장, 수정, 삭제, 검색

# transaction(트랜잭션) 관점에서의 차이점
- DML과 DDL의 차이
    - DDL(create/drop/alter)은 commit & rollback이 무요한 명령어
    - DML은 commit & rollback 유요한 명령어
        -> 데이터 복원이 가능하다.

# Statements Syntax
1. insert
    1) 모든 컬럼에 데이터 저장
    - 테이블 구조상의 컬럼 순서에 맞게 모든 데이터 저장시 사용하는 방법
        -> 컬럼 순서에 맞게 세팅하도록 주의
        -> 순서에 맞지 않으면 "ORA-01722: invalid number" 발생
    - 컬럼명 명시 생략
        insert into <table명> values (데이터값1, ...);

    2) 특정 컬럼에만 데이터 저장
    - 명확하게 컬럼명을 기술해야할 경우
        insert into <table명> (컬럼명1, ...) values (컬럼명1과 매핑될 데이터, ...);

    3) 하나의 sql문장으로 다수의 데이터 저장
    - 컬럼명 명시는 생략 가능
        insert all
            into <table명> (컬럼명1, ...) values (데이터1, ...)
            into <table명> (컬럼명1, ...) values (데이터1, ...)
            ...
        select <원하는 컬럼1, ...> from <데이터를 검색할 table명>;

# when 조건식
    when <조건식> then <실행문>
*/
insert into people values('하예진', 20);

insert into people (age, name) values (20, '하예진')

insert all
    into people values ('하예진', 20)
    into people (name, age) values ('홍길동', 20)
select * from dual;

insert all
    when deptno = 20 then
        insert emp01 values(empno, ename, deptno)
select empno, ename, deptno from emp;



/*
2. update
    1) 모든 table(다수의 row)의 데이터 한번에 수정
    - where 조건문 없는 문장
        update <table명> set 컬럼명 = 수정데이터;

    2) 특정 row값만 수정
    - where 조건문으로 처리하는 문장
        update <table명> set 컬럼명 = 수정데이터 where <조건 sql>;
*/
-- 모든 deptno를 99로 수정
update emp01 set deptno = 99;

-- 급여가 3000이상(where sal >= 3000)인 사원의 급여만 10%인상
update emp01 set sal *= 101
    where sal >= 3000;

-- subQuery를 이용해서 emp01 table에 DALLAS(dept의 loc)에 위치한 부서의 소속 사원들의 급여를 1000인상하고 job을 'MANAGER'로 변경해라
update emp01 
    set sal += 1000, job= 'MANAGER'
    where detpno = (
        select detpno
        from dept
        where loc = 'DALLAS'
    );



/*
3. delete
    1) table의 모든 데이터 삭제
        delete from <table명>;
        delete <table명>;

    2) 조건에 부합되는 데이터만 삭제
        delete from <table명> where <조건식>;
        delete <table명> where <조건식>;
*/
delete from emp01;

delete from emp01 where deptno=30;

-- SubQuery를 활용하여 emp01 table에서 부서명이 RESEARCH 부서에 소속된 사원 삭제 
delete from emp01 where deptno = (
	select deptno
	from dept
	where dname = 'RESEARCH'
);



/*
4. merge(병합)
    - 다수의 table 데이터를 하나로 병합하는 구조
    - 별칭은 생략 가능
        merge into <병합하여 데이터를 바꾸고 싶은 table명> <별칭>
        using <이미 데이터를 보유한 table명> [별칭]
        on <조건식>
*/
-- produce01과 produce02는 새로 개발한 제품들 관리 table
-- produce_total : 재고관리 table
create table produce01(판매번호 varchar2(5), 제품번호 char(4), 수량 number(3), 금액 number(5));
create table produce02(판매번호 varchar2(5), 제품번호 char(4), 수량 number(3), 금액 number(5));
create table produce_total(판매번호 varchar2(5), 제품번호 char(4), 수량 number(3), 금액 number(5));

-- produce01의 데이터를 활용하여 produce_total에 판매번호가 같은 데이터들의 값을 update한다.
-- when matched then : on의 조건문에 적합하면 다음이 실행되고
-- when not matched then : on의 조건문이 부적합하면 다음이 실행된다.
merge into produce_total t
using produce01 p1
on (t.판매번호 = p1.판매번호)
when matched then
	update set t.수량 = t.수량+p1.수량
when not matched then 
	insert values(p1.판매번호, p1.제품번호, p1.수량, p1.금액);
