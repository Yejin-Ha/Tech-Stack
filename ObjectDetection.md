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
