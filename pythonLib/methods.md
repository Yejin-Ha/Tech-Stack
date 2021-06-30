# Pandas
## Series 함수들
- pd.Series() : Series 생성
- s.count() : 결측치(NaN)을 제외한 데이터의 개수를 counting
- s.fillna(a) : 결측치를 a로 치환
- s.dropna() : 결측치를 삭제
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



# Numpy
- np.nan : NaN 값
- np.random : 난수 생성 모듈
  - np.random.randn(x, y) : x행 y열 크기의 실수 난수 배열 생성
  - np.random.randint(x, y) : 범위(x ~ y-1)에 속하는 정수 난수 생성
  - 