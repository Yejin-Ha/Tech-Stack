# list, tuple, dictionary, set
|타입|문법|특이사항|
|------|---|---|
|list|[ ]|- 혼합 자료형 : 다양한 타입을 한번에 저장할 수 있음<br>- 리스트 안에 리스트를 생성할 수 있다. = 내장리스트|
|tuple|( )|- 변경 불가능한 리스트<br>- 고유한 index가 존재한다.<br>- 연산이 가능하다.|
|dictionary|{ key : value, ... }|- json 포멧과 흡사<br>- key로 value값 구분<br>- value : 실제 사용되는 데이터<br>- key는 중복되지 않는다.<br>- get() / items() / keys() / values() / update() 함수들 사용 가능|
|set|{ value, ... }|- 중복되지 않고 순서가 없는 항목들<br>- issubset() / issuperset() / union() / intersection() / difference() 함수들 사용 가능|

## list
- 기본 함수
    ```python
    lst = list()      # 공백 리스트 생성
    lst2 = []       # 공백 리스트 생성
    list2 = [["Seoul", 10], ["Paris", 12], ["London", 50]]      # 혼합 자료형, 내장 리스트
    [list] + [list]     # 연산자로 새로운 list 생성 가능
    'a'.join(list)      # list내의 모든 항목을 a로 연결한 문자열을 반환
    ```
- 정렬
    |함수|특징|
    |------|---|
    |list.sort( )|원본을 변형함|
    |sorted( list )|원본은 유지하고 복제본을 생성한다.|
    ```python    
    list.sort()     # list를 오름차순으로 정렬함
    list.sort(reversed=True)    # list를 역으로 정렬함
    ```

## tuple
```python
t = 'test', 'test1', 'test2'        # 괄호없이 나열된 객체들도 tuple로 간주
(tuple) + (tuple)     # 연산자로 새로운 tuple 생성 가능
```

## dictionary
```python
dict[new_key] = new_data    # dict에 새로운 key와 value를 저장
dict.get(key)   # dict에서 key의 value를 반환함
dict[key]   # dict에서 key의 value를 반환함
```