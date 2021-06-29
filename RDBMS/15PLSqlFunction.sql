/*
# 함수 개발의 필요성
	가령 : login과 같은 무수히 많은 user가 동일한 로직 요청시에도 서버단에선 단 하나의 함수가 그 수많은 유저로 요청 처리
	함수 하나가 재사용 단 주의사항 : client가 입력하는 모든 인증용 데이터는 명확히 구분
	개발 방법으로 로컬 변수로 선언
	함수 내부에 선언되는 변수 의미


1. 저장 함수(function)
	- 오라클 사용자 정의 함수 
	- 오라클 함수 종류
		- 지원함수(count(??){ }, avg()...) + 사용자 정의 함수

2. 주의사항
	- 기존 함수명들과 중복 불가

3. 프로시저와 다른 문법
	- 리턴 타입 선언 + 리턴 값

4. Oracle db 자체내에 구현하는 사용자 정의 함수 문법
	4-1. 함수 생성만
		create function 함수명([..])
		return 함수 실행결과 반환하는 타입
		is
			함수내에서 사용될 변수 선언
		begin
			처리 로직
		end;
		/

	4-2. 함수 생성 또는 치환(기존 함수대신 새로 갱신)
		create or replace function 함수명([..])
		return 함수 실행결과 반환하는 타입
		is
			함수 내에서 사용될 변수 선언
		begin
			처리로직
		end;
		/
*/

-- 1. 함수 생성
    -- emp table의 사번으로 사번 이름을 검색하는 user_fun 생성
create function user_fun(num number)
return varchar2             -- return 타입 명시
is                          -- 새로운 변수 선언
    v_ename emp.ename%type;
begin
    select ename
        into v_ename
    from emp
    where num = empno;

    return v_ename;         -- return 데이터
end;
/

select user_fun(7369) from dual;


    -- Q. sal을 sal * 2로 변경하는 sal_bonus 함수 생성(empno를 입력받는다.)
create or replace function sal_bonus(no emp.empno%type)
return emp.sal%type
is
    v_sal emp.sal%type;
begin
    select sal
        into v_sal
    from emp
    where empno = no;

    v_sal := v_sal * 2;
    return v_sal;
end;
/

select empno, job, sal, sal_bonus(7369) from emp where empno=7369;



    -- Q. empno를 입력받아 최고 급여액을 반환하는 s_max_sal 생성
create or replace function s_max_sal(no emp.empno%type)
return emp.sal%type
is
    v_max emp.sal%type;
begin
    select max(sal)
        into v_max
    from emp
    group by deptno
    having deptno = no;

    return v_max;
end;
/

select s_max_sal(20) from dual;



    -- Q. deptno를 입력받아 부서별 평균 sal를 반환하는 avg_sal 생성
create or replace function avg_sal(no emp.deptno%type)
return emp.sal%type
is
    v_avg emp.sal%type;
begin
    select avg(sal)
        into v_avg
    from emp
    group by deptno
    having deptno = no;

    return v_avg;
end;
/

select avg_sal(30) from dual;



-- 2. 함수 삭제 명령어
drop function avg_sal;



-- 3. 함수 내용 검색
desc user_source;
select text from user_source where type='FUNCTION';
