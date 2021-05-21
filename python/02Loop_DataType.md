# 반복문
**for** : 정해진 횟수만큼 반복하는 구조  
**while** : 조건이 만족되는 동안 반복하는 구조

## 조건식
- pass : 아무것도 실행하지 않음
- continue : 해당 로직을 제외하고 다음 loop를 실행해라

# Data Type
**boolean, integer, float, string, ... etc**
```python
type(x)     # x의 자료형을 확인하는 함수
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
    - 표현식
        ```python
        print('value %s' % (data))      # %s 위치에 data를 대입하는 %s 표현식
        # %d : 정수 표현 / %s : 문자 표현 / %f : 부동 소수 표현
        print('{}, {}'.format(data1, data2))    # data1, data2를 {}안에 순서대로 넣는 표현식
        print(f'{data}입니다.')     # f-string : 미리 선언된 data 변수를 바로 출력할 수 있음
        ```
    - 자주 사용되는 함수
        ```python
        string.strip()      # string 앞뒤의 여백을 제거
        string.strip('a')      # string 앞뒤의 a를 제거
        string.lstrip()     # string 왼(앞)쪽의 잉여 여백을 제거
        string.rstrip()     # string 오른(뒤)쪽의 잉여 여백을 제거

        string.split(t, n)      # string을 t를 기준으로 구분하고 n만큼 분리한 문자열 리스트 반환
        reversed(string)    # string을 역으로 변환된 객체의 주소값을 반환
        ''.join(reversed(string))   # 역으로 된 문자열 데이터를 가공하는 로직
        ```

- 형변환
    ```python
    int( 숫자 / 계산식 / 문자열 )     # 정수로 변환
    str()       # 문자열로 변환
    float( 숫자 / 계산식 / 문자열 )     # 실수로 변환
    ```
