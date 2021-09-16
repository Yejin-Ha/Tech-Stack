# GAP (GlobalAveragePooling)
- channel이 많으면 GAP를 쓰고 channel이 적으면 flatten을 쓴다.
- Feature map의 채널별로 평균값을 추출 1 x 1 x channel 의 Feature map을 생성
  
## 주요 CNN 모델
### VGG16 모델
- ImageNet ILSVRC Challenge 2014에서 2등한 모델로 Simonyan and Zisserman(Oxford Univ.)에 의해 제안
    - VGGNet이 준우승을 하긴 했지만, 구조의 간결함과 사용의 편이성으로 인해 1등한 GoogLeNet보다 더 각광받았다
- 단순한 구조로 지금까지 많이 사용.
- 총 16개 layer로 구성됨.(VGG16에서 16이 layer를 의미함)
- 네트워크 깊이가 어떤 영향을 주는 지 연구 하기 위해 설계된 네트워크로 동일한 kernel size에 filter(kernel)의 개수를 늘리는 방식으로 구성됨.
    - 11 layer, 13 layer, 16 layer, 19 layer 의 네트워크를 테스트함.
    - 19 layer의 성능이 16 layer보다 크게 나아지지 않음
- Filter의 수가 64, 128, 256, 512 두 배씩 커짐
- 항상  3×3  filter, Stride=1, same padding,  2×2  MaxPooling 사용
    - 이전 AlexNet이 5 X 5 필터를 사용했는데 VGG16은 3 X 3 필터 두개를 쌓아 사용했다.
        - **3 x 3 필터 두개를 쌓는 것이 5 x 5 하나는 사용하는 보다 더 적은 파라미터를 사용하며 성능이 더 좋았다.**
    - Feature map의 사이즈를 convolution layer가 아닌 **Max Pooling** 을 사용해 줄여줌.
- VGG16의 단점은 마지막에 분류를 위해 Fully Connected Layer(Dense layer) 3개를 붙여 파라미터 수가 너무 많아 졌다. 약 1억4천만 개의 parameter(가중치)중 1억 2천만개 정도가 Fully Connected Layer의 파라미터 임.

## ResNet (Residual Networks) 모델
- 이전 모델들과 비교해 shortcut connection기법을 이용해 Layer수를 획기적으로 늘린 CNN 모델로 ILSVRC 2015년 대회에서 우승을 차지함.
- 레이어를 깊게 쌓으면 성능이 더 좋아 지지 않을까? 실제는 Test 셋 뿐만 아니라 Train Set에서도 성능이 나쁘게 나옴.
- Train set에서도 성능이 나쁘게 나온 것은 최적화 문제로 보고, 레이어를 깊게 쌓으면 최적화 하기가 어렵다고 생각함.
- 기존 Layer들의 목표는 입력값인 X를 출력값인 Y로 최적의 매핑할 수 있는 함수 H(X)를 찾는 것이다. 그래서 H(X) – Y 가 최소값이 되는 방향으로 학습을 진행하면서 H(X)를 찾음. 그런데 레이어가 깊어지면서 최적화에 어려움으로 성능이 떨어지는 문제가 발생
- ResNet은 layer를 통과해서 나온 값이 입력값과 동일하게 만드는 것을 목표로 하는 **Identity block**을 구성한다.
    - 𝐻(𝑥)=𝐹(𝑥)+𝑥
        - 𝑥:𝑖𝑛𝑝𝑢𝑡,𝐻(𝑥):𝑜𝑢𝑡𝑝𝑢𝑡,𝐹(𝑥):𝑙𝑎𝑦𝑒𝑟통과값
    - 목표: 𝐻(𝑥) = 𝑥 가 되는 layer를 만들기(𝐹(𝑥)=0이 되면 된다.)
    - Identity block은 입력값 X를 레이어를 통과시켜서 나온 Y에 입력값 X를 더해서 합치도록 구성한다.
    - 목표는  𝐻(𝑥) (레이어통과한 값) 가 input인 x와 동일한 것이므로 F(x)를 0으로 만들기 위해 학습을 한다.
- 𝐹(𝑥) 는 잔차(Residual)가 된다. 그리고 잔차인  𝐹(𝑥) 가 0이 되도록 학습하는 방식이므로 **Residual Learning**이라고 한다.
- 입력인 x를 직접 전달하는 것을 shortcut connection 또는 identity mapping 또는 skip connection 이라고 한다.
- 이 shortcut은 파라미터 없이 단순히 값을 더하는 구조이므로 연산량에 크게 영향이 없다.
- 그리고 Residual을 찾는 레이어를 Residual Block, Identity Block 이라고 한다.

## MobileNet 모델
- 저성능 환경에서 실행되기 위해서는 다음과 같은 사항들을 만족시킬 수 있어야 한다.
    - 적은 연산량(낮은 계산의 복잡도)을 통한 빠른 실행
    - 작은 모델 크기
    - 충분히 납득할 만한 정확도
    - 저전력 사용
    - 즉 기존의 성능만을 신경쓴 모델 보다 적은 연산량으로 빠르게 추론할 수 있으되 성능이 납득할 수 있어야 한다.

# Pretrained Model을 이용한 학습
## 1. Transfer learning 전이학습
  - 큰 데이터 셋을 이용해 미리 학습된 pre-trained Model의 Weight를 사용하여 현재 하려는 예측 문제에 활용.
  - 예시 : 개/고양이를 분류하는 모델의 convolution base를 사용하여 새로운 classifier해서 늑대/이리/여우를 분류하는 모델 생성

  - ### Keras에서 제공하는 Pre-Trained Model
    - tensorflow.keras.applications 패키지를 통해 제공
      - [참고 사이트](https://www.tensorflow.org/api_docs/python/tf/keras/applications?hl=ko)

## 2. 미세조정 Fine-tuning
- 아래의 세 전략 모두 Classifier layer들을 train한다.
  1. 전체 모델을 학습시킨다.
       - train dataset의 양이 많고 학습했던 dataset과 train dataset의 유사성이 낮은 경우 적용
       - 학습에 시간이 많이 걸린다.
  2. Pretrain 모델의 일부는 freezing 하고 일부만 학습시킨다.
     - train dataset의 양이 많고 유사성이 학습했던 dataset과 train dataset의 높은 경우 적용
     - train dataset의 양이 적고 유사성이학습했던 dataset과 train dataset의  낮은 경우 적용
  3. Pretrained 모델 전체를 freezing하고 classifier만 학습시킨다.
        - train dataset의 양이 적고 학습했던 dataset과 train dataset의 유사성이 높은 경우 적용

## Model, layer에서 weight 조회
- layer들 조회
    - model객체.layers : 모델을 구성하는 layer 객체들을 담은 리스트
    - model객체.get_layer(layer이름(str)) : 매개변수로 전달한 이름의 layer 객체를 반환
- weigt 조회 및 설정
    1. 조회
       - weights : 레이어의 모든 weight 변수들을 담은 리스트
         - get_weights() : 레이어의 모든 weight 변수 리스트를 카피해서 반환한다.
       - trainable_weights : train(학습)시 업데이트 되는 weights들 리스트
       - non_trainable_weights : train(학습)시 업데이트 되지 않는(훈련되지 않는) weights 리스트
    2. boolean 값을 가지는 trainable 제공
        - trainable=False : layer의 weights가 훈련 불가능 상태로 변경된다.
        - 이런 상태를 Frozen-동결 이라고 하며 학습시 weight들이 업데이트 되지 않는다.
