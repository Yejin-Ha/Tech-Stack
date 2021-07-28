# Numpy
- np.nan : NaN 값
- np.where(조건식, True의 값, False의 값) : series의 각 데이터가 조건식에서 True이면 True일 때의 데이터를, False면 False일때의 데이터를 넣는다.

## random
- np.random : 난수 생성 모듈
- np.random.randn(x, y) : x행 y열 크기의 실수 난수 배열 생성
- np.random.randint(x, y) : 범위(x ~ y-1)에 속하는 정수 난수 생성

## ndarray
- np.array(x), dtype=a) : x의 값이 들어있는 ndarray를 생성한다.
  - x : 
  - dtype : 데이터 타입을 설정한다.
    - 'float32' or 'np.float32 : ndarray의 데이터 타입을 float32로 지정한다.
    - 서로 다른 타입의 값들로 ndarray가 생성되면 가장 큰 타입으로 통일해서 변환한다.
      - 타입 크기
        - bool < int < float < str
        - bool type이 숫자로 변경되면 True : 1, False : 0
- type(x) : x의 타입을 반환한다.
- x.dtype : x의 원소의 데이터 타입을 반환한다.
  - 실수의 기본형 : float64
  - 정수의 기본형 : int32
  - 문자열 : <U32
- x.shape : x의 사이즈를 반환한다.
- x.ndim : x의 rank를 출력한다.
  - rank는 shape으로 바로 확인이 가능해서 ndim을 자주 사용하진 않는다.
  ```python
  x = np.array([[1, 2, 3], [4, 5, 6]], dtype=np.float32)
  type(x) # numpy.ndarray
  x.dtype # int32
  x.shape # (2, 3)
  x.ndim # 2
  ```
- x.astype(y) : 배열 x의 데이터 타입을 y로 변경한다.
  - x의 값을 변경하는 것이 아닌 새로운 배열을 반환한다.(새로운 배열로 선언하여 사용해야 한다.)
  - y -> np.int32 or 'int32'
  
<br>
<br>
<br>
