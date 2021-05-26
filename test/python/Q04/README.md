# 선생님의 담당 학년 바꾸기
etc 폴더 안에 존재하는 teachers.csv 파일을 읽어서 setGrade() 메소드를 통해 담당 학년을 변경하는 class 들을 작성하세요.

- teachers.csv
    > 유재석,3학년담당,수학<br>
    > 백종원,2학년담당,국어<br>
    > 하하,1학년담당,과학<br>

- 조건
    1. TeacherInfo.py와 TeachersData.py 파일을 생성한다. class명은 편하게 입력한다.
        - TeacherInfo.py
            ```python
            def __init__(self, name, grade, subject):
                pass

            # 출력시 '유재석선생님 : 3학년담당, 수학담당' 같은 형식으로 출력하도록 바꾼다.
            def __str__(self):
                pass

            # 새로운 grade를 입력받아 조건에 맞는다면 바꾼다.
            # '1학년담당', '2학년담당', '3학년담당' 에 맞지 않게 입력하면 경고문을 print()한다.
            def setGrade(self, new_grade):
                pass
            ```
        - TeachersData.py
            ```python
            # TeacherInfo.py 에서 Teacher class를 불러와서 setGrade() 메소드를 사용한다.

            # tch_list를 생성해서 teachers.csv에 있는 정보들을 담고 해당 리스트를 반환한다.
            def tch_public():
                pass

            # setGrade() 메소드를 사용해서 담당 학년을 바꾼다.
            def set_grade(teacher, new_grade):
                pass

            # 앞에 생성한 메소드들을 적절히 활용하여 아래의 출력 예시처럼 출력한다.
            if __name__ == '__main__':
            ```
    2. TeachersData.py를 실행했을 때 아래처럼 출력 예시가 출력되도록 한다.


- 출력 예시
    > 유재석선생님 : 3학년담당, 수학담당<br>
    > 백종원선생님 : 2학년담당, 국어담당<br>
    > 하하선생님 : 1학년담당, 과학담당<br>
    > --------------------<br>
    > 유재석선생님이 1학년담당으로 바뀌었습니다.<br>
    > --------------------<br>
    > 유재석선생님 : 1학년담당, 수학담당<br>
    > 백종원선생님 : 2학년담당, 국어담당<br>
    > 하하선생님 : 1학년담당, 과학담당<br>
