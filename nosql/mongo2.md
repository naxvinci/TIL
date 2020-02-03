mongo

db

show dbs

use test



```
> db
test
> show dbs
admin   0.000GB
config  0.000GB
local   0.000GB
test    0.004GB
> use test
switched to db test
> show collections
document
score
test_col
tour
users
> db.user.save({ name: 'AAA', age:30, address: ['서울', '신림']   } )
WriteResult({ "nInserted" : 1 })
```



```
> db.user.find()
{ "_id" : ObjectId("5e37afb4b5618ac9df71a9fa"), "name" : "AAA", "age" : 30, "address" : [ "서울", "신림" ] }
> db.user.save({ name: 'AAA', age:30, address: ['제주', '연동']   } )
WriteResult({ "nInserted" : 1 })
> db.user.find({ age: { $gte : 30 } })
{ "_id" : ObjectId("5e37afb4b5618ac9df71a9fa"), "name" : "AAA", "age" : 30, "address" : [ "서울", "신림" ] }
{ "_id" : ObjectId("5e37b012b5618ac9df71a9fb"), "name" : "AAA", "age" : 30, "address" : [ "제주", "연동" ] }
>

```

