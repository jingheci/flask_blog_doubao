# # 扩展初始化（如数据库）


from flask_sqlalchemy import SQLAlchemy

# 创建 SQLAlchemy 实例（延迟初始化）
db = SQLAlchemy()