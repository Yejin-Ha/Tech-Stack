# 반복문
**for** : 정해진 횟수만큼 반복하는 구조  
**while** : 조건이 만족되는 동안 반복하는 구조

## 조건식
- pass : 아무것도 실행하지 않음
- continue : 해당 로직을 제외하고 다음 loop를 실행해라

# Data Type
**boolean, integer, float, string, ... etc**
```python
type(x)     # x의 자료형을 확인하는 메소드
```
- 숫자
    - / : 부동소수점을 포함해서 출력
    - // : 부동소수점을 제외한 결과가 출력, 정수가 출력
        ```python
        8 / 5       # 1.6 반환 : float
        8 // 5      # 1 반환 : int
        ```
- 문자열 string
    - slicing 속성이 존재한다.
        ```python
        len(str)       # str의 길이(크기)를 알려주는 함수
        str[-1]        # str의 길이에 상관없이 맨 마지막 글자를 출력함(이게 slicing 속성이다.)
        ```

- 형변환
    ```python
    int( 숫자 / 계산식 / 문자열 )     # 정수로 변환
    str()       # 문자열로 변환
    float( 숫자 / 계산식 / 문자열 )     # 실수로 변환
    ```

- list, tuple, dictionary, set
    |타입|문법|특이사항|
    |------|---|---|
    |list|[ ]|- 혼합 자료형 : 다양한 타입을 한번에 저장할 수 있음<br>- 리스트 안에 리스트를 생성할 수 있다. = 내장리스트|
    |tuple|( )|- 변경 불가능한 리스트<br>- 고유한 index가 존재한다.<br>- 연산이 가능하다.|
    |dictionary|{ key : value, ... }|- json 포멧과 흡사<br>- key로 value값 구분<br>- value : 실제 사용되는 데이터<br>- key는 중복되지 않는다.<br>- get() / items() / keys() / values() / update() 메소드 사용 가능|
    |set|{ value, ... }|- 중복되지 않고 순서가 없는 항목들<br>- issubset() / issuperset() / union() / intersection() / difference() 메소드 사용 가능|

    ```python
    lst = list()      # 공백 리스트 생성
    lst2 = []       # 공백 리스트 생성
    list2 = [["Seoul", 10], ["Paris", 12], ["London", 50]]      # 혼합 자료형, 내장 리스트
    [list] + [list]     # 연산자로 새로운 list 생성 가능

    t = 'test', 'test1', 'test2'        # 괄호없이 나열된 객체들도 tuple로 간주
    (tuple) + (tuple)     # 연산자로 새로운 tuple 생성 가능
    ```