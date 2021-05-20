students = {'A':100, 'B': 50, 'C':85, 'D':78, 'E':75, 'F':45}

rank_students = sorted(students.items(), key=lambda x: x[1], reverse=True)

for i in range(3):
    print(f'{i+1}등 : {rank_students[i][0]} {rank_students[i][1]}점 ')
    