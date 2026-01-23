from flask import Blueprint,render_template



admin_bp = Blueprint('admin',__name__)

@admin_bp.route('/admin')
def admin():
    return render_template('admin/index.html')


@admin_bp.route('/admin/category')
def category():
    return render_template('admin/category.html')


@admin_bp.route('/admin/article')
def article():
    return render_template('admin/article.html')


@admin_bp.route('/admin/add_article')
def add_article():
    return render_template('admin/article_add.html')