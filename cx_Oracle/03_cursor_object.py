from typing import Counter
import cx_Oracle

conn = cx_Oracle.connect(user='SCOTT', password='TIGER', dsn='xe')
cur = conn.cursor()

cur.execute('select * from dept')
#     DEPTNO DNAME                        LOC
# ---------- ---------------------------- -------------
#         10 ACCOUNTING                   NEW YORK
#         20 RESEARCH                     DALLAS
#         30 SALES                        CHICAGO
#         40 OPERATIONS                   BOSTON

# fetchall() : 모든 데이터를 가져오는 메소드
rows1 = cur.fetchall()
for row in rows1:
    print(row)


# fetchone() : 한 row씩 반환하는 메소드
while True:
    row = cur.fetchone()
    if row is None:
        break
    print(row)


# fetchmany() : 지정하는 수 만큼의 데이터를 받아오는 메소드
num = 2
while True:
    rows2 = cur.fetchmany(num) # 데이터를 처음부터 순서대로 2개씩 rows2에 저장한다.
    if not rows2:
        break
    for row in rows2:
        print(row)


cur.close()
conn.close()

'''
아래의 사이트를 참고하여 다양한 메소드들을 공부해보자.

< 참고 사이트 >
https://cx-oracle.readthedocs.io/en/latest/api_manual/cursor.html#Cursor.fetchall
'''
