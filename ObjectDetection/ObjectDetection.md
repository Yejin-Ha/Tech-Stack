# Object Detection
## 1. 컴퓨터 비전(Computer Vision)
- 인간의 시각과 관련된 부분을 컴퓨터 알고리즘을 이용해 구현하는 방법을 연구하는 분야로 최근에는 딥러닝 알고리즘을 이용한 방식이 주류를 이루고 있다.
- ### 주요 컴퓨터 비전 분야
    - Image Classification (이미지 분류) : 분류
    - Object Detection (물체검출) : 분류 + 회귀
    - Image Segmentation 

## 2. Object Detection 개요
- Object Detection = Localization + Classification
    - **Object Detection** 은 이미지에 존재하는 Object(물체)들을 Bounding Box를 이용해 그 위치를 찾아내고(Localization) class를 분류(Classification)하는 작업이다
    - Deep learning 을 이용한 Object Detection 모델들은 localization과 classification을 하나의 네트워크에서 처리하는 **One stage detector(ex. YOLO)** 와 각각의 네트워크에서 순차적으로 실행하는 Two stage detector 두가지 방식이 있다.
        - 지금은 One stage detector를 주로 사용한다.

- Object Detection 의 출력값
    - **Bounding Box(BBox)의 Location(위치)**
        - x, y, w, h 를 이용 : 모델에 따라 다르지만 이 방식을 주로 사용한다.
            - x, y: Bounding Box 중심점의 좌표
            - w, h: Bounding Box 의 너비(widgh)와 높이(heigh)
        - x_min, y_min, x_max, y_max를 이용
            - x_min, y_min: 왼쪽 위(Left-Top)의 x, y 좌표
            - x_max, y_max: 오른쪽 아래(right-bottom)의 x, y 좌표
    - **class**
        - Bounding Box안의 물체의 class 또는 확률
    - **confidence score**
        - Bounding Box 안에 실제물체가 있을 것이라고 확신하는 확신의 정도(확률)의 값으로 0.0 ~ 1.0 사이의 값

## Object Detection 성능 평가
## 1. IoU(Intersection Over Union, Jaccard overlap)
- 모델이 예측한 Bounding Box(bbox)와 Ground Truth Bounding Box가 **얼마나 겹치는지**를(Overlap) 나타내는 평가 지표이다.
    - 두개의 Bounding Box가 일치할 수록 1에 가까운 값이 나오고 일치하지 않을 수록 0에 가까운 값이 계산된다.
- **일반적으로 IoU값 0.5를 기준으로 그 이상이면 검출한 것으로 미만이면 잘못찾은 것(제거)으로 한다.**
    - 이 기준이 되는 값을 IoU Threshold(임계값) 라고 한다.
    - **0.5 수치는 ground truth와 66.% 이상 겹쳐(overlap)되야 나오는 수치 이면 사람의 눈으로 봤을때 잘 찾았다고 느껴지는 수준이다.**
$$IoU = \cfrac{두\,영역의\,교집합\,영역}{두\,영역의\,합집합\,영역}$$
> Ground Truth Bounding Box : 정답 영역

## 2. mAP (mean Average Precision)
> precision : True(양성)라고 예측한 것 중 True(양성)인 확률
> $$precision = \cfrac{TP}{TP\,+\,FP}$$
- 여러개의 실제 Object가 검출된 재현율(Recall)의 변화에 따른 정밀도(Precision) 값을 평균화 한 것
- mAP를 이해하기 위해선 precision, recall, precision-recall curve, AP(Average Precision)을 이해 해야 한다.
    > precision-recall curve, AP(Average Precision)는 Object Detection(물체 검출) 알고리즘 성능 평가를 위해 사용되는 방법중 하나이다.

### precision과 recall의 trade off(반비례관계)
-  Confidence threshold: 지정된 값 이상의 confidence를 가진 결과만 예측결과로 사용하고 그 이하인 것들은 무시한다. 이 값을 0.5로 설정하면 confidence score가 0.5 미만인 결과(0.1,0.2,0.3등)는 무시한다.이 값은 하이퍼파라미터이다.
  
1. confidence threshold를 높게 잡은 경우
    - 확신의 정도(Confidence Score)가 아주 높은 경우만 검출하기 때문에 예측한 것이 얼마나 맞았는지에 대한 지표인 Precision지표는 높게 나온다.
    - 확신의 정도(Confidence Score)가 낮으면 detect하지 않으므로 실제 물제를 얼만큼 검출했는지에 대한 지표인 recall지표는 낮게 나온다.

2. confidence threshold를 낮게 잡은 경우
    - 확신의 정도(Confidence Score)가 낮은 것들도 예측 했으므로 잘못 검출한 결과가 많아지므로 Precision지표는 낮게나온다.
    - 낮은 확신의 정도(Confidence Score)인 것들도 검출하기 때문에 실제 물체를 더 많이 검출하게 되어 recall 지표가 올라간다.

- 정리
    - confidence threshold를 낮게 잡으면 precision은 낮게 recall은 높게 나온다.
        - recall이 올라가면 precision은 낮아진다.
    - confidence threshold를 높게 잡으면 precision은 높게 recall은 낮게 나온다.
        - precision이 올라가면 recall은 낮아진다.


## 3. Model 추론 결과 후처리(Post Processing)
### NMS (Non Max Suppression)
- Object Dection 알고리즘은 Object가 있을 것이라 예측하는 위치에 여러개의 bounding Box들을 예측한다.
- NMS는 Detect(검출)된 Bounding Box들 중에서 비슷한 위치에 있는 겹치는bbox들을 제거하고 가장 적합한 bbox를 선택하는 방법이다.

#### NMS 실행 로직
1. Detect(검출)된 Bounding Box 중 **Confidence threshold (신뢰 임계값) 이하의 박스들을 제거**한다. (confidence threshold는 하이퍼파라미터)
    >Confidence score: bounding box 내에 object(물체)가 있을 확률   
2. 가장 높은 **confidence score를 가진 bounding box 순서대로 내림차순 정렬**을 한 뒤 높은 confidence score를 가진 bounding box와 겹치는 다른 bounding box를 모두 조사하여 IoU가 특정 threshold(임계값) 이상인 bounding box들을 모두 제거한다. (ex: IoU threshold > 0.5)
    - 가장 높은 confidence score를 가진 bounding box와 IoU가 높게 나온다는 것은 그만큼 겹치는 박스이므로 같은 물체를 예측한 bounding box일 가능성이 높다.
    - 이 작업을 남아있는 모든 bounding box에 적용한 뒤 남아있는 박스만 선택한다.
