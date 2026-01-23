# app/__init__.py
from flask import Flask
from .config import DevelopmentConfig, ProductionConfig
from .extensions import db





def create_app(config_class=DevelopmentConfig):
    # 创建应用实例（使用默认模板/静态文件路径）
    app = Flask(__name__)

    app.config.from_object(config_class)
    # 初始化扩展
    db.init_app(app)

    # 基础配置（可直接写在配置类中）
    app.config.update(
        SECRET_KEY='your-dev-secret-key',
        # 其他必要配置...
    )

    # 注册蓝图（从routes包批量导入）
    from app.routes.home import home_bp
    from app.routes.admin import admin_bp
    app.register_blueprint(home_bp)
    app.register_blueprint(admin_bp)


    return app