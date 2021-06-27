# 사원 정보를 보유하게 되는 구조의 클래스 
# 객체(복합 데이터)
class EmpDTO:
    def __init__(self, newempno, newename, newsal):
        self.empno = newempno
        self.ename = newename
        self.sal = newsal

    def getEmpno(self):
        return self.empno
    
    def setEmpno(self, newempno):
        self.empno = newempno

    def getEname(self):
        return self.ename
    
    def setEname(self, newename):
        self.ename = newename

    def getSal(self):
        return self.sal
    
    def setSal(self, newsal):
        self.sal = newsal

    def __str__(self):
        return '사번 : ' + self.empno + '- 이름 : ' + self.ename + '- 급여 : ' + self.sal