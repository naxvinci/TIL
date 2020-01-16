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



## tempfile

> 파일을 임시로 만들어 사용하게 해주는 모듈

파일을 업로드했는데 하드디스크에서 보고싶진 않을때...!

잠깐 쓰고 파일 치워버리고 싶을때 사용한다

딱히 가치 없음 ㅎㅎ



## time

> 자주 사용된다
>
> 현재, 미래, 과거 날짜, 디데이, 프로그래밍 잠깐 멈춰세우기 등등 시간과 관련된 여러 기능 제공 모듈

#### time.time()

> 유닉스 타임으로 현재 시각을 실수 형태로 돌려주는 함수(밀리세컨드 단위)

괴상한 숫자로 나온다



#### time.localtime()

>  time.time() 으로 반환된 값을 이용하여 년, 월, 일, 시, 분, 초 등의 Tuple 형태로 변환해주는 함수



####  time.asctime()

```
import time
time.localtime(time.time())
time.asctime(time.localtime(time.time()))
```

이거 대신 걍 time.ctime 써줘도 됨



#### time.strftime()

> 앞의 딱딱한 함수들보다 출력 형태를 세밀하게 표현 가능 (string format)

```python
time.strftime('출력할 형식 포맷 코드', time.localtime(time.time()))

```



#### time.sleep()

> 일정 시간 동안 멈추도록 해주는 함수. 
>
> 주로 반복문 안에서 사용



## calendar

> 달력 보는 모듈

#### calendar.weekday()

> 유용하다... 년, 월, 일을 입력 받아 그 날 해당하는 요일 정보 숫자로 돌려주는 함수



#### calendar.monthrange()

> 년, 월을 입력받은 후 해당 월의 1일의 요일과 마지막 일을 돌려주는 함수

이것도 유용하대



