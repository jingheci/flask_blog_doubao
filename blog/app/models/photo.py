# app/models/category.py
from datetime import datetime
from app.extensions import db

class Photo(db.Model):
    __tablename__ = 'photo'

    id = db.Column(db.Integer, primary_key=True, comment='主键id')
    title = db.Column(db.String(128), comment='标题')
    description = db.Column(db.String(256), comment='描述')
    image_url = db.Column(db.String(256), comment='路径')

    def __repr__(self):
        return f'<Photo {self.title}>'