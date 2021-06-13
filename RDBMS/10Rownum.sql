/*
# rownum
- oracle 자체적으로 제공하는 컬럼
- table 당 무조건 자동 생성
- 검색시 검색된 데이터 순서대로 rownum값 자동 반영
    - 1부터 시작
    - 실행 순서 : from -> where -> select 


# inline view
- 검색시 빈번히 활용되는 스펙
- 다수의 글들이 있는 게시판에 필수로 사용(paging 처리)
- 서브쿼리의 일종으로 from절에 위치하여 테이블처럼 사용
- 원리 : sql문 내부에 view를 정의하고 이를 테이블처럼 사용 
- from절에 select문장으로 검색된 데이터가 반영되는 구조를 inline
	- 임시로 생성된 table로 간주 즉 물리적으로 존재하는 table로 간주
	- 논리적인 table 즉 view

select 검색 컬럼
from 존재하는 table 또는 검색된 데이터(임시 table)


*/
-- 해당 table의 empno, deptno와 rownum이 검색된다.
select rownum, empno from emp;
select rownum, deptno from dept;

-- where 절에 rownum을 이용하여 상위 몇개의 데이터를 가져올 경우 다음의 코드를 참고하자
-- rownum을 사용하여 상위 3개의 데이터만 검색
    -- 4보다 큰(>)이 아닌 4 미만이 된다는 것을 인지하자
select rownum, deptno from dept where rwonum < 4;



-- dept table에서 deptno의 값이 오름차순으로 정렬해서 상위 3개의 데이터만 검색
select rownum, deptno
from (
    select deptno
    from dept
    order by deptno asc
)
where rownum < 4;



-- emp table에서 인라인 뷰를 사용하여 급여(sal)를 많이 받는 순서대로 3명만 이름(ename)과 급여 검색 
select rownum, sal, ename
from (
    select sal, ename
    from emp
    order by sal desc
)
where rownum < 4;
