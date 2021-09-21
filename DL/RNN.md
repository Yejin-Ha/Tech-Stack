# 순환신경망 - RNN(Recurrent Neural Network)
순차 데이터(Sequence Data) 분석을 위한 모형

- ### 순차 데이터 - Sequence Data
    - 순서가 의미가 있고, 순서가 달라질 경우 의미가 바뀌거나 손상되는 데이터를 말한다.
    1. Sequence-to-vector (many to one)
        - Sequence가 들어가면 vector(하나)가 나온다.
    2. Sequence-to-sequence (many to many)
        - 여러 데이터가 순차적으로 들어와서 결과가 순차적으로 출력된다.
        - 입력을 처리: Encoder, 결과를 처리: Decoder
    3. Vector-to-sequence (one to many)
        - 이미지 하나(vector)가 들어가면 단어들(문장)이 나온다.

## RNN 개요
1. Memory System (기억 시스템)
    - Fully Connected Layer나 Convolution Layer의 출력은 이전 Data에 대한 출력에 영향을 받지 않는다.
2. Simple RNN
    - RNN은 내부에 반복(Loop)를 가진 신경망의 한 종류
    - 각 입력 데이터는 순서대로 들어오며 Node/Unit은 입력데이터( 𝑥 )와 이전 입력에 대한 출력 데이터( ℎ𝑛−1 )를 같이 입력받는다.
    - 입력 데이터에 weight를 가중합한 값과 이전입력에대한 출력 값에 weight를 가중한 값을 더해 activation을 통과한 값이 출력값이 된다. 그리고 이 값을 다음 Sequence 데이터 처리에 전달한다.
    - ### 기본순환신경망의 문제
        - Sequence가 긴 경우 **앞쪽의 기억(초반 데이터의 결과)이 뒤쪽에 영향을 미치지 못해 학습능력이 떨어진다.**
            - 경사 소실(Gradient Vanishing) 문제로 처음의 input값이 점점 잊혀지는 현상 발생
        - ReLU activation, parameter initialization의 조정 등 보다 모형의 구조적으로 해결하려는 시도
            - **Long Short Term Memory(LSTM**; Hochreiter & Schmidhuber, 1997)
            - Gated Recurrent Unit(GRU; Kyunghyun Cho et al., 2014)

3. LSTM (Long Short Term Memory)
    - RNN을 개선한 변형 알고리즘
        - 바로 전 time step의 처리리결과와 전체 time step의 처리결과를 같이 받는다.
    - **오래 기억할 것은 유지하고 잊어버릴 것은 빨리 잊어버리자**
    - 구조
        - Forget gate : 불필요한 데이터는 잊어버리자
        - Input gate : cell state + 현재
        - output gate : 처리가 끝나면 결과를 출력해 주는 것
