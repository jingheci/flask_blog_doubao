from datetime import datetime
from flask_sqlalchemy import SQLAlchemy

from app.extensions import db


class Diary(db.Model):
    __tablename__ = 'diary'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    content = db.Column(db.Text, nullable=False)
    create_time = db.Column(db.DateTime, default=datetime.now)
    update_time = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)
    mood = db.Column(db.String(20))
    weather = db.Column(db.String(20))
    is_private = db.Column(db.Boolean, default=True)

    def __repr__(self):
        return f'<Diary {self.title}>'