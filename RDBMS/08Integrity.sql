/*
- DB 자체적으로 강제적인 제약 사항 설정
- 개발자 능력 + 시스템(HW/SW) 다 유기적으로 연계가 되서 안정적인 데이터 관리 및 보존 보장 
- 설정은 개발자(DB에 table 생성 및 관리할 수있는 SQL 만드는 직무)의 책임

# Integrity란? 
table 생성시 제약조건을 설정하는 기법 


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


