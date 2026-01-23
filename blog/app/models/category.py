# app/models/category.py
from datetime import datetime
from app.extensions import db

class Category(db.Model):
    __tablename__ = 'category'

    id = db.Column(db.Integer, primary_key=True, comment='主键id')
    name = db.Column(db.String(64), comment='分类名称')
    description = db.Column(db.String(128), comment='分类描述')
    status = db.Column(
        db.SmallInteger,  # 对应MySQL的TINYINT
        server_default='1',
        comment='是否启用(0-未启用;1-启用)'
    )
    create_time = db.Column(
        db.DateTime,
        server_default=db.func.now(),
        comment='创建时间'
    )
    update_time = db.Column(
        db.DateTime,
        server_default=db.func.now(),
        onupdate=db.func.now(),
        comment='修改时间'
    )

    def __repr__(self):
        return f'<Category {self.name}>'