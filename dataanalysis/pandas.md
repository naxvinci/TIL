# pandas

> 고성능 array를 계산하는 라이브러리인 NumPy의 레퍼로서... NumPy를 핸들링하는 역할을 하는 파이썬계의 엑셀



## Series

- 데이터의 column 하나를 부르는 것
- 이게 모여서 DataFrame을 만든다
- index를 기준으로 join 등이 가능하다
- index는 value들을 구분해주기 위한 이름 같은 것



.values & .index

- 해당 값들을 리스트 형태로 뽑아내는 것이 가능



```
dtype('O')
```

데이터 타입이 object라는 의미일까

.describe()

- 각 칼럼 내 count, mean, std, min, 25%, 50%, 75%, max를 정리해서 보여주는 함수

.value_counts()

- 앞에 지정한 칼럼 내의 각 value의 개수를 반환



## 데이터 색인

| 구분 | 점색인        | 연속색인 | 불연속색인     | bool색인    |
| ---- | ------------- | -------- | -------------- | ----------- |
| 대상 | 열            | 행       | 열             | 행          |
| 예   | df['country'] | df[:5]   | df[['c', 'd']] | df[boolvec] |



#### 열단위로 데이터 추출하기

```python
country_df = df['country']
```

```python
np.all(df['country'] == df.country)
```

- 결국 둘은 같다. 칼럼 이름이 함수명과 중복되지 않는 이상



```python
df[['country']].head()
```

- 중괄호 두개를 씌워주면 DataFrame 형태가 된다



```
pd.Series([1, 3, 6, 7], name='tarzan').name
```

- 1,3,6,7이라는 value들을 가지는 tarzan이라는 컬럼명의 series를 만드는 것



.tail()

- 마지막 5개 값 반환
- 데이터[-5:]와 같은 의미



#### 행단위 데이터 추출하기





## 데이터 인덱싱

- `loc` : 라벨값 기반의 2차원 인덱싱
- `iloc` : 순서를 나타내는 정수 기반의 2차원 인덱싱
- `at`: 라벨값 기반의 2차원 인덱싱 (한개의 스칼라 값만 찾는다)
- `iat` : 순서를 나타내는 정수 기반의 2차원 인덱싱 (한개의 스칼라 값만 찾는다)

- 



```
print(df.loc[0, :])
```

- index 0에 해당하는 모든 열을 출력



```
try:
    print(df.loc[-1])
except Exception as e:
    print(e)
    print(df.iloc[[-1]])
```

- 맨 끝 인덱스에 해당하는 값을 출력하기 위해서는` loc[-1]`가 아니라 `iloc[[-1]]`를 사용해야 한다.
- 중괄호 두개를 써주는 이유는 데이터프레임으로 만들기 위해서..
- 

```
print(df.tail(n=2))
```

- 끝에서 몇 개를 출력할지 `n=` 으로 지정해줄 수 있다
- loc는 중괄호 두개를 쓰지 않으면 series를 반환하지만 tail는 DataFrame을 반환한다



```
print(df.loc[[0, 99, 999]])
```

- 0, 99, 999에 해당하는 인덱스값을 가진 칼럼들을 출력

```python
print(df.loc[10:13, ['country', 'lifeExp', 'gdpPercap']])
```

- 이름을 사용할 때는 start:end에서 end를 포함한다.



```
df.columns[[0, 4]]
```

- 인덱스 0과 4에 해당하는 칼럼의 이름을 출력



```
df[df.columns[[0, 4]]] == df.iloc[:, [0, 4]]
```

같은 기능을 한다



```python
df.iloc[[0, 99, 999], [0, 5]] # 혼용하는 것도 가능
```



```
# bool 색인 : 행선택, 점 색인: 열선택
pop1962mean = df[df.year == 1962]['pop'].mean()
pop1962mean
```

행... 열.... 뭣...



#### [Quiz] 1962년 데이터에서 1962년 pop 평균 이하의 데이터에서 대해 country 와 pop, gdpPercap 열만 출력하라.

```python
df[(df.year == 1962) & (df['pop'] < pop1962mean)][['country', 'pop', 'gdpPercap']]
```



### range 메서드로 원하는 데이터 추출

```python
small_range = list(range(5)) # list 형태

subset = df.iloc[:, small_range] 
print(subset.head())
```

- list에 해당하는 인덱스를 가진 값들 출력



```
subset = df.iloc[:, 0:6:2] 
print(subset.head())
```

- 요건 무슨 의미...? 0:6:2



.unique()

- 중복을 제거하는 함수



.delete()

- 해당 칼럼 삭제



.argsort()

- ```
  eastAsia.iloc[eastAsia['year'].argsort()]
  ```

- year 칼럼의 value값들 기준으로 sort



### groupby()

```
print(df.groupby('year')['lifeExp'].mean())
```

- 연도별로 묶어 lifeExp에 해당하는 값들의 평균값을 출력





.nunique()

그룹화한 데이터의 개수 세기