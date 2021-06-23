/*
# 프로시저 & 함수
- 재사용을 위한 기능 구현
- 기본 문법 흡사


# 프로시저
- 호출 방법이 함수와 차이가 있음


# 함수
- oracle 함수 호출하듯 사용자 정의 함수 호출 가능


# oracle db만의 프로그래밍 개발 방법
    1. 이름 없이 단순 개발
    2. 프로스저라는 타이틀로 개발 - 이름 부여(재사용)
    3. 함수라는 타이틀로 개발 - 이름 부여(재사용)


# 장점
    - 단 한번의 실행 만으로 내장 함수처럼 만들어서 필요시 호출해서 실행 가능
    - 프로시저와 함수로 구현시 db내부에 pcode로 변환


# 프로시저를 위한 필수 셋팅 
    - set serveroutput on 
        - 명령어를 처음에 실행하지 않으면 결과가 출력되지 않는다.


# 필수 암기 
    - 할당(대입) 연산자  :=
        - python 연산자 표현법  =

    - + 연산자 : ||
        - python 연산자 표현법  +
        
    - 선언, 시작, 끝
        declare 
            변수 선언
        begin 
            로직 처리
        end; 
        /

    - 실행결과 출력 코드
        dbms_output.put_line(<출력하고 싶은 데이터명>)
        - 다수의 데이터를 출력하고 싶으면 ||를 이용하여 출력한다.

# 조건식(if)
    1. 단일 조건식
        if (조건) then
        end if;
    2. 다중 조건
        if (조건1) then
        elsif (조건2) then
        end if;

# 가변적으로 변수 선언
    &<변수명>
    이런 형식으로 사용한다.

# 반복문
    1. 기본
        loop
            plsql 문장을 + 조건에 사용될 업데이트
            exit 조건;
        end loop;

    2. while 기본 문법
        while 조건식 loop
            plsql 문장;
        end loop;

    3. for 기본 문법
        for 변수 in [reverse] start ..end loop
            plsql 문장;
        end loop;
*/

-- 0. 실행결과 출력을 위한 필수 설정
    -- 이 코드를 실행하지 않으면 PLSql의 실행결과가 출력되지 않는다.
set serveroutput on



-- 1. 프로시저 기본 문법
declare             -- 변수 선언하는 부분
    num integer;
begin               -- 로직 구현(처리)하는 부분
    num := 20;      -- num이라는 변수에 20을 할당
    dbms_output.put_line('num is ' || num); -- || 연산자를 사용하여 'num is 20'을 출력한다.
end;                -- 끝
/                   -- 진짜 마무리
-- ;도 생략하면 안되고 /도 생략하면 안된다.



-- 2. 예외처리
declare
	no integer := 10;
begin
	dbms_output.put_line('결과 ' || no);
	no := 10 / 0;   -- 0으로 나눠서 에러가 난다.
	                -- ORA-01476: divisor is equal to zero

	exception       -- 에러가 발생하면 then을 실행시킨다.
		when others then
			dbms_output.put_line('예외발생');
		-- 모든 error을 others라고 칭한다.

	dbms_output.put_line('결과 ' || no);
end;
/



-- 3. 위치에 따른 변수의 구분
declare                 -- 전역 변수를 선언하는 구역
	v_global varchar2(10) := 'g';
begin
	dbms_output.put_line(v_global);

	declare         	-- 로컬 변수를 선언하는 구역
		v_local varchar2(10) := 'l';
	begin
		dbms_output.put_line(v_global);
		dbms_output.put_line(v_local);

	end;
	dbms_output.put_line(v_global);     
	dbms_output.put_line(v_local);  -- 지역 변수를 다른 구역에서 불러서 에러가 발생한다.
		-- PLS-00201: identifier 'V_LOCAL' must be declared

end;
/



-- 4. 특정 테이블의 컬럼 타입을 그대로 사용할 경우
    -- %type : db의 특정 컬럼의 타입을 의미한다.
declare
    v_empno emp01.empno%type;   -- emp01 table의 empno 컬럼의 타입과 같은 v_empno를 선언한다.
begin
    select empno
        into v_empno            -- emp01 table에서 empno가 7369인 empno를 v_empno에 할당한다.
    from emp01
    where empno = 7369;
end;
/



-- 5. 다른 table의 모든 컬럼 타입 활용
    -- %rowtype
declare
    v_rows emp01%rowtype;   -- emp01 table의 모든 컬럼와 타입이 같은 v_rows를 생성한다.
begin
    select * 
        into v_rows
    from emp01
    where empno=7369;
    -- v_rows의 empno컬럼과 ename컬럼의 값을 출력한다.
    dbms_output.put_line(v_rows.empno || v_rows.ename);
end;
/

-- Q. emp table과 컬럼 속성이 같은 emp05 table을 생성하고 empno가 7369인 데이터를 넣어라.
drop table emp05;
create table emp05 as select * from emp where 1=0;

declare
    v_rows emp05%rowtype;
begin
    select * 
        into v_rows
    from emp05
    where empno=7369;
    insert into emp05 values v_rows;
end;
/



-- 6. 조건식 사용 예제
    -- Q. emp table에서 ename이 ALLEN인 데이터의 연봉을 구하시오.
declare
    v_sal emp.sal%type;
    v_comm emp.comm%type;
    total number(7,2);
begin
    select sal, comm
        into v_sal, v_comm
    from emp
    where ename ='ALLEN';

    if (v_comm is null) then
        v_comm := 0;
    end if;

    total := v_sal * 12 + v_comm;
    dbms_output.put_line(total);
end;
/



-- 7. 가변적인 데이터 생성
declare
	ck_empno emp.empno%type := &v; 	
	v_empno emp.empno%type;
	v_deptno emp.deptno%type;
	v_dname varchar2(10);
begin
    select empno, deptno
		into v_empno, v_deptno
	from emp
	where empno = ck_empno;

	if (v_deptno=10) then	
		dbms_output.put_line('ACCOUNT');
	elsif (v_deptno=20) then	
		dbms_output.put_line('RESEARCH');
	else
		dbms_output.put_line('None');
	end if;
end;
/



-- 8. 반복문
    -- 1. 기본 LOOP
declare
    num number(2) := 0;
begin
    loop
        dbms_output.put_line(num);
        num := num + 1;
        exit when num > 5;
    end loop;
end;
/
    -- '1 2 3 4 5'가 출력된다.

    -- 2. while loop
declare
    num number(1) := 5;
begin
    while num > 0 loop
        dbms_output.put_line(num);
        num := num - 1;
    end loop;
end;
/
    -- '5 4 3 2 1' 출력

    -- 3. for loop
    -- 오름차순
declare
begin
    for num in 0..4 loop
        dbms_output.put_line(num);
    end loop;
end;
/
    -- '0 1 2 3 4' 출력
    
    -- 내림차순
declare
begin
	for num in reverse 0..4 loop
		dbms_output.put_line(num);
	end loop;
end;
/
