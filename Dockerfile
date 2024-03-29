#dockerイメージを指定。
FROM python:3.8-slim
RUN apt-get -y update && apt-get -y upgrade

ENV PYTHONUNBUFFERED True
RUN pip install --upgrade pip

#コンテナ内での作業ディレクトリを指定。
WORKDIR /app

RUN mkdir app
#main.pyを/root/appに以下にコピー。
COPY app/main.py app/
#requirements.txtをコンテナ内のroot配下にコピー。
COPY requirements.txt requirements.txt
# コンテナ起動時にモジュールをインストール。
RUN pip install -r requirements.txt

EXPOSE 8080
ENV PORT 8080

#コンテナ起動時に実行するコマンドを指定。
ENTRYPOINT ["uvicorn", "app.main:app", "--reload", "--host", "0.0.0.0", "--port", "8080", "--workers", "1"]
