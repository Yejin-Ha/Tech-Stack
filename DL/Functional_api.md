# Functional API
- Sequential 모델은 각 Layer들의 입력과 출력이 하나라고 가정한다. 그리고 각각의 Layer(입력층, 은닉층, 출력층)들을 차례대로 쌓아 구성한다. 그래서 다양한 구조의 네트워크를 만드는데 한계가 있다.
- 함수형 API를 사용하면 **다중입력, 다중출력, 그래프 형태**의 다양한 형태의 모델을 유연하게 구성할 수 있다.
- Functional API는 직접 텐서들의 입출력을 다룬다.
- 함수호출 처럼 Layer를 이용하여 입력 텐서(Input Tensor)를 입력 받고 그 결과를 출력 텐서(Output Tensor)로 반환하는 형식으로 모델을 구현한다.

1. ###  레이어를 합치는 함수
    - **shape이 같아야 한다.**
   - oncatenate(list, axis=-1) : 레이어들을 합친다
        - list: 합칠 레이어들을 리스트에 묶어 전달
        - axis: 합칠 기준축. (기본값: -1 : 마지막 축기준)
   - add(list), substract(list), multiply(list)
        - 같은 index의 값들을 계산해서(더하기, 빼기, 곱하기) 하나의 레이어로 만든다.
        - list: 합칠 레이어들을 리스트에 묶어 전달 
