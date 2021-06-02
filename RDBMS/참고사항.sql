문자열은 ""가 아닌 ''를 입력해야한다.
-> "" : error

table, column명은 대소문자를 똑같이 인식하지만 데이터에서의 대소문자는 다르게 인식하므로 신중하게 입력해야한다.

부정연산자 : !=, <>, not 
-- is, not은 null만 연관이 있는듯
-- not 의 위치는 where 바로 뒤나 col 명 뒤에 와도 무관하다.


-- application에서 sql 문장 사용시 권장 형식
SELECT 소문자
FROM 소문자
WHERE 소문자
-- 데이터는 대소문자가 중요하지만 col 명에서는 대소문자가 똑같다.


--1. sqlplus창 보기 화면 여백 조절 편집 명령어
	-- 단순 sqlplus tool만의 편집 명령어
	-- 영구 저장 안됨. sqlplus 실행시마다 해 줘야 함
set linesize 200
set pagesize 200

-- 2. 간단한 연산식이나 table을 사용하지 않고 출력할 경우
    -- dual : 잉여 테이블
    -- 임시 table으로 문법 오류 방지용으로 주로 사용한다.
select 2 + 3 from dual;



-- emp table에 존재하는 ename 컬럼을 이름이라는 별칭으로 호출함
select ename as 이름 from emp;


-- nvl(null을 보유한 col, 변경할 값)
    -- null값을 다른 값으로 치환하는 함수 
    -- 다음 코드의 경우 null 값을 0으로 치환해서 계산
select sal, sal + nvl(comm, 0) as 연봉 from emp;
