/*
1. 저장 프로시저
	- 이름을 부여해서 필요한 시점에 재사용 가능한 plsql
	- DB에 사용자 정의 기능을 등록 -> 필요한 시점에 사용

2. 문법
	2-1. 생성
		- 이미 동일한 이름의 procedure가 존재할 경우 error 발생 
		create procedure  이름
		is
		begin
		end;
		/

	2-2. 생성 및 치환
        - 미 존재할 경우 생성, 존재할 경우 치화
		create or replace procedure
		is
		begin
		end;
		/

3. 에러 발생시
show error

4. 


참고사이트
https://oracle.github.io/python-cx_Oracle/samples/tutorial/Python-and-Oracle-Database-Scripting-for-the-Future.html#plsql

*/


-- 1. procedure 정보 확인 sql 문장
desc user_source;
select * from user_source;

-- test table 생성
drop table dept01;
drop table emp01;
create table detp01 as select * from dept;
create table emp01 as select * from emp;



-- 2. procedure 생성
    -- deptno가 20인 데이터의 job을 STUDENT로 변경하는 프로시저 생성
    -- 생성은 했지만 실행은 하지 않은 상태
create or replace procedure update_job
is 
begin
    update emp01 set job='STUDENT' where deptno=20;
end;
/

    -- 프로시저 실행하는 명령어
select * from emp01;
execute update_job;
select * from emp01;
    -- 되돌리기
rollback;


-- Q. 가변적인 사번으로 실행시마다 해당 사원의 급여가 500씩 +되는 프로시저 생성
    -- sql문장 상의 컬럼에 plsql 변수값 대입할 경우엔 기본 대입 연산자 활용( = )
    -- plsql 변수에 값 할당시에는 할당 연산자 활용 ( := )
create or replace procedure sal_update(v_empno emp.empno%type)
is
begin
	update emp01 set sal = sal + 500 where empno = v_empno;
end;
/

select empno, sal from emp01 where empno = 7369;
execute sal_update(7369);
select empno, sal from emp01 where empno = 7369;


-- Q. empno, sal을 입력받아서 해당 직원의 희망 급여를 변경하는 프로시저 생성
create or replace procedure update_sal(v_empno emp01.empno%type, hope emp01.sal%type)
is
begin
    update emp01 set sal = hope where empno = v_empno;
end;
/

select empno, sal from emp01 where empno=7369;
execute update_sal(7369, 2000);
select empno, sal from emp01 where empno=7369;
