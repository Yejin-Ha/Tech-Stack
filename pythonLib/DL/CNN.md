# CNN - 합성곱 신경망(convolutional neural network)
- 주로 컴퓨터 비전(이미지, 동영상 관련 처리)에서 사용되는 딥러닝 모델로 covolution 레이어를 이용해 데이터 특징을 추출하는 전처리 작업을 포함시킨 신경망(Neural Network) 모델

## 1. CNN이 응용되는 컴퓨터 비전 영역
1. **Image Classification(이미지 분류)**
2. **Object Detection(객체 검출)**
    - 이미지 안에 object(물체)들의 위치정보를 찾아 Bounding Box(사각형 박스)로 표시
    - Localization: 하나의 object 찾기
    - object Detection: 여러개의 object 찾기
    - 찾은 물체를 분류도 해준다.
3. **Image Segmentation**
    - 이미지의 전체 픽셀에 대해 분류한다.
    - 각 픽셀을 분류한다. (EX. (0, 5)는 고양이고 (0, 0)은 배경이고...)
4. Image Captioning
    - 이미지에 대한 설명문을 자동으로 생성
5. Super Resolution
    - 저해상도의 이미지를 고해상도의 이미지로 변환
6. Neural Style Transfer
    - 입력 이미지와 스타일 이미지를 합쳐서 합성된 새로운 이미지 생성
   - 이미지 스타일을 변경해주는 것
7. Text Dection & OCR
    - Text Detection: 이미지 내의 텍스트 영역을 bounding box로 찾아 표시
    - OCR: text detection이 처리된 bounding box 안의 글자들이 어떤 글자인지 찾는다.
8. Human Pose Estimation
    - 사람의 신체부위를 keypoint라는 점으로 추정해 연결하여 현재 포즈를 예측한다.

## 2. 이미지 인식(Image Recognition)이 어려운 이유
1. 사람과 컴퓨터가 보는 이미지의 차이
    - 컴퓨터가 보는 이미지는 0 ~ 255 사이의 숫자로 이루어진 행렬이다.
    - 숫자들 안에서 패턴을 찾는 것이 쉽지 않다.
2. 배경과 대상이 비슷해서 구별이 안되는 경우
    - 검은 고양이가 검은 배경에 있는 이미지
3. 같은 종류의 대상도 형태가 너무 많다.
    - 누워있는 고양이, 서있는 고양이, 앉아있는 고양이 ...
4. 대상이 가려져 있는 경우
    - 가방에 들어가있는 강아지 ...
5. 같은 class에 다양한 형태가 있다.
    - 포메, 시바, 치와와, 진돗개, ...

## 3. 기존 이미지 처리 방식과 딥러닝의 차이
- Handcrafted
- End to End learning

## CNN
- 이미지로 부터 부분적 특성을 추출하는 Feature Extraction 부분과 분류를 위한 Classification 부분으로 나눈다.
- Feature Extraction 부분에 이미지 특징 추출에 성능이 좋은 Convolution Layer를 사용한다.
    - Feature Exctraction : Convolution Layer
    - Classification : Dense Layer (Fully connected layer)

- Dense Layer를 이용한 이미지 처리의 문제점
    - 이미지를 input으로 사용하면 weight의 양이 이 매우 큼
        - units의 수를 갑자기 확 줄이면 특징을 못 찾기 때문에 unit(필터) 수를 줄이기는 어렵다.
        - weight가 많으면 학습 대상이 많은 것이므로 학습하기가 그만큼 어려워진다.
        - 64 * 64 픽셀 이미지의 경우
            - 흑백은 Unit(노드) 하나당 500 * 500 = 25000 개 학습 파라미터(가중치-weight)
            - 컬러는 Unit(노드) 하나당 500 * 500 * 3 (RGB 3가지) = 750000 학습 파라미터(가중치-weight)
    - Fully connected layer(dense layer)만을 사용한다면 이미지의 공간적 구조 학습이 어려움
        - 같은 형태가 전체 이미지에서 위치가 바뀌었을때 다른 값으로 인식하게 된다.
