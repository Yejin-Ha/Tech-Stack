class Teacher:

    def __init__(self, name, grade, subject):
        self.name = name
        self.grade = grade
        self.subject = subject

    def __str__(self):
        return f'{self.name}선생님 : {self.grade}, {self.subject}담당'

    # 새로운 grade를 입력받아 조건에 맞는다면 바꾼다.
    def setGrade(self, new_grade):
        if new_grade in ('1학년담당', '2학년담당', '3학년담당'):
            self.grade = new_grade
            print(f'{self.name}선생님이 {self.grade}으로 바뀌었습니다.')
        else:
            print('입력오류. 1학년, 2학년, 3학년담당에 맞춰서 입력하세요.')
