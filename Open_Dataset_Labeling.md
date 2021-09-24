# Object Detection을 위한 주요 open Dataset
## Open Dataset
- 2009년 ImageNet 데이터셋 이후 다양한 단체들에서 Object Detection, semantic segmentation, pose estimation 등 다양한 컴퓨터 비전 문제에 활용할 수 있는 Image Dataset을 제공하고 있다.
- Computer Vision을 위한 Open Dataset 들은 이미지와 그 이미지에 대한 문제영역 관련 Annotation 파일을 제공한다.

## Annotation
- 학습시킬때 필요한 정보를 제공하는 문서(text) 파일
- 보통 각 이미지파일의 위치, 학습시 필요한 출력 정보(y, output)등을 제공한다.
    - 출력 정보: 이미지내의 Object(물체)들의 Bounding Box 위치정보, Object의 Label, segmentation 파일위치 등.
- Open Dataset마다 작성 포멧이 다른데 JSON, XML, CSV등을 사용한다.


# Open Dataset
## 1. PASCAL VOC(Visual Object Classes)
- http://host.robots.ox.ac.uk/pascal/VOC/
- 2005년에서 2012년까지 열렸던 VOC challenges 대회에서 사용한 데이터셋으로 각 대회별 데이터셋을 Open Dataset으로 제공한다.
    - 이 중 2007년도와 2012년도 이미지가 많이 쓰인다.
    - PASCAL VOC 2007 대회 메인페이지
    - PASCAL VOC 2012 대회 메인페이지
- 20개 CLASS
    - 4개 그룹의 20개 클래스로 구성되 있다.
        1. Person: person
        2. Animal: bird, cat, cow, dog, horse, sheep
        3. Vehicle: airplane, bicycle, boat, bus, car, motorbike, train
        4. ndoor: bottle, chair, dining table, potted plant, sofa, tv/monitor
- VOC 2007: Train/Validation/Test를 위한 총 9,963개 이미지를제공하고 이미지 내의 22,640 물체에 대한 annotate 를 제공한다.
- VOC 2012: Train/Validation/Test를 위한 총 11,530개 이미지를제공하고 이미지 내의 27,450 물체에대한 annotate와 6,929개의 segmentation 을 제공한다.
- Annotation 파일은 xml 포멧으로 제공

## 2. MS-COCO Dataset
- COCO (Common Objects in Context)
- https://cocodataset.org/
- https://arxiv.org/pdf/1405.0312.pdf
- 연도별로 데이터 셋을 제공한다.
- 특징
    - Object Detection, segmentation을 위한 고해상도의 33만장의 이미지와 20만개 이상의 Label을 제공.
    - 총 80개의 category의 class들을 제공.
- class 목록: https://gist.github.com/AruniRC/7b3dadd004da04c80198557db5da4bda


## 그외 Datasets
- Open Image
    - 구글에서 공개하는 Image Data로 현존 최대 규모 범용 이미지 데이터이다. V5 기준 600개 category에 약 9천만장의 데이터셋을 제공.
    - https://storage.googleapis.com/openimages/web/index.html
    - https://github.com/cvdfoundation/open-images-dataset
- KITTI
    - 차 주행관련 데이터셋을 제공한다.
    - http://www.cvlibs.net/datasets/kitti/
- AIHub
    - 과학기술정보통신부와 한국정보화진흥원(NIA)에 주관하는 곳으로 이미지, 텍스트, 법률, 농업, 영상, 음성 등 다양한 분야의 딥러닝 학습에 필요한 데이터를 수집 구축하고 이를 AI-Hub 를 통해 공개하고 있다.
    - https://aihub.or.kr/

## 이미지 수집
