# 입력출력



띄어쓰기와 더하기로 넣을 때는 앞 뒤 같은 자료형이 와야 한다. 콤마는 통일해주지 않아도 된다



input- string 형태로 받는다. 안내문구를 넣을지 여부

메모장 파일의 숫자들을 불러와서 합을 구하기

```python
f = open('c:/dev/04_03_numbers_data.txt', 'rt', encoding = 'utf8')

data = f.read()
print(data)
datas = data.split('\n')
print(datas)
f.close()

total = 0
for t in datas:
    total += int(t)
print(total)
```

메모장 파일의 글자들을 불러와 t가 들어간 단어를 찾기

