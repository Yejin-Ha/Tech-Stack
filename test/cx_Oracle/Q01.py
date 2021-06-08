'''
Question01.
조건 1. cx_Oracle 폴더에 존재하는 04_DDL_CRUD.py를 참고하여 dept table을 사용하는 코드로 바꿔보세요.
조건 2. 예외처리를 사용하여 코드를 실행할 때 에러가 나지 않도록 구현하세요.


# 문제 풀이 & 무조건 실행되는 구문 정리
conn = cx_Oracle.connect(user='SCOTT', password='TIGER', dsn='xe')
    - 해당 문장에 오류가 나면 아예 접근이 불가능하므로 try문에 대입하여 코드를 시작한다.

cur = conn.cursor()
    - conn이 정상적으로 실행될 경우에만 실행할 수 있다. 고로 else문에 대입한다.

cur.close()
    - 위의 코드가 실행될 경우 close()를 실행시켜야 되므로 else문 안에서는 cur이 무조건 실행되므로 else문 안에 finally문을 사용한다.

conn.close()
    - 맨 처음 try문이 정상 실행될 경우에만 코드를 수행해야 한다.
    - 하지만 이중 try문을 설정해서 두번째 try문의 finally문에 작성하여 첫번째 try문이 정상 실행될 경우에만 코드가 실행되도록 한다.
'''


import cx_Oracle

# 새로운 테이블을 생성하는 함수
def dept01_create():
    try:
        conn = cx_Oracle.connect(user='SCOTT', password='TIGER', dsn='xe')
    except cx_Oracle.DatabaseError as e:  # invalid username/password; logon denied
        print(e)
    else:
        cur = conn.cursor()

        try:
            cur.execute('drop table dept01')
        except cx_Oracle.DatabaseError as e:  # table or view does not exist / invalid (table name/drop option)
            print(e)
        finally:
            cur.execute('create table dept01 as select * from dept') # table이 존재하지 않아서 에러가 발생해도 emp05를 생성하도록 유도
            cur.close()
            conn.close()


# 새로운 데이터를 추가하는 함수
def dept01_insert(deptno, dname, loc):
    try:
        conn = cx_Oracle.connect(user='SCOTT', password='TIGER', dsn='xe')
    except cx_Oracle.DatabaseError as e:  # invalid username/password; logon denied
        print(e)
    else:
        cur = conn.cursor()

        try:
            cur.execute('insert into dept01 values (:deptno, :dname, :loc)', deptno = deptno, dname = dname, loc = loc)
            conn.commit()
        except cx_Oracle.DatabaseError as e:  # table or view does not exist / invalid number / ... etc
            print(e)
        finally:
            cur.close()
            conn.close()


# 기존 데이터를 수정하는 함수
def dept01_update(deptno, new_loc):
    try:
        conn = cx_Oracle.connect(user='SCOTT', password='TIGER', dsn='xe')
    except cx_Oracle.DatabaseError as e:  # invalid username/password; logon denied
        print(e)
    else:
        cur = conn.cursor()
        try:
            cur.execute('update dept01 set loc = :new_loc where deptno = :deptno', new_loc = new_loc, deptno = deptno)
            conn.commit()
        except cx_Oracle.DatabaseError as e:  # Syntax error / 부적합한 변수값 등 다양한 error를 여기서 잡는다.
            print(e)
        finally:
            cur.close()
            conn.close()


# detno를 입력받아 해당 데이터를 삭제하는 함수
def dept01_delete(deptno):
    try:
        conn = cx_Oracle.connect(user='SCOTT', password='TIGER', dsn='xe')
    except cx_Oracle.DatabaseError as e:  # invalid username/password; logon denied
        print(e)
    else:
        cur = conn.cursor()
        try:
            cur.execute('delete from dept01 where deptno = :deptno', deptno = deptno)
            conn.commit()
        except cx_Oracle.DatabaseError as e:  # Syntax error / 부적합한 변수값 등 다양한 error를 여기서 잡는다.
            print(e)
        finally:
            cur.close()
            conn.close()


# 전체 내용을 출력하는 함수
def dept01_query_all():
    conn = cx_Oracle.connect(user='SCOTT', password='TIGER', dsn='xe')
    cur = conn.cursor()

    # fetchall() : cursor로 부터 모든 검색결과를 반환하는 함수
    cur.execute('select * from dept01')
    rows = cur.fetchall()
    for row in rows:
        print(row)

    cur.close()
    conn.close()


if __name__ == '__main__':
    dept01_create()
    dept01_query_all()
    print('------------------') # 출력 결과 구분선

    dept01_insert(50, 'MANAGEMENT', '서울')
    dept01_query_all()
    print('------------------') # 출력 결과 구분선

    dept01_update(50, 'Seoul')
    dept01_query_all()
    print('------------------') # 출력 결과 구분선
    
    dept01_delete(50)
    dept01_query_all()
