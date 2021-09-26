# TFRecord
- https://www.tensorflow.org/tutorials/load_data/tfrecord
- Tensorflow에서 제공하는 데이터셋을 저장방식.
    - 데이터 양이 많을 경우 이를 Binary로 Seralization(직렬화)하여 하나의 파일로 저장하고 있다가, 이를 다시 읽어 들여 처리하면 처리속도를 향상시킬 수 있다. Tensorflow에서 이를 위해서 데이터 셋을 Protocol Buffer 형태로 Serialization을 수행해서 저장할 수 있는 TFRecords 파일 포맷 형태를 지원한다.
    - tf.train.Example 클래스를 이용해서 {“string” : tf.train.Feature} 의 딕셔너리 형태로 데이터들을 TFRecords 파일에 저장할 수 있다.
- tf.train.Example
    - 하나의 데이터를 TFRecord에 저장하기 위해 변환하는 클래스. 하나의 데이터를 tf.train.Example 의 객체로 변환해서 저장한다.
- tf.train.Feature
    - 하나의 데이터를 구성하는 속성(feature)들을 변환하는 클래스.
    - tf.train.Feature는 다음 세가지 타입을 지원한다.
        - tf.train.BytesList – string, byte 타입을 변환
        - tf.train.FloatList – float(float32), double(float64) 타입을 변환
        - tf.train.Int64List – bool, enum, int32, uint32, int64, uint64 타입을 변환
- tf.tran.Example의 형태
    ```json
    {
    "feature명":tf.train.Feature타입객체,
    "feature명":tf.train.Feature타입객체,
    ...
    }
    ```
> **직렬화(Serialization)**: 메모리에 저장된 다양한 타입의 값을 디스크(네트워크)에 저장할 수 있는 상태로 변환하는 것.  
> **binary data**: 디스크에 저장되는 0, 1로 구성된 데이터  

> DataBase를 예로 들면 col은 Feature, row는 Example, table은 TFRecord라고 보면 된다.