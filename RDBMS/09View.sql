/*
* view 사용을 위한 필수 선행 설정
	1단계 : admin 계정으로 접속
	2단계 : view 생성해도 되는 사용자 계정에게 생성 권한 부여
		> connect system/manager
		> grant create view to SCOTT;
		> conn SCOTT/TIGER


1. view 란?
	- 물리적으로는 미 존재, 단 논리적으로 존재
	- 물리적(create table)
	- 논리적(존재하는 table들에 종속적인 가상 table)


2. 개념
	- 보안을 고려해야 하는 table의 특정 컬럼값 은닉
        - table을 바로 사용한다면 client는 모든 데이터를 볼 수 있게 되므로 view를 통해 일부의 데이터만 제공하여 불필요한/중요한 데이터는 제외한다.
	- 또는 여러개의 table의 조인된 데이터를 다수 활용을 해야 할 경우 특정 컬럼 은닉, 다수 table 조인된 결과의 새로운 테이블 자체를 가상으로 db내에 생성시킬수 있는 기법 
	* ex *
	1. emp의 comm 컬럼은 영업부 사원에게만 몰래 있는 구조
		(타 직무들은 존재 자체를 모른다 할 경우)
	2. 외부 개발자가 투입되서 사내 정보 사용시에 부득이하게 모든 정보 오픈 불가인 상황이라면 특정 컬럼은 은닉해서 동일한 구조의 table 형식을 제공이 은닉된 테이블의
        정보로만 개발


3. 문법
	- create와 drop : create view/drop view
	- crud는 table과 동일


4. view 기반으로 crud 반영시 실제 원본 table에도 반영이 된다.
	- 눈여겨서 보기!!!!


5. 종류
	5-1. 단일 view : 별도의 조인 없이 하나의 table로 부터 파생된 view
	5-2. 복합 view : 다수의 table에 조인 작업의 결과값을 보유하는 view
	5-3. 인라인 view : sql의 from 절에 view 문장  


6. 실습 table
	- dept01 table생성 -> dept01_v view 를 생성 -> crud -> view select/dept01 select 
*/

-- 사용자 계정에게 view 생성 권한 부여
grant create view to SCOTT;

-- test table 생성
create table dept01 as select * from dept;



/* 1. dept01 table 상의 view 생성
    -- SCOTT 계정으로 view 생성 권한 받은 직후에만 가능


# 빈번히 사용하는 sql 문장에 대하여
방법 1. 사용할 때 마다 join하여 sql 문장 실행
방법 2. 이미 join된 view를 생성한 뒤 필요시에 view만 select 하여 사용

    -> 방법 2의 속도가 빨라서 주로 권장된다.
*/
create view dept01_v as select * from dept01;
desc dept01_v;
select * from dept01_v;


/*
view는 데이터가 아닌 sql 문장이 text로 저장되어 저장공간의 할애가 없다.
다음 코드를 통해 확인 가능하다.
*/
select * from user_views;
desc user_views;




-- 2. view에 CRUD를 사용할 경우 원본 테이블의 데이터에도 영향이 생긴다.
select * from dept01_v;
insert into dept01_v values(50, '교육부', '홍대');
select * from dept01_v;
select * from dept01;
/*
SQL> select * from dept01_v;
    DEPTNO DNAME                        LOC
---------- ---------------------------- --------------------------
        10 ACCOUNTING                   NEW YORK
        20 RESEARCH                     DALLAS
        30 SALES                        CHICAGO
        40 OPERATIONS                   BOSTON

SQL> insert into dept01_v values(50, '교육부', '홍대');
SQL> select * from dept01_v;

    DEPTNO DNAME                        LOC
---------- ---------------------------- --------------------------
        10 ACCOUNTING                   NEW YORK
        20 RESEARCH                     DALLAS
        30 SALES                        CHICAGO
        40 OPERATIONS                   BOSTON
        50 교육부                       홍대

SQL> select * from dept01;

    DEPTNO DNAME                        LOC
---------- ---------------------------- --------------------------
        10 ACCOUNTING                   NEW YORK
        20 RESEARCH                     DALLAS
        30 SALES                        CHICAGO
        40 OPERATIONS                   BOSTON
        50 교육부                       홍대

dept01_v view에 CRUD를 사용하니 dept01 table(원본)도 데이터가 변화한 것을 확인 가능 
 */
commit;
--을 통해 데이터 저장(복구 불가)



-- 3. view 삭제
drop view dept01_v;
select * from user_views;



-- inline view를 사용할 수 도 있다.
-- 다음의 경우 inline view에서 검색되지 않은 컬럼은 메인 select에서 사용이 불가능하다.
select loc, ename
from ( select ename, loc, e.deptno
    from emp e, dept d
    where e.deptno = d.deptno
);
