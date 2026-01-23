from flask import Blueprint, render_template, jsonify, request
from sqlalchemy import or_, and_

from app.models.diary import Diary
from app.models.article import Article
from app.models.category import Category
from app.models.photo import Photo

home_bp = Blueprint('home',__name__)

# 首页
@home_bp.route('/')
def index():
    #博客列表
    article_list = Article.query.all()
    #分类列表
    category_list = Category.query.all()
    #左侧相册
    photo_list = Photo.query.limit(6)
    return render_template('home/index.html',
                           article_list=article_list,
                           category_list=category_list,
                           photo_list = photo_list)

@home_bp.route('/photos',methods=['get'])
def photos():
    photo_list = Photo.query.all()
    return render_template('home/photos.html',photo_list=photo_list)


@home_bp.route('/about')
def about():
    return render_template('home/about.html')


# 查询日记
@home_bp.route('/diaries', methods=['GET'])
def get_diaries():
    diaries = Diary.query.filter_by(is_private=False).order_by(Diary.create_time.desc()).all()
    return render_template('home/diary.html',diaries=diaries)


@home_bp.route('/search_article', methods=['GET'])
def search_article():
    # 博客列表
    kw = request.args.get("keyword")
    cate_id = request.args.get("cateId")
    print(kw,cate_id)
    # 构建动态查询条件
    conditions = []

    # 关键词搜索条件（OR逻辑）
    if kw:
        conditions.append(
            or_(
                Article.title.ilike(f"%{kw}%"),
                Article.keyword.ilike(f"%{kw}%"),
                Article.content.ilike(f"%{kw}%")
            )
        )

    # 分类过滤条件（AND逻辑）
    if cate_id and cate_id.isdigit():
        conditions.append(Article.category_id == int(cate_id))
        # 执行组合查询
    article_list = Article.query.filter(and_(*conditions))

    json_data = [article.to_dict() for article in article_list]  # 自动转换为字典
    print(json_data)
    return jsonify(json_data)



@home_bp.route('/diary/<int:id>', methods=['GET'])
def get_diary(id):
    diary = Diary.query.get_or_404(id)
    return jsonify({
        'title': diary.title,
        'content': diary.content,
        'create_time': diary.create_time.strftime('%Y-%m-%d %H:%M'),
        'mood': diary.mood,
        'weather': diary.weather
    })



