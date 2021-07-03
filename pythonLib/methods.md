# Pandas
## Series 함수들
- pd.Series() : Series 생성
- s.count() : 결측치(NaN)을 제외한 데이터의 개수를 counting
- s.fillna(a) : 결측치를 a로 치환
- s.dropna() : 결측치를 삭제
- s.transform(x) : s의 데이터들을 x로 치환한다.
  ```python
  df.groupby('job')['age'].transform('median') # job으로 데이터를 그룹화하고 각 데이터의 age를 중앙값으로 치환한다.
  ```

## DataFrame 함수들
- pd.date_range(시작일, 범위(period)) : 시작일로 부터 해당 범위 날짜까지 날짜 데이터 생성
- pd.DataFrame() : DataFrame 생성
  1. index : index를 배열로 설정 가능
  2. columns : columns명을 배열로 설정 가능
- df.columns : df의 column들을 확인 가능
- df.index : df의 index들을 확인 가능
- df.values : df의 데이터 값들 확인 가능
- df.info() : DataFrame의 정보 출력
- df.describe() : df의 기초 통계를 확인 가능
  - 이상치 / 결측치 확인을 위해서 기초 통계를 보고 분석하는 기법도 존재한다.
- df.sort_values(by=x, ascending=True) : df의 값들을 정렬한다.
  1. by : x col의 데이터를 기준으로 정렬한다.
  2. ascending=True : 오름차순
  3. ascending=False : 내림차순
- df.duplicated() : df에서 중복된 데이터가 존재하면 해당 데이터의 index에 True가 출력된다.
- df.drop_duplicates() : df에서 중복된 데이터를 삭제하는 메소드
- df.groupby(col명) : df의 col명인 series의 데이터가 같은 데이터로 그룹화를 한다.
  - df.groupby(col).sum() : col명으로 그룹화 후 연산이 가능한 series의 값의 합을 도출
- df.shape : df의 크기를 반환 (ex. (3, 2) : 3행 2열)
------
- pd.to_datetime(날짜 문자열) : 날짜 문자열을 날짜 표현 타입으로 변환하는 메소드
- pd.concat([df1, df2], axis=x) : df1과 df2를 병합하는 메소드
  - axis=1 : 가로로 데이터가 붙음
  - axis=0 : 세로로 데이터가 붙음 : default
  - ignore_index=True : 각 df의 index를 무시하고 새롭게 index를 명시해줌
    - index의 재 정리

# Numpy
- np.nan : NaN 값
- np.random : 난수 생성 모듈
  - np.random.randn(x, y) : x행 y열 크기의 실수 난수 배열 생성
  - np.random.randint(x, y) : 범위(x ~ y-1)에 속하는 정수 난수 생성
- np.where(조건식, True의 값, False의 값) : series의 각 데이터가 조건식에서 True이면 True일 때의 데이터를, False면 False일때의 데이터를 넣는다.
- 





- `del` df[col명] : dataFrame의 해당 series를 삭제한다.


