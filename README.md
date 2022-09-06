原理及概念
    三大范式
        1NF: A property is a minimum unit of data, one property maps to one column in database. 
        2NF: Each non-primary property must totaly depends on the primary property collection.
        3NF: Based on the 2NF, non-primary properties don't transfer the dependency of primary properties.
    非规范化可能出现的问题
        冗余数据: Same properties are duplicate in multiple tables
        插入异常: Can not insert a record with only part of properties
        修改异常: Update only one record of a entity while not all its records in database
        删除异常: Deleted another related entity when delete a record
    索引
        索引失效
    外键
数据库对象
    表
    视图
    存储过程
SQL查询
    单表查询
    查询条件
        Where
        [Not] Between And
        Is [Not] Null
        Like
            %: 0或多个任意字符
            _: 一个任意字符
            \: 对%_转义字符
    复杂查询
        嵌套查询
        表变量
        临时表
            索引
        [Outer|Cross] Apply
        [Not] Exists
    多表联合查询
        Left Join {} On {}
            Left Join excluding Inner Join
        Right Join {} On {}
            Left Join excluding Inner Join
        Full Outer Join {} On {}
            Full Outer Join excluding Inner Join
        Inner Join {} On {}
        Cross Join {} Where {}
        Self-Join*
    多数据源聚合
        Union
        Union All
    数据聚合
        Group By
            Having
        Distinct
        Count([Distinct])
        Max()
        Min()
        Sum()
        AVG()
    数据排序与截取
        Top {} Order By [Asc|Desc]
        Row_Number() Over(Partition By {} Order By {} [ASC|DESC])
    SQL函数
        GetDate()
        Convert()
SQL写入*
    Update
    Insert
    Delete
    Drop
    Truncate
高级*
    事务
        隔离级别
        一致性问题
    锁
        乐观锁
        悲观锁

    执行计划