from TeacherInfo import Teacher

class TeachersPublic:
    def tch_public():
        tch_list = []
        with open('../etc/teachers.csv', 'r', encoding='utf-8') as f:
            tchs = f.read().splitlines()
            for tch in tchs:
                info = tch.split(',')
                tch_list.append(Teacher(info[0], info[1], info[2]))
        return tch_list

    def set_grade(teacher, new_grade):
        return teacher.setGrade(new_grade)

    if __name__ == '__main__':
        tch_list = tch_public()
        for tch in tch_list:
            print(tch)
        print('-'*20)

        # setGrade()가 잘 작동하는지 확인
        set_grade(tch_list[0], '1학년담당')
        print('-'*20)

        for tch in tch_list:
            print(tch)
