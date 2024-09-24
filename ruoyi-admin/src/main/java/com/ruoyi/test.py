#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import pymysql

# 打开数据库连接
db = pymysql.connect(
    host="115.159.78.193",  # 数据库服务器地址
    user="device",  # 数据库用户名
    passwd="Device!@1234",  # 用户密码
    db="device",  # 数据库名称
    port=3306,  # MySQL默认端口
    charset="utf8"  # 设置字符集
)

# 使用 cursor() 方法创建一个游标对象 cursor
cursor = db.cursor()

# 使用 execute() 方法执行 SQL 查询
cursor.execute("SELECT VERSION()")

# 使用 fetchone() 方法获取单条数据
data = cursor.fetchone()

print("Database version : %s" % data)

# 关闭数据库连接
db.close()
