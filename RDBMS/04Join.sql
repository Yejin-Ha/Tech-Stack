/*
1. 조인이란?
	다수의 table간에  공통된 데이터를 기준으로 검색하는 명령어
	다수의 table이란?
		동일한 table을 논리적으로 다수의 table로 간주
			- self join
		물리적으로 다른 table간의 조인


2. table에 별칭 사용 
	검색시 다중 table의 컬럼명이 다를 경우 table별칭 사용 불필요, 
	서로 다른 table간의 컬럼명이 중복된 경우 컬럼 구분을 위해 오라클 엔진에게 정확한 table 소속명을 알려줘야 함
	- table명 또는 table명 별칭
	- 주의사항 : 컬럼별칭 as[옵션], table별칭 as 사용 불가


3. 조인 종류 
	1. 동등 조인
        = 동등비교 연산자 사용
        : 사용 빈도 가장 높음
        : 테이블에서 같은 조건이 존재할 경우의 값 검색 

	2. not-equi 조인
		: 100% 일치하지 않고 특정 범위내의 데이터 조인시에 사용
		: between ~ and(비교 연산자)

	3. self 조인 
		: 동일 테이블 내에서 진행되는 조인
		: 동일 테이블 내에서 상이한 칼럼 참조

	4. outer 조인 
		: 두개 이상의 테이블이 조인될때 특정 데이터가 모든 테이블에 존재하지 않고 컬럼은 존재하나 null값을 보유한 경우에 검색되지 않는 문제를 해결하기 위해 사용되는 조인
		: null 값이기 때문에 배제된 행을 결과에 포함 할 수 있으며 (+) 기호를 조인 조건에서 정보가 부족한 컬럼쪽에 적용
		: oracle DB의 sql인 경우 데이터가 null 쪽 table 에 + 기호 표기 
*/


--1. 동등 조인
-- emp table과 dept table을 조인해서 emp table의 ename이 SMITH인 데이터들 중 ename, empno, loc를 검색
select ename, empno, loc
from emp, dept
where ename = 'SMITH';

-- 동등 조인을 사용할 경우 두 table에 같은 컬럼명이 들어있으면 구분을 위해 <table명>.<컬럼명> 으로 select 해야한다.
select ename, empno, emp.deptno, dept.deptno
from emp, dept
where ename = 'SMITH';



-- 2. not-equi 조인
-- emp, salgrade table에서 sal이 losal과 hisal에 포함되는 데이터들의 empno, ename, sal, grade 검색
select empno, ename, sal, grade
from emp, salgrade
where sal between losal and hisal;



-- 3. self 조인
-- emp table에서 이름이 SMITH인 직원(사원)의 메니저(상사)의 ename 검색
select m.ename
from emp e, emp m
where e.ename = 'SMITH' and e.mgr = m.empno;
-- 사원 = e, 매니저 = m 으로 별칭을 만들어서 진행



-- 4. outer join
-- emp table에서 모든 사원명과 메니저명을 검색. 단, 메니저가 없는 사원도 검색되어야 한다.

select e.ename 사원명, m.ename 메니저명
from emp e, emp m
where e.mgr=m.empno(+);




