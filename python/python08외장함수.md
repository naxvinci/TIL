# 외장함수



> 내장함수와는 다르게 모듈을 불러들이는 import 과정을 거쳐야됨



## sys

#### sys.argv



#### sys.exit()



## pickle

> 객체의 형태를 그대로 유지하면서 파일에 저장하고 불러올 수 있게 하는 모듈

#### pickle.dump()

> 내가 저장하고자 하는 자료와 실제 저장되는 자료를 함께 지정해주면 저장~

#### pickle.load()

> 객체 형태를 그대로 유지하면서 불러오기



## os

> 몰라 잘 쓸 일 없을 거 같다 ㅜ

#### os.system()

> 그나마 좀 쓰였다.. 중요한 강려크한 기능
>
> 아아주 옛날에는 이걸로도 해킹 가능했다~



## shutil

> 파일을 복사해주는 모듈

#### shutil.copy()



### glob

> 어떤 디렉토리 내에 다른 디렉토리나 파일들이 뭐 있나

#### glob.glob()

```python
import glob
fileList = glob.glob('C:/Users/student/Miniconda3/Lib/*')
print(fileList)
```

