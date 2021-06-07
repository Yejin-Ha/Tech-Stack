/*
# DDL (Data Definition Language)
- 데이터를 정의하는 언어
- table create, drop, alter

# 명령어 Syntax
1. create 
    - create table <table명> (
        <컬럼명> <컬럼타입[(사이즈)]> [제약조건], 
        <컬럼명> ...
    );

2. drop
    - drop table table명;
    - table 복원이 불가능하다.

3. alter
    - alter table <table명>
    - 이미 존재하는 table의 구조를 조작하는 명령어
    - 서비스 중에 table 구조를 변경하는 것은 조심해야한다.

# 같이 사용되는 함수
- add(컬럼명 타입(사이즈)) : 컬럼을 추가하는 함수
- modify(컬럼명 타입(사이즈)) : 이미 존재하는 컬럼 사이즈를 변경하는 함수
    이미 데이터가 존재할 경우 컬럼 사이즈가 큰 사이즈의 컬럼으로 변경 가능
    BUT 사이즈 감소시 존재하는 데이터보다 작은 사이즈로 절대 변경 불가능    
- rename <현재 테이블명> to <바꿀 테이블명> : 존재하는 테이블의 이름을 바꾸는 함수
    Ex. rename emp01 to test;

# 데이터만 삭제하는 명령어
- delete from <테이블명>;
    - 삭제, 복원이 가능하다.
    - 복원시 명령어 : rollback;
        - 영구 저장(commit)된 시점을 A라 가정하면 그 이후의 삭제된 내용이 복구 가능하다.
        - commit 명령어를 사용하여 데이터를 영구 저장하는 것도 필수

- truncate table <테이블명>;
    - 삭제후 복원이 불가능하다.
*/


-- 사용 예시
--1. create
--테이블 형식만 설정하고 데이터는 넣지 않는 경우
create table people(
    name varchar2(20),
    age number(3)
);

--emp table에서 deptno가 10인 empno, ename만 emp01 테이블로 저장(데이터도 저장되는 경우)
create table emp01 as select empno, ename
                    from emp
                    where deptno = 10;

--emp에서 데이터는 안가져오고 형식만 가져오는 경우
    -- where절에 거짓인 내용을 넣으면 된다.
create table emp02 as select * from emp where 1 = 6;




--2. drop
--emp01 table 삭제
drop table emp01;



--3. alter
--empno만 존재하는 emp01 table에 job 컬럼을 추가
alter table emp01 add(job varchar2(10));

--emp01 table의 job 컬럼의 데이터 사이즈를 20으로 변경
alter table emp01 modify (job varchar2(20));


-- 복구 불가능한 데이터 삭제
truncate table emp01;
