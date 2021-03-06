/*
- DB 자체적으로 강제적인 제약 사항 설정
- 개발자 능력 + 시스템(HW/SW) 다 유기적으로 연계가 되서 안정적인 데이터 관리 및 보존 보장 
- 설정은 개발자(DB에 table 생성 및 관리할 수있는 SQL 만드는 직무)의 책임

# Integrity란? 
table 생성시 제약조건을 설정하는 기법 

# 하나의 컬럼에 두개 이상의 제약조건을 넣지 않는 것을 추천한다.

# 제약 조건 종류
    - emp와 dept의 관계
        - 주종관계 / 부모자식 관계 / 상위 table 하위 table 로 표현하기도 함
        - emp의 depto는 반드시 dempt의 deptno 컬럼값에 종속적으로 용되는 컬럼
            -> dept에서 제공 안하는 데이터는 emp에는 사용 불가
        - dept가 데이터 제공해주는 table
        - dept는 주(부모) / emp는 종(자식)

    2-1. PK[primary key] : not null + unique
        - 기본키, 중복불가, null불가, 데이터들 구분을 위한 핵심 데이터
        - 사번, 주민번호 등등 겹치지 않는 데이터

    2-2. not null 
        - 반드시 데이터 존재
		- nn 

    2-3. unique 
        - 중복 불가 

    2-4. check 
        - table 생성시 규정한 범위의 데이터만 저장 가능 
        - Ex) sql 자체적으로 table 생성시에 M or F만 저장 가능하게, 그 이외의 데이터로 insert or update 시에는 철저히 db 자체적 차단

    2-5. default 
        - insert시에 특별한 데이터 미저장시에도 자동 저장되는 기본 값
        - python 관점에는 멤버 변수 선언 후 객체 생성 직후 멤버 변수 기본값으로 초기화

    2-6. FK[foreign key] 
        - 외래키[참조키], 다른 table의 pk를 참조하는 데이터 
        - table간의 주종 관계가 형성
        - pk 보유 table이 부모, 참조하는 table이 자식
        - 부모의 미 존재하는 데이터를 자식에서 새로 생성가능? 불가 
        - 자식 table들이 존재할 경우 부모table만 삭제 가능? 불가
            - 해결책 : 관계를 해제도 가능하나 가급적 분석설계시 완벽하리만큼 고민후 설계


# 제약 조건명 명시하는 방법
	- 약어를 넣을 경우 constraint 키워드를 통해 제약 조건을 설정해야 한다.
	1-1. oracle engine이 기본적으로 설정
		- 사용자가 제약 조건에 별도의 이름을 부여하지 않으면 오라클 자체적으로 SYS_시작하는 이름을 자동 부여
		- SYS_Xxxx
	1-2. 사용자 정의하는 제약 조건에 제약 조건명 명시하는 방법
		sql개발자가 직접 설정
		- table명_컬럼명_제약조건명등 기술..단 순서는 임의 변경 가능
			: dept의 deptno이 제약조건명
				PK_DEPT
				pk_dept_deptno
		- 약어 사용도 가능[분석, 설계시 용어사전 제시후 작성 권장]
		- PK를 중복되게 값을 넣을 경우
			- ORA-00001: unique constraint (SCOTT.PK_DEPT) violated
		- 사실상 not null만 있는 제약조건 설정시에는 이름을 부여하지는 않는다.


# 제약조건 선언 위치
	1. 컬럼 레벨 단위
		- 컬럼선언 라인에 제약조건 설정 
	2. 테이블 레벨 단위 
		- 모든 컬럼 선언 직후 별도로 제약조건 설정
	

# 오라클 자체 특별한 table
	5-1. user_constraints
		- 제약조건 정보 보유 table
		- 개발자가 table의 데이터값 직접 수정 불가
		- select constraint_name, constraint_type, table_name 
			from user_constraints;

		CONSTRAINT_NAME           	   CO  TABLE_NAME
		----------------------------- --- ----------------------------
		PK_DEPT                    	   P   DEPT
		PK_EMP            			   P   EMP
		FK_DEPTNO                      R   EMP

		dept의 제약조건 : deptno는 절대 중복 불가
		emp의 제약조건 : deptno의 값은 반드시 dept table로 부터 참조해서 사용
						empno는 절대 중복 불가

		1. CONSTRAINT_NAME : db 설계해서 sql문장 구성시에 실제 db에 부여하는 사용자 정의 제약조건 명
			- PK_DEPT : dept table
				- 실제 업계에서 권장하는 이름 예시 : PK_DEPT_DEPTNO
			
			- FK_DEPTNO : emp table
				- 실제 업계에서 권장하는 이름 예시 : FK_DEPT_EMP / FK_EMP_DEPTNO / DEPTNO_EMP_FK / EMP_DEPTNO_FK
					- 이름의 구조는 정해져 있지 않고 회사나 그룹마다 다르게 사용하므로 색을 잘 받아들이기

			- *** pk는 primary key(기본키, 주키) : 절대 중복 불가인 셋팅
			- *** fk는 foreign key(외래키, 참조키, reference key) : 다른 table의 고유한 값을 보유한 컬럼을 참조
			- *** nn는 not null : 비어있지 않음
			- *** u는 unique : 값이 겹치지 않음

		2. CONSTRAINT_TYPE 
			- P : primary key
			- R : reference key
*/

-- empno 컬럼에 emp02_empno_nn 라는 약어와 not null이라는 제약조건을 설정했다.
create table emp01 (
	empno number(4) constraint emp02_empno_nn not null,
	ename varchar2(10)
);

-- 다음 명령문은 emp02 table의 제약조건들의 약어, 종류, 테이블 명을 검색한다.
-- where절에 table명을 입력할 때 대문자로 입력해야 된다는 것을 잊지 말자!
select constraint_name, constraint_type, table_name
from user_constraints where table_name='EMP02';

/* 제약 조건명을 설정하는 이유
설정하지 않을 경우와 설정할 경우의 예시를 통해 알 수 있다.
에러 메세지 안에 SCOTT.메세지가 다르다.
그래서 제약 조건명을 설정한 경우 에러가 나면 쉽게 찾을 수 있다.
*/
-- 설정하지 않을 경우
insert into emp02 values(1, 'master');
	-- ORA-00001: unique constraint (SCOTT.SYS_C007010) violated
-- 설정할 경우
insert into emp02 values(1, 'master');
	-- ORA-00001: unique constraint (SCOTT.EMP02_EMPNO_U) violated



/* 외래키(참조키, fk) 사용 예시
이미 제약 조건이 설정된 dept table의 pk컬럼인 deptno를 기준으로 emp02 table의 deptno에도 반영
	syntax : constraint <제약 조건명> references 참조할 테이블명(참조할 컬럼명)

다음의 경우 dept table의 deptno가 부모(주) / emp02 table의 deptno가 자식(종) 이 된다.
*/
create table emp02(
	empno number(3),
	deptno number(2) constraint fk_emp02_deptno references dept(deptno),
);



/* 제약 조건 설정을 하는 방법
1. 컬럼 선언시 함께 설정(컬럼 레벨 단위)
2. 컬럼 선언 마지막에 한번에 설정(테이블 단위)
	문법 : constraint <제약 조건명> <제약 조건 종류> (지정하려는 컬럼명)
*/
create table emp02(
	empno number(4) constraint pk_emp02_empno primary key,
	ename varchar2(20) not null
);

create table emp02(
	empno number(4),
	ename varchar2(20) not null,
	constraint pk_emp02_empno primary key (empno)
);

create table emp02(
	empno number(4),
	ename varchar2(20) not null,
	deptno number(2),
	constraint pk_emp02_empno primary key (empno),
	constraint fk_emp02_deptno references dept(deptno)
);



-- create 와 as select 로 복제되는 table은 원본 table 데이터와 구조는 복사가 되나 제약조건은 복제되지 않는다.
-- 존재하는 table에 제약조건을 추가하려면 다음을 참고하라.
-- dept01 table에 deptno를 pk로 설정하는 예시
alter table dept01 add constraint pk_dept01_deptno primary key (deptno);

-- dept01 table의 deptno를 참조하여 emp01 table에 deptno 컬럼에 제약 조건을 걸 경우
alter table emp01 add constraint fk_emp01_deptno foreign key (deptno)
	references dept01(deptno);



/* 참조 당하는 컬럼(부모, 주) 삭제
1. 자식 table에서 미사용되는 데이터에 한해서는 삭제가 가능하다.
2. 자식 table에서 사용되는 컬럼이더라도 삭제하는 명령어도 존재한다.
	- 현업에선 부득이하게 이미 개발중에 table 구조를 변경해야 할 경우가 간혹 발생한다.
	- 자식의 존재를 완전 무시하고 부모 table을 삭제하는 경우이다.
*/
-- 1.
delete from dept01 where deptno >= 60;

-- 2. 
drop table dept01 cascade constraint;



/* check (ck)
if 조건식과 같이 저장 직원의 데이터와 유효 유무 검증하는 제약조건
입력된 데이터가 조건에 해당하지 않으면 error가 난다.


*/
-- 입력된 데이터가 100 이하의 양의 정수라면 age에 저장한다는 조건
create table emp01 (
	name varchar2(10) not null,
	age number(3) constraint ck_emp01_age check (age between a and 100)
);



-- defaul : 데이터 insert 시 데이터를 생략해도 자동으로 db에 저장되는 기본값
create table emp01 (
	id varchar2(10) primary key,
	gender char(1) default 'F'
);
