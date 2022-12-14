# CocoSQLToturial
A SQL Tutorial for Coco

# Create a SQLite database file
```
cd .\sqlite-tools
sqlite3 DummyDatabase.db
.database
.quit
```
- 历史
  - 提高数据组织和管理的能力
- 原理及概念
  - 三大范式
    - 1 normalized formular (NF): A property is a minimum unit of data, one property maps to one column in database. 
    - 2NF: Each non-primary property must totaly depends on the primary property collection.
    - 3NF: Based on the 2NF, non-primary properties don't transfer the dependency of primary properties.
  - 非规范化可能出现的问题
    - 冗余数据: Same properties are duplicate in multiple tables
    - 插入异常: Can not insert a record with only part of properties
    - 修改异常: Update only one record of a entity while not all its records in database
    - 删除异常: Deleted another related entity when delete a record
  - 索引
    - 索引失效
  - 外键
- 数据库对象
  - 表 table
  - 视图 view
  - 存储过程 store procedure
- SQL查询
  - 单表查询
    - 查询条件
      - Where
      - [Not] Between And
      - Is [Not] Null
      - Like
        - %: 0或多个任意字符
        - _: 一个任意字符
        - \: 对%_转义字符
  - 复杂查询
    - 嵌套查询
    - 表变量
    - 临时表
      - 索引
    - [Outer|Cross] Apply
    - [Not] Exists
  - 多表联合查询
    - Left Join {} On {}
      - Left Join excluding Inner Join
    - Right Join {} On {}
      - Left Join excluding Inner Join
    - Full Outer Join {} On {}
      - Full Outer Join excluding Inner Join
    - Inner Join {} On {}
    - Cross Join {} Where {}
    - Self-Join*
  - 多数据源聚合
    - Union
    - Union All
  - 数据聚合
    - Group By
      - Having
    - Distinct
    - Count([Distinct])
    - Max()
    - Min()
    - Sum()
    - AVG()
- 数据排序与截取
  - Limit {} OffSet {} Order By [Asc|Desc]
  - Row_Number() Over(Partition By {} Order By {} [ASC|DESC])
- SQL函数
  - GetDate()
  - Convert()
  - DateDiff()
  - Concat()
  - ROUND()
- SQL写入*
  - Update
  - Insert
  - Delete
  - Drop
  - Truncate
- 高级*
  - 事务
    - BEGIN TRANSACTION;
    - COMMIT;
    - ROLLBACK;
    - END TRANSACTION;
  - 隔离级别
    - 一致性问题
  - 锁
    - 乐观锁
    - 悲观锁
  - 执行计划
