/* ***[그룹함수]***
- 그룹함수란? 다수의 행 데이터를 한번에 처리해서 하나의 결과값으로 검색되는 함수
- 장점 : 함수 연산시 null 데이터를 함수 내부적으로 사전에 고려해서 null값 보유한 field는 함수 로직 연산시 제외, sql 문장 작업 용이함

1. count() : 개수 확인 함수
    - count(*) : 전체 row의 개수

2. sum() : 합계 함수

3. avg() : 평균

4. max(), min() : 최대값, 최소값 
*/

-- 사용 예시
-- 1. count()
select count(*) from emp;
-- emp table에서 중복되지 않는 job의 개수
select count(distinct job) from emp;

-- 2. sum()
select sum(sal) from emp;

-- 3. avg()
select avg(sal) from emp;

-- 4. max(), min()
select max(sal), min(sal) from emp;
-- emp table에서 가장 최근의 입사일(hiredate)과 가장 오래된 입사일을 검색
select max(hiredate), min(hiredate) from emp;



/* ***[그룹함수시 사용되는 문법(순서)]***
1. select절 : 검색하고자 하는 속성
2. from절	: 검색 table
3. group by 절 : 특정 조건별 그룹화하고자 하는 속성
4. having 절 : 그룹함수 사용시 조건절
5. order by절 : 검색된 데이터를 정렬
*/

-- emp table에서 부서별 급여(sal)중 최대값(max)과 최소값(min)을 구하되 최대 급여가 2900이상(having)인 부서만 부서번호(deptno)를 기준으로 오름차순으로 출력
select deptno, max(sal), min(sal) 
from emp
group by deptno
having max(sal) >= 2900
order by deptno asc;

/*     DEPTNO   MAX(SAL)   MIN(SAL)
    ---------- ---------- ----------
        10       5000       1300
        20       3000        800 */
