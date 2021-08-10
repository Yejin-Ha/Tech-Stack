# ROC curve(Receiver Operating Characteristic Curve)와 AUC(Area Under the Curve) score
## TPR, FPR
- **TPR과 FPR은 비례한다.**
- 가장 완벽한 것은 FPR이 0이고 TPR이 1인 것이다. 
- 일반적으로 FPR이 작을 때 (0에 가까울때) TPR이 높은 경우가 좋은 상황이다. 그래서 선 아래의 면적이 넓은 곡선이 나올 수록 좋은 모델이다.

- **FPR(False Positive Rate-위양성율)**
    - x축
    - 위양성율 (fall-out)
    - 1-특이도(TNR)
    - 실제 음성중 양성으로 잘못 예측 한 비율
      - FPR이 낮다 : Neg 중 맞은것이 많다. 
      - FPR이 높다 : Neg 중 틀린것이 많다.
    $$
    \cfrac{FP}{TN+FP}
    $$

- **TPR(True Positive Rate-재현율/민감도)** 
    - y축
    - 재현율(recall)
    - 실제 양성중 양성으로 맞게 예측한 비율
      - TPR이 낮다 : Pos중에 틀린 것이 많다.
      - TPR이 높다 : Pos중에 맞은 것이 많다.
    $$
    \frac{TP}{FN+TP}
    $$
<br> 
<br> 

## ROC 곡선
- 2진 분류의 모델 성능 평가 지표 중 하나.
- 불균형 데이터셋을 평가할 때 사용.
- FPR을 X축, TPR을 Y축으로 놓고 임계값을 변경해서 FPR이 변할 때 TPR이 어떻게 변하는지 나타내는 곡선.

- **AUC**
    - ROC 곡선 아래쪽 면적
    - 0 ~ 1 사이 실수로 나오며 클수록 좋다.
   - **AUC 점수기준**
        - 1.0 ~ 0.9 : 아주 좋음
        - 0.9 ~ 0.8 : 좋음
        - 0.8 ~ 0.7 : 괜찮은 모델
        - 0.7 ~ 0.6 : 의미는 있으나 좋은 모델은 아님
        - 0.6 ~ 0.5 : 좋지 않은 모델+

- **ROC, AUC 점수  확인**
    - roc_curve(y값, 예측확률) : FPR, TPR, Thresholds (임계치)
    - roc_auc_score(y값, 예측확률) : AUC 점수 반환

- **ROC Curve - PR Curve**
    - ROC : 이진분류에서 양성클래스 탐지와 음성클래스 탐지의 중요도가 비슷할 때 사용(개고양이 분류)
    - PR curve(Precision Recall 커브) : 양성 클래스 탐지가 음성클래스 탐지의 중요도보다 높을 경우 사용(암환자 진단)
