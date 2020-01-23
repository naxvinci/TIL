# database



```python
import pymysql

conn = None

try: 
    conn = pymysql.connect(
        host = 'localhost', user = 'root', password = '1234',
        db = 'python', charset = 'utf8') #데이터베이스 접속

    with conn.cursor() as cursor: # Cursor 객체 생성
        sql = '''CREATE TABLE mysql (
                    id INTEGER PRIMARY KEY AUTO_INCREMENT
                    , title VARCHAR(100), content VARCHAR(100))'''
        cursor.execute(sql) #sql실행
        conn.commit() #저장
    
except pymysql.InternalError as e:
    print(e)
    
finally: 
    
    conn.close() # Try 내의 지역변수
```

mysql  예외처리까지





place holder 방식...

%s%s



