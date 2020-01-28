# Subquery

```mysql
SELECT * 
  FROM EMP
 WHERE SAL IN (
					SELECT SAL
					  FROM EMP
					 WHERE SAL = 1250
				  );
```

> 부속질의문

- 단일 행 부속 질의문은` = `등의 비교 연산자를 사용하면 되지만
- 다중 행 부속 질의문은 별도의 연산자를 사용해야 실행 가능
- 데이터베이스에 정말 많은 부하를 주는 작업임
- 코드정렬 예쁘게 해주자



이중 서브쿼리도 가능하다

```mysql
SELECT *
  FROM EMP
 WHERE SAL < (SELECT AVG(SAL)
				FROM EMP
			   WHERE DEPTNO = (SELECT DEPTNO
								 FROM EMP
								WHERE COMM = 0));
```



# Update / Delete

UPDATE의 순서를 봐주자

- UPDATE - SET - WHERE 순서임



- INSERT INTO 테이블 VALUES

- SELECT * FROM 테이블

  WHERE / GROUP BY / ORDER BY

- UPDATE 테이블 SET

- DELETE FROM 테이블 



### UPDATE

```mysql
UPDATE 제품 SET 제품명 = '통큰파이' 
 WHERE 제품명 = '쿵떡파이';
```

반드시 WHERE을 함께 써줘야 한다



- DB 접속 툴 HeidiSQL 사용 시 Auto Commit 비활성화해주기
  - `SET @@AUTOCOMMit = 0;`



### DELETE

```sql
DELETE
FROM 테이블명
[WHERE 조건];
```

HEIDI SQL에서는 DELETE를 사용 할 경우 이걸 정말 실행할래...? 라고 물어봐준다

