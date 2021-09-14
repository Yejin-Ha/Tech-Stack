# Pipeline
- 여러 단계의 머신러닝 프로세스(전처리의 각 단계, 모델생성, 학습 등) 처리 과정을 설정하여 한번에 처리되도록 한다.
- 파이프라인은 여러개의 변환기와 마지막에는 변환기나 추정기를 넣을 수 있다.(추정기(estimator)는 마지막에만 올 수 있다.)

## Pipeline 생성
- 튜플 형태의 (이름, 변환기)를 리스트로 묶어서 전달한다.
- 이름은 반드시 넣어야한다.
- 추정기는 마지막에만 올 수 있다.
```python
from sklearn.pipeline import Pipeline
```

## Pipeline 학습
- fit()
  - 각 순서대로 변환기의 fit_transform이 실행되고 결과가 다음 단계로 전달된다.
  - 마지막 단계에서는 fit()만 호출한다.
- fit_transform()
  - fit()과 동일하나 마지막 단계에서도 fit_transform()이 실행된다.
  - 보통 전처리 잔업 파이프라인(모든 단계가 변환기)일 때 사용
- 마지막이 추정기(모델)인 경우
  - predict()
  - predict_proba()
  - 추정기를 이용해서 X에 대한 결과를 추노
  - 모델 앞에 있는 변환기들을 이용해서 transform() 그 처리 결과를 다음 단계로 전달
- 주의 사항
  - 하이퍼 파라미터 지정시 파이프라인은 "프로세스이름__하이퍼파라미터" 형식으로 지정한다.
<details>
    <summary>GridSearchCV() 에서 pipeline 사용 예시 코드</summary>

    ```python
    from sklearn.model_selection import GridSearchCV
    from sklearn.tree import DecisionTreeClassifier
    from sklearn.pipeline import Pipeline
    from sklearn.preprocessing import StandardScaler
    from sklearn.svm import SVC

    order = [
        ('scaler', StandardScaler()),
        ('svc', SVC(random_state=0))
    ]

    # pipeline 생성
    pipeline = Pipeline(order)

    param = {
        "svc__C" : [0.001, 0.01, 0.1, 1, 10],
        "svc__gamma" : [0.001, 0.01, 0.1, 1, 10]
    }

    gs = GridSearchCV(tree, param, cv=3, n_jobs=-1)
    gs.fit(X_train_, y_train)
    ```
</details>

## make_pipeline() 을 이용하여 편리하게 파이프라인 생성
```python
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC

# pipeline 생성
pipeline = make_pipeline(StandardScaler(), SVC())
```
