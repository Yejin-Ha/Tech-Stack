'''
데이터를 csv로 저장하기
실습 단계 1 - join()
        반복해서 보유한 데이터들을 하나씩 가공 가능
        첫번째 parameter로 join 함수의 parameter로 적용시킨 list들의 각 요소를 가공해서 하나의 문자열로 반환
'''
print('no, name, age')

# list의 데이터로 csv 구조로 변환
print(",".join(['1', '허준', '60']))        # 1, 허준, 60
print(",".join(['2', '신사임당', '80']))    # 2, 신사임당, 80



'''
실습 단계 2 - csv 모듈 사용
    history.csv 라는 파일에 쓰기
    csv 포멧 작성후에 new line 반영
    한글 데이터가 보유 고려
    
    한번에 하나의 row만 출력? 1차원 list
    한번에 다수의 row들 출력? 2차원 list 구성
'''
# 모듈 import
import csv

# newline='' : 이걸 설정하지 않으면 두 줄이 띄어진다.
#               설정하면 한 줄만 띄어짐
with open("step02_example.csv", "w", newline='', encoding="utf-8-sig") as f:
    # history.csv 파일로 csv 작성 가능한 객체화
    # writer 변수로 호출하는 함수는 csv 파일로 작성 가능한 기능
    writer = csv.writer(f)

    # csv 파일의 header 작성
    writer.writerow(['no', 'name', 'age'])

    # writerows() : 중첩된 list로 csv파일의 각 row로 작성하게 해주는 함수
    writer.writerows([['1', '허준', '60'],
                      ['2', '율곡', '600'],
                      ['3', '이산', '10']])

# csv 파일은 원래 전체 폴더 밖에 생성된다 이해를 위하여 위치를 이동하였다.
