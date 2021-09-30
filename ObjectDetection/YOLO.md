# YOLO (You Only Look Once)
## 특징
- 2015년 발표된 Joseph Redmon, Alexey Bochkovskiy등이 발표한 One stage 계열의 object detection이다.
    - 논문: https://arxiv.org/abs/1506.02640
    - 홈페이지: https://pjreddie.com/darknet/
- C로 구현했으며 Darknet(version 2부터)이라는 자체 뉴럴네트워크 프레임워크를 사용한다.
- 기존 2 stage 계열의 Faster R-CNN에 비해 약 6배 빠른 detection 속도를 보여 실시간 detection이 가능하다. 빠른 대신 정확도는 떨어진다.


## 장점
- one stage detection으로 속도가 매우 빠르다.
- 기존의 다른 real-time detection system과 비교해 2배 높은 mAP를 보인다.
- 낮은 False Positive를 보인다.
    - False Positive: Object를 잘못 Detection한 것.
- Object에 대한 좀 더 일반화된 특징을 학습한다.
    - Natural 이미지로 학습하고 화가가 그린 그림으로 테스트 했을때 다른 시스템보다 더 높은 성능을 보임

## 단점
- 기존의 2 stage detection에 비해 낮은 정확도
- 작은 물체를 잘 감지하지 못하는 문제



