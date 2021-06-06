/*
# SubQuery 란?
- select문 내에 포함된 또 다른 select문 작성 방법
    - join 또는 SubQuery로 동일한 결과값 검색

# Syntax
- 비교 연산자(대소비교, 동등비교 등등) 오른쪽에 () 안에 select문 작성
- create 및 insert에도 사용 가능
- 실행순서 : sub query가 main 쿼리 이전에 실행된다.

# Tip
- 개발시 다수의 test를 위해서 원본이 아닌 복사본 table 활용을 권장한다.
*/ 

--subQuery의 결과가 단일 row인 실행 예시들
--Q01. emp table에서 SMITH와 동일한 직급(job)을 가진 사원들의 모든 정보 검색(SMITH 미포함)
select *
from emp
where job = (
    select job
    from emp
    where ename = 'SMITH'
) and ename != 'SMITH';

--Q02. 평균 급여(sal)보다 더 많이 받는 사원 검색
select * 
from emp
where sal > (
    select avg(sal) from emp
);

--subQuery의 결과가 다중 row인 실행 예시들(결과값이 하나 이상)
--Q03. 부서별로 가장 급여를 많이 받는 사원의 정보
select deptno, max(sal)
from emp
group by deptno;

select *
from emp
where (deptno, sal) in (select deptno, max(sal)
    from emp
    group by deptno
);

--Q04. 직급(job)이 MANAGER인 사람이 속한 부서의 부서 번호(deptno)와 부서명(dname)과 지역을 검색
select deptno, dname, loc
from dept
where deptno in (
    select deptno
    from emp
    where job = 'MANAGER'
);


