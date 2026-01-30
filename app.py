
from app import create_app

app = create_app()



if __name__ == '__main__':
    app.run(debug=True)  # 生产环境应设为 debug=False
#test