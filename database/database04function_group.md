# Function / Group

### 1. 함수 사용

> 이 정도는 외워라

**문자열 추출** 

- `SUBSTR(대상 문자열, 시작 위치[, 추출 개수])) `

**문자열 합치기**

- `CONCAT(문자열1, 문자열2)) `



#### ROUND

> `ROUND(값, 반올림 지점)`

- 반올림하기

  ```mysql
  SELECT SAL * 0.5, ROUND(SAL * 0.5, 0) FROM EMP;
  
  SELECT ROUND(123.321, 1);
  ```



#### SUBSTR

> `SUBSTR(대상 문자열, 시작 위치[, 추출 개수]))`

- 문자열 잘라내기

  ```mysql
  SELECT SUBSTR(HIREDATE, 1, 10) FROM EMP;
  ```

- 첫 자리가 1로 시작 



#### CONCAT

> `CONCAT(문자열1, 문자열2))`

- 문자열 합치기

  ```mysql
  SELECT * FROM EMP WHERE ENAME LIKE CONCAT ('%', 'A', '%');
  ```

- 데이터 검색 시 아래와 같은 방식을 쓸 경우 검색이 되지 않는 문제가 있음

  ```mysql
  SELECT * FROM EMP WHERE ENAME LIKE '%A%';
  ```

- 이걸 해결하기 위해 유용한 방식



#### NOW()

> `SELECT NOW();`

- 현재 연월일시분초를 출력

  ```mysql
  SELECT NOW();
  
  SELECT DATE_FORMAT(NOW(), '%Y/%m/%d');
  
  SELECT DATE_FORMAT(NOW(), '%Y/%m/%d/%H:%i:%s');
  ```

  - ----> 2020/01/21
  - ---->2020/01/21/10:03:08



### 2. 조건문 사용 : CASE

```mysql
SELECT *,
		IFNULL(COMM, 0),
		CASE DEPTNO
			WHEN 10 THEN '총무'
			WHEN 20 THEN '운영'
			ELSE '기타' END
	FROM EMP;
```

- DEPTNO가 몇번이냐에 따라 CASE를 설정하겠다.
- IFNULL()함수 추가



### 3. 집계 함수를 이용한 검색

>  통계적으로 계산한 결과를 검색 
>
> 개수, 합계, 평균, 최대, 최소값 계산 기능 제공

- 하나의 묶음으로 처리한다
- 속성값이 NULL인 경우 이 것을 완전히 무시한다
  - 전체 개수에서 무시한다든지... 평균을 낼 때 무시한다든지...
  - 이걸 해결하기 위해 IFNULL()을 사용



#### AVG

- 테이블의 모든 항목 평균 검색

#### SUM

- 테이블의 모든 항목 합 검색

#### MAX/ MIN

- ```mysql
  SELECT * 
  	FROM 제품
   WHERE 재고량 = (SELECT MAX(재고량) 
   							FROM 제품); --서브쿼리
  ```

  - --->![image-20200121102347154](database04function_group.assets/image-20200121102347154.png)

- 최대값, 최소값

#### COUNT

- ```mysql
  SELECT COUNT(나이) FROM 고객; -- NULL 제외
  SELECT COUNT(*) FROM 고객;
  SELECT COUNT(1) FROM 고객;
  ```

  

#### 활용하기

```mysql
# 1. 모든 사원들의 수 검색
SELECT COUNT(*) FROM EMP;

# 2. 직속상관이 없는 사원을 제외한 사원수 검색
SELECT COUNT(*) FROM EMP 
 WHERE MGR IS NOT NULL;

# 3. 급여가 2000 이하인 사원들의 급여합계 검색
SELECT SUM(SAL) FROM EMP 
 WHERE SAL < 2000;

# 4. 직무가 MANAGER인 사원들의 사원수와 급여평균 검색
SELECT COUNT(*), AVG(SAL) FROM EMP 
 WHERE JOB = 'MANAGER';

# 5. 가장 급여가 낮은 사원의 급여 검색
SELECT MIN(SAL) FROM EMP;

# 6. 30번 부서에서 근무하는 사원 중 가장 급여가 높은 사원의 급여 검색
SELECT MAX(SAL) FROM EMP 
 WHERE DEPTNO = 30;

# 7. 회사의 현재 모든 직무 수 검색
SELECT COUNT(DISTINCT JOB) FROM EMP;
```





### 4. GROUP BY

WHERE 조건 바로 다음, ORDER BY 전에 들어온다

- GROUP BY 사용시 개별적인 요소는 사용못한다

- GROUP BY 사용시 GROUP 할 속성 또는 집계 함수만 들어올 수 있다

  ```mysql
  SELECT 제조업체, COUNT(제조업체) FROM 제품
  	GROUP BY 제조업체;
  ```

-  '고객' 테이블에서 적립금 평균이 1000원 이상인 등급에 대해 등급별 고객 수와 적립금 평균을 검색 **( HAVING )**

  ```mysql
  SELECT 등급, ROUND(AVG(적립금), 0), COUNT(*)
    FROM 고객
  GROUP BY 등급 HAVING AVG(적립금) >= 1000;
  ```

  



### 데이터 조회 (SELECT) 활용

```mysql
-- 가
SELECT COMPANY, CONVERT(CONCAT(COUNT(*), '개')USING UTF8) AS COUNT
  FROM NOODLE
 GROUP BY COMPANY;
 
 -- 나
 SELECT COMPANY, CAST(CONCAT(COUNT(*), '개') AS VARCHAR(10)) AS COUNT
  FROM NOODLE
 GROUP BY COMPANY
 ORDER BY COUNT(*) ASC;
 
  -- 다
 SELECT COMPANY, CONCAT(COUNT(*), '개') AS COUNT
  FROM NOODLE
 GROUP BY COMPANY HAVING COUNT(*) >= 3; 
 
 -- 라
 SELECT NAME, COMPANY
 		, DATE_FORMAT(E_DATE, '%Y년 %m월 %d일') AS E_DATE
  FROM NOODLE
 WHERE KIND = 'M' 
  AND PRICE >= 800;
 
 -- 마
 SELECT CONCAT(MAX(PRICE),'원')
  FROM NOODLE
  WHERE KIND = 'C';
 
 -- 바
 SELECT COMPANY, CONCAT(MIN(PRICE),'원')
  FROM NOODLE
 GROUP BY COMPANY 
 ORDER BY COMPANY ASC;
 
  -- 사
 SELECT COMPANY, CONCAT(SUM(PRICE),'원') AS '제조사별 합계'
  FROM NOODLE
 GROUP BY COMPANY 
 ORDER BY SUM(PRICE);
 
  -- 아
 SELECT COMPANY, CONCAT(ROUND(AVG(PRICE), 0),'원') 
  FROM NOODLE
 GROUP BY COMPANY
 ORDER BY AVG(PRICE) DESC;
```





```
AUTO_INCREMENT
```

insert 할 때마다 1번부터해서 증가되는 값을 넣겠다는 것... 자동으로 번호 부여

### 활용하기

```
  -- 1
 SELECT WEEK ,SUM(DIE)
  FROM ACCIDENT
 GROUP BY WEEK
 ORDER BY COUNT(*) DESC;
 
  -- 2
 SELECT AREA1 ,SUM(DIE)
  FROM ACCIDENT
 GROUP BY AREA1
 ORDER BY AREA1;
 
 
  -- 3
 SELECT AREA1, AREA2 ,SUM(DIE)
  FROM ACCIDENT
 GROUP BY AREA1, AREA2
 ORDER BY AREA1, AREA2;
 
 
  -- 4
 SELECT KIND ,COUNT(*)
  FROM ACCIDENT
 GROUP BY KIND
 ORDER BY COUNT(*) DESC
 LIMIT 0,5;
 
   -- 5
 SELECT WEEK ,COUNT(*)
  FROM ACCIDENT
 GROUP BY WEEK
 ORDER BY COUNT(*) ASC
 LIMIT 0,1;
 
```



```mysql
SELECT * FROM VISITOR_TB;
-- 1
SELECT COUNT(*)
  FROM VISITOR_TB
 WHERE VST_TIME
 BETWEEN '2018-01-01'
 			 AND '2019-01-01';
 -- 2
SELECT IP_ADDRESS, COUNT(*)
  FROM VISITOR_TB
 GROUP BY IP_ADDRESS HAVING COUNT(*) >=2
 ORDER BY COUNT(*) DESC, IP_ADDRESS ASC;
 -- 3
SELECT DATE_FORMAT(VST_TIME, '%Y'), COUNT(*)
  FROM VISITOR_TB
 GROUP BY SUBSTR(VST_TIME, 1, 4);
 -- 4
SELECT DATE_FORMAT(VST_TIME, '%m'), COUNT(*)
  FROM VISITOR_TB
 GROUP BY SUBSTR(VST_TIME, 6, 2)
 ORDER BY COUNT(*) DESC;
 -- 5
SELECT DATE_FORMAT(VST_TIME, '%Y-%m') AS '방문월'
		, CASE VST_PATH
			WHEN 1 THEN '검색'
			WHEN 2 THEN '부산관광공사'
			ELSE '기타' END AS '방문경로'
		, COUNT(*)
  FROM VISITOR_TB
 GROUP BY DATE_FORMAT(VST_TIME, '%Y-%m'), VST_PATH;
 
```

