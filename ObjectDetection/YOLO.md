# YOLO (You Only Look Once)
## 특징
- 2015년 발표된 Joseph Redmon, Alexey Bochkovskiy등이 발표한 One stage 계열의 object detection이다.
    - 논문: https://arxiv.org/abs/1506.02640
    - 홈페이지: https://pjreddie.com/darknet/
- C로 구현했으며 Darknet(version 2부터)이라는 자체 뉴럴네트워크 프레임워크를 사용한다.
- 기존 2 stage 계열의 Faster R-CNN에 비해 약 6배 빠른 detection 속도를 보여 실시간 detection이 가능하다. 빠른 대신 정확도는 떨어진다.

    ### 장점
    - one stage detection으로 속도가 매우 빠르다.
    - 기존의 다른 real-time detection system과 비교해 2배 높은 mAP를 보인다.
    - 낮은 False Positive를 보인다.
        - False Positive: Object를 잘못 Detection한 것.
    - Object에 대한 좀 더 일반화된 특징을 학습한다.
        - Natural 이미지로 학습하고 화가가 그린 그림으로 테스트 했을때 다른 시스템보다 더 높은 성능을 보임

    ### 단점
    - 기존의 2 stage detection에 비해 낮은 정확도
    - 작은 물체를 잘 감지하지 못하는 문제



## Unified Detection
- End to End
    - 기존 2 Stage Dection과 다르게 YOLO는 후보영역 추출(Region Proposal)과 물체검출 및 분류(Object Dection & Classification)을 통합해 하나의 딥러닝 네트워크가 한번에 처리한다.
    - Object Detection을 Single Regression Problem 으로 문제를 재정의
        - 입력된 이미지로 부터 bounding box 좌표(coordinate)와 class 확률을 한번에 구한다.

    ### Yolo Prediction (추론 단계)
    - 각 cell에서 B개의 Bounding Box와 그 Bounidng Box에 대한 신뢰도(Confidence: P(Object))를 예측한다. (B: 2)
        - confidence score : 물체가 있을 확률
    - Bounding Box는 (c, x, y, w, h) 5개의 값으로 구성된다.
        - c는 해당 bounding box에 대한 신뢰도 점수(Confidence), (x,y)는 중심점의 좌표, (w,h)는 bounding box의 너비의 높이
        - Confidence:  𝑃𝑟(𝑂𝑏𝑗𝑒𝑐𝑡)∗𝐼𝑜𝑈𝑡𝑟𝑢𝑡ℎ𝑝𝑟𝑒𝑑
            - 물체가 있을 확률 * IoU점수(Ground truth와 예측bbox간의 겹치는 부분의 넓이)

