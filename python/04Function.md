# Function
- parameter(매개변수) : 인수값을 전달받는 변수
- argument(인수) : 호출 프로그램에 의하여 함수에 전달되는 값
    1. default argument : 함수의 매개변수가 기본값을 보유
        ```python
        def fun(name, age=10):
            ...

        fun('예진')     # name : 예진, age = 10 
        ```
    2. keyword argument : 인수들 앞에 키워드를 두어 인수 구분
        - **kwargs 라고도 부른다.
        - 특정값 형태로 호출하는 것 ( 순서는 중요하지 않다. )
        ```python
        def fun(**kwargs):
            args = kwargs   # dict 형태로 인수들이 들어간다.

        fun(x=10, y='hi', z=-5)    
        ```

    3. 임의의 인수
        - `*`를 사용할 경우 인수는 tuple 형식로 활용 가능
        ```python
        def fun(*args):    
            ...

        fun('hi', 10, 2.0)      # ('hi', 10, 2.0)으로 인식
        ```

## Lambda Function
- 이름없이 정의된 익명 함수
- 메게뱐스의 제한 X, 데이터값으로 사용 가능
- list의 sort에서 key 속성 값으로도 사용 가능
- 문법 : `lambda 인자[...] : 표현식(수식)`



## 자주 사용하는 함수들
|함수명|문법|특징|
|-----|----|----|
|map( )|map(함수, 리스트)|- 리스트의 모든 항목에 함수를 적용한 결과 리스트를 반환<br>- list()를 사용하지 않으면 주소값이 출력된다.<br>- 함수 자리에 lambda식도 많이 사용한다.|
|reduce( )|reduce(함수, 리스트)|- 사용을 위해서는 from functools import reduce 선언 필수<br>- 집계용으로 주로 사용된다.<br>- 리스트의 모든 항목을 함수에 따라서 정리한다.|
|filter( )|filter(함수, 데이터들)|- 시퀀스의 항목들 중 함수 조건에 True인 항목들만 추출|
|collection 함수 -> enumerate( )|enumerate(데이터들, start=숫자)|- 데이터들을 start 숫자부터 순서를 매기는 함수|