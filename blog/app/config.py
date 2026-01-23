import os

class Config:
    # 通用配置
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'dev-secret-key'
    SQLALCHEMY_TRACK_MODIFICATIONS = False  # 关闭修改跟踪（节省资源）

class DevelopmentConfig(Config):
    # 开发环境配置
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:root@localhost:3306/db_blog'
    # 格式说明：mysql+pymysql://用户名:密码@主机地址/数据库名

class ProductionConfig(Config):
    # 生产环境配置（建议从环境变量读取敏感信息）
    # SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL') or \
    #                           'mysql+pymysql://prod_user:prod_pass@db_host/prod_db'
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:root@localhost:3306/db_blog'