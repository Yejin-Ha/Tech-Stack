import cx_Oracle

# emp01 table을 생성하는 함수 
def table_create():
    conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
    cur = conn.cursor()
    
    cur.execute('drop table emp01')
    cur.execute('create table emp01 as select empno, ename from emp')

    cur.close()
    conn.close()


# 새로운 empno와 ename을 입력받아 emp01 table의 내용을 insert하는 함수 
def emp01_insert(empno, ename):
    conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
    cur = conn.cursor()
    
    cur.execute('insert into emp01 values (:empno, :ename)', empno = empno, ename = ename)
    # 데이터 영구 저장
    conn.commit()

    cur.close()
    conn.close()


# empno와 ename을 입력받아서 empno가 같은 데이터의 ename을 변경하는 update 함수 
def emp01_update(empno, new_ename):
    conn = cx_Oracle.connect(user='SCOTT', password='TIGER', dsn='xe')
    cur = conn.cursor()

    cur.execute('update emp01 set ename = :ename where empno = :empno', ename = new_ename, empno = empno)
    conn.commit()

    cur.close()
    conn.close()


# empno를 입력받아 해당하는 데이터를 삭제하는 delete 함수
def emp01_delete(empno):
    conn = cx_Oracle.connect(user='SCOTT', password='TIGER', dsn='xe')
    cur = conn.cursor()

    cur.execute('delet from emp01 where empno = empno', empno = empno)
    conn.commit()

    cur.close()
    conn.close()


# emp01의 모든 데이터를 출력하는 함수
def emp01_query_all():
    conn = cx_Oracle.connect(user='SCOTT', password='TIGER', dsn='xe')
    cur = conn.cursor()

    # fetchall() : cursor로 부터 모든 검색결과를 반환하는 함수
    cur.execute('select * from emp01')
    rows = cur.fetchall()
    for row in rows:
        print(row)

    cur.close()
    conn.close()


# empno를 입력받아 해당하는 데이터의 ename을 출력하는 함수
def emp01_query_one(empno):
    conn = cx_Oracle.connect(user='SCOTT', password='TIGER', dsn='xe')
    cur = conn.cursor()

    # 단 test용 emp01 table은 아쉽지만 복제 이 경우 alter 명령어로 제약조건 추가하지 않은 상황
    # empno 사번이 중복되어 insert되는 상황
    cur.execute('select ename from emp01 where empno = :empno', empno = empno)

    # 결과가 하나의 row
    row = cur.fetchone()
    print(row)

    cur.close()
    conn.close()


if __name__ == '__main__':
    table_create()
    emp01_query_all()

    emp01_insert(1111, 'Yejin')
    emp01_query_all()
    
    emp01_update(7369, '스미스')
    emp01_query_all()
    
    emp01_delete(1111)
    emp01_query_all()
    
    emp01_query_one(7369)
    