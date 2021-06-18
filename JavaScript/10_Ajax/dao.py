# emp01 table의 crud 로직을 전담하는 클래스
import cx_Oracle

class EmpDAO:
    # 사번으로 직원명, 급여를 검색해서 반환 
    def empone(self, empno):  
        try:
            conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
            cur = conn.cursor()
            try:
                # :v = 동적으로 데이터가 변경 가능한 상황을 처리할 수 있는 동적 변수(binding 변수)
                cur.execute("select * from emp01 where empno=:empno", empno=empno) 
                row = cur.fetchone()    # set타입으로 변환 따라서 고유한 index로 각 요소들 활용 가능

                # json 포멧으로 편집
                data = '{"ename":"'+row[1]+'", "sal":"'+ str(row[2])+'"}'
                # print(data)
                return data
            except Exception as e:
                print(e) 
        finally:
            cur.close()
            conn.close()


if __name__ == "__main__":
    dao = EmpDAO()
    print(dao.empone(7369))
