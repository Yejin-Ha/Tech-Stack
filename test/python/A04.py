students = {'A':100, 'B': 50, 'C':85, 'D':78, 'E':75, 'F':45}

rank_students = sorted(students.items(), key=lambda x: x[1], reverse=True)
flunk_students = list(filter(lambda x: x[1] <= 50 , rank_students))

leng = len(students) - len(flunk_students)

print('50점 이하의 학생 :')
for i in range(len(flunk_students)):
    print(f'{flunk_students[i][0]} {flunk_students[i][1]}점')
