# Join

> 여러 개의 테이블을 연결하여 하나의 테이블처럼 사용하는 것

- 일반적으로 외래키가 조인 속성으로 사용
- 일부러 오류를 발생시키기도 한다(많은 양의 데이터 넣어보고 테스트 돌려보고 싶을 때)



```mysql
# 이게 표준 SQL방식
SELECT *
  FROM EMP
  JOIN DEPT
  ON EMP.DEPTNO - DEPT.DEPTNO;

# 간편한 방식
SELECT *
  FROM 사원, 부서
 WHERE 사원.`소속부서` = 부서.`부서번호`;
 
 SELECT *
   FROM EMP, DEPT
 WHERE EMP.DEPTNO = DEPT.DEPTNO;
```



WHERE을 통해 먼저 걸러낼 수 있으면 먼저 걸러내는 습관



### 조인의 종류

#### Equi 조인

- Equality Condition (=) 에 의한 조인

####  Non-Equi 조인

- 컬럼 값이 일치하지 않을 때 (<, >, BETWEEN 등 사용)

####  Self 조인

- Equi 조인과 같으나 하나의 테이블만 사용해서 조인

- 하나의 테이블 내에 참조해야 하는 데이터가 있는 경우

- ```mysql
  SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME
    FROM EMP E1
    JOIN EMP E2
      ON E1.MGR = E2.EMPNO;
  ```



#### Outer 조인

- 연결되는 컬럼 값이 없더라도 데이터를 검색해주는 조인
- COLUMN 을 늘리면 안된다!!!!!!!!!!!
- 1대다의 데이터 상황

- `FROM 제품 LEFT JOIN 주문`

```mysql
SELECT *
  FROM 제품 P
  LEFT JOIN 주문 O
    ON P.`제품번호` = O.`주문제품`;
    
SELECT *
  FROM 주문 O
  RIGHT JOIN 제품 P
    ON P.`제품번호` = O.`주문제품`;
```

둘다 나오게 하려면 FULL OUTER JOIN 이 있긴 한데 MYSQL에서는 지원하지 않는다



