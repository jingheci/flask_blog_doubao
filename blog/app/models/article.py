# app/models/article.py
from datetime import datetime
from app.extensions import db

class Article(db.Model):
    __tablename__ = 'article'

    id = db.Column(db.Integer, primary_key=True, comment='主键id')
    title = db.Column(db.String(256), comment='文章标题')
    keyword = db.Column(db.String(128), comment='关键字')
    author = db.Column(db.String(32), comment='作者姓名')
    content = db.Column(db.Text, comment='文章内容')
    category_id = db.Column(db.Integer,comment='文章所属分类的id')
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
    delete_flag = db.Column(
        db.SmallInteger,  # 对应MySQL的TINYINT
        server_default='0',
        comment='删除标记(0-未删除;1-已删除)'
    )

    # 关系定义
    # category = db.relationship(
    #     'Category',
    #     backref=db.backref('articles', lazy='dynamic')
    # )

    def __repr__(self):
        return f'<Article {self.title}>'

    def to_dict(self):
        return {
            'id': self.id,
            'title': self.title,
            'keyword': self.keyword,
            'content': self.content
        }