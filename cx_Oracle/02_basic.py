# Oracle DB를 활용하게 해주는 driver import
import cx_Oracle


# xe란 무엇인가... 아무리 검색해봐도 이해가 안된다아ㅠ
# connect 메소드와 id / pw / dsn 값을 통해 db에 접속한다. 
connection = cx_Oracle.connect(user='hr', password='hr', dsn='xe')


# 커서 생성
cursor = connection.cursor()


# execute : query(select, 질의)문장 실행이 가능한 함수
# query문장 마지막에 ;는 생략한다.
cursor.execute("""
        select first_name, empno
        from employees """)
# 변수를 대입하여 query를 실행할 수 있다.
cursor.execute("""
        select first_name, empno
        from employees 
        where employee_id > :eid""", eid = 190)


# cursor의 결과 데이터들(ResultSet)에 한 row씩 접근하여 출력한다.
for row in cursor:
    print(row)

for first_name, empno in cursor:
    print(row)


# 자원 반납 필수
# cursor, connection 순서로 반환하는 것을 추천한다.
cursor.close()
connection.close()


'''
* print(cursor)를 하면 주소값이 출력된다.
    ex) <cx_Oracle.Connection to SCOTT@xe>>

* 출력시 전체 데이터가 아닌 일부의 데이터만 출력하려고하면 에러가 발생한다.
(설정한 변수의 개수와 리턴해주는 변수의 개수가 차이날 경우에 발생)
    ex) for empno in cursor:    -> ValueError: too many values to unpack (expected 2)
        print(empno)        

* 만약 전체 데이터 중 일부 데이터만 출력하고 싶다면 다음과 같이 코드를 실행해본다.
    for row in cursor:
        print(row[1])       -> 각 데이터들은 tuple type이며 empno의 index는 1이다.
        
'''
