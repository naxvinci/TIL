# Insert / Select

- 데이터 삽입 : INSERT
- INSERT INTO 테이블명 [(속성 리스트)] VALUES (속성의 값 리스트);



DB에서는 작은 따옴표를 무조건 써야 한다

```mysql
INSERT INTO 부서 (부서번호, 부서이름) 
	VALUES (1, '홍보부');
```



```mysql
INSERT INTO MEMBER (NUM, NAME, EMAIL, PHONE)
VALUES (1, 'A', 'aaa@gmail.com', '010-0001');

INSERT INTO MEMBER (NAME, EMAIL, NUM, PHONE)
VALUES ('B', 'bbb@gmail.com', 2, '010-0002');

INSERT INTO MEMBER (NUM, NAME, EMAIL, PHONE)
VALUES (3, 'C', 'ccc@gmail.com', '010-0003');

INSERT INTO MEMBER (NAME, NUM)
VALUES ('D', 4);
```

![image-20200120134718687](database03insert_select.assets/image-20200120134718687.png)

기본키 지정이 되어 있기 때문에 중복 데이터가 들어가려 하면 에러가 뜬다



- 데이터 조회 : SELECT
- SELECT [DISTINCT] 속성 리스트 FROM 테이블 리스트
- 속성 리스트 나열하기 귀찮으면 *로 대체 가능
- `SELECT * FROM 고객;`
- `DESC 고객;` - 속성 리스트를 확인



중복데이터를 걸러내고 하나씩 데이터를 출력하려면 DISTINCT를 활용한다

```mysql
SELECT DISTINCT (제조업체) FROM 제품;
SELECT DISTINCT 제조업체, 제품명 FROM 제품;
```



- 속성명 변경 출력 : AS
- SELECT 속성명 [AS] 변경속성 FROM 테이블
- 테이블이 가진 기존 속성명을 지정한 속성명으로 변경하여 출력 가능

- [AS] 생략하고 띄어쓰기로 구분해도 가능

- ```mysql
  SELECT 제품명, 단가 AS '가격' FROM 제품;
  ```

  

- 