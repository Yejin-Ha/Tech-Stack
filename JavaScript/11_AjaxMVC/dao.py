import cx_Oracle
from dto import EmpDTO
import json

class EmpDAO:
    # 한명의 직원 등록
    def empinsert(self, dto): # EmpDTO 객체를 통으로 매개변수 값으로 받을 예정
        try:
            conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
            cur = conn.cursor()

            try:
                cur.execute("insert into emp01 values (:empno, :ename, :sal)",\
                    empno=dto.getEmpno(), ename=dto.getEname(), sal=dto.getSal()) 
                conn.commit()
            except Exception as e:
                print(e) 

        except Exception as e:
            print(e)
        finally:
            cur.close() 
            conn.close()

    # 한명의 직원 정보 반환
    def empone(self, empno):  
        try:
            conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
            cur = conn.cursor()

            try:
                cur.execute("select * from emp01 where empno=:empno", empno=empno) 
                row = cur.fetchone()    

                data = '{"ename":"'+row[1]+'", "sal":"'+ str(row[2])+'"}'
                return data
            except Exception as e:
                print(e) 
        finally:
            cur.close() 
            conn.close()
    
    # 모든 직원 정보 반환
    def empall(self):  
        try:
            conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
            cur = conn.cursor()

            try:
                cur.execute("select * from emp01") 
                # row = cur.fetch() 

                # data = '{"ename":"'+row[1]+'", "sal":"'+ str(row[2])+'"}'
                return cur.fetchall()
            except Exception as e:
                print(e) 
        finally:
            cur.close() 
            conn.close()


if __name__ == "__main__":
    dao = EmpDAO()
    # # print(dao.empone(7369))
    # dto = EmpDTO(2, 'h', '10000')
    # dao.empinsert(dto)
    dao.empall()