# Numpy
- np.nan : NaN 값
- np.where(조건식, True의 값, False의 값) : series의 각 데이터가 조건식에서 True이면 True일 때의 데이터를, False면 False일때의 데이터를 넣는다.

## random
- np.random : 난수 생성 모듈
- np.random.randn(x, y) : x행 y열 크기의 실수 난수 배열 생성
- np.random.randint(x, y) : 범위(x ~ y-1)에 속하는 정수 난수 생성

## ndarray
- np.array([1, 2, 3], dtype=a) : [1, 2, 3] 형태의 ndarray를 생성한다.
  - dtype : 데이터 타입을 설정한다.
    - 'float32' or 'np.float32 : ndarray의 데이터 타입을 float32로 지정한다.
- type(x) : x의 타입을 반환한다.
- x.dtype : x의 원소의 데이터 타입을 반환한다.
  - 실수의 기본형 : float64
  - 정수의 기본형 : int32
- x.shape : x의 사이즈를 반환한다.
  ```python
  x = np.array([[1, 2, 3], [4, 5, 6]])
  type(x) # numpy.ndarray
  x.dtype # int32
  x.shape # (2, 3)
  ```
  
<br>
<br>
<br>
