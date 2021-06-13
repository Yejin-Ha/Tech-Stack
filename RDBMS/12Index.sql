/*
# db의 빠른 검색을 위한 색인 기능의 index 학습
- primary key(not null/unique)는 기본적으로 자동 index로 설정됨 	
- DB 자체적으로 빠른 검색 기능 부여
    = index를 통해 빠른 검색 가능 
- sql명령문의 검색 처리 속도 향상을 위한 oracle db 자체의 객체


# 주의사항
- index가 반영된 컬럼 데이터가 수시로 변경되는 데이터라면 index 적용은 오히려 부작용
- 데이터 셋의 15% 이상의 데이터들이 잦은 변경이 이뤄질 경우 index 설정 비추


# Syntax
- 원하는 table에 index 설정 방법
    create index <제약조건명> on <원하는 table명>(<index를 설정할 컬럼명>);

- index 삭제 명령어
    drop index <제약조건명>;
*/
drop table emp01;
create table emp01 as select * from emp;

-- index 생성
create index idx_emp01_empno on emp01(empno);


-- SMITH 사번 검색 시간 체크  
select * from emp01 where empno=7369;
select * from emp01 where ename='SMITH';


-- index 삭제 명령어
drop index idx_emp01_empno;
