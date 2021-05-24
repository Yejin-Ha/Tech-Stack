# Comprehension
- list, set, dictionary 내에서 실행할 수 있는 한 줄 for loop

### 예시
```python
for x in range(10):
    datas.append(x**2)

datas = [ x**2 for x in range(10) ]  # append를 안써도 바로 저장된다.
# 결과 
# [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
```
- 조건문(if, for) 추가한 경우
```python
for v in range(6):
    if v%2 == 0:
        datas2.append(v+2)
    
datas2 = [ v + 2 for v in range(6) if v % 2 == 0]
# 결과
# [2, 4, 6]
#-----------------------------------------------------------------
for x in [1, 2, 3]:
    for y in [3, 1, 4]:
        if x != y:
            datas3.append((x, y))

datas3 = [(x, y) for x in [1, 2, 3] for y in [3, 1, 4] if x != y]
# 결과
# [(1, 3), (1, 4), (2, 3), (2, 1), (2, 4), (3, 1), (3, 4)]
```
- dictionary와 set의 경우
```python
data = {x : y for x, y in [(1, 'one'), (2, 'two')]}
print(data)    # {1: 'one', 2: 'two'}
```