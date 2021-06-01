/* 
1. 기본 syntax
select 검색하고자하는 컬럼명
from table명;

실행순서 : from -> select 
*/

-- 전체 table명을 호출하는 코드
SELECT * FROM tab;

-- 해당 table의 모든 column의 데이터 타입을 알려준다.
DESC /* table명 */;

/* 	NUMBER(4) : 정수 4자리
	VARCHAR2(10) : 철자 10개까지 허용하는 문자열
	NUMBER(7,2): 실수, 전체 자리수는 7자리 단 소수점 이하는 2자리
*/

/*
2. 정렬(order by) syntax
-- order by asc(오름차순), desc(내림차순) - 생략 금지 plz
select 컬럼명
from table 명
order by 정렬 기준 컬럼명 (asc / desc);

실행순서 : from -> select -> order by

*******************************************************

3. 조건절(where) syntax
select 컬럼명
from talbe명
where 조건;

실행순서 : from -> where -> select

*******************************************************

4. 조건절(where) & 정렬절(order by) syntax
select 컬럼명
from talbe명
where 조건
order by 정렬기준인 컬럼명;

실행순서 : from -> where -> select -> order by
*/







--1. sqlplus창 보기 화면 여백 조절 편집 명령어
	-- 단순 sqlplus tool만의 편집 명령어
	-- 영구 저장 안됨. sqlplus 실행시마다 해 줘야 함
set linesize 200
set pagesize 200