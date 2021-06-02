/* 
1. 기본 syntax
select 검색하고자하는 컬럼명
from table명;

실행순서 : from -> select 
*/

-- 존재하는 모든 table명을 호출하는 코드
select * from tab;


-- 해당 table의 모든 column의 데이터 타입을 알려준다.
desc /* table명 */;

-- 해당 table의 모든 데이터들을 호출
select * from /* table명 */;

-- emp table에 존재하는 특정 컬럼(ename, empno)을 호출
select ename, empno from emp;

-- emp table에서 중복을 제거한 deptno를 호출
select distinct deptno from emp;


-- *********************************************************************


/*
2. 정렬(order by) syntax
-- order by asc(오름차순), desc(내림차순) 
	- 입력을 안해도 asc가 default이지만 생략 금지 !!!!

select 컬럼명
from table 명
order by 정렬 기준 컬럼명 (asc / desc);

실행순서 : from -> select -> order by
*/

-- emp table에 존재하는 모든 데이터를 deptno를 기준으로 오름차순으로 호출
select *
from emp
order by deptno asc;

/* asc로 정렬할 경우
NUMBER type -> 작은 숫자부터 정렬
DATE type -> 오래된 순으로 정렬
VARCHAR type -> A ~ Z 순으로 정렬
*/


-- *********************************************************************


/*
3. 조건절(where) syntax
select 컬럼명
from talbe명
where 조건;

실행순서 : from -> where -> select

4. 조건절(where) & 정렬절(order by) syntax
select 컬럼명
from talbe명
where 조건
order by 정렬기준인 컬럼명;

실행순서 : from -> where -> select -> order by
*/

-- emp table에서 comm이 null인 사원에 대한 검색한 뒤 ename, comm을 출력
select ename, comm 
from emp
where comm is null;

-- emp table에서 comm이 null이 아닌 사원에 대한 검색한 뒤 ename, comm을 출력
select ename, comm 
from emp
where comm is not null;

-- emp table에서 deptno가 10이고 job이 'MANAGER'인 사원이름 검색 
select ename
from emp
where deptno = 10 and job = 'MANAGER';

-- emp table에서 deptno가 10이거나 job이 'MANAGER'인 사원이름 검색
select ename
from emp
where deptno = 10 or job="MANAGER";

-- emp table에서 comm의 데이터가 300이거나 500이거나 1400인 사원이름과 comm을 검색
select ename, comm
from emp
where comm in (300, 500, 1400);

-- NUMBER type뿐만 아니라 DATE type도 비교 연산이 가능하다.
-- emp table에서 hiredate가 81년도인 데이터를 검색
	-- between and 연산자를 이용하면 해당 값들도 포함해서 검색한다.
select *
from emp
where hiredate between '81/01/01' and '81/12/31';
	-- like 연산자 : _는 한 단어로, %는 여러 단어로 인식한다.
select *
from emp
where hiredate like '81/%';


