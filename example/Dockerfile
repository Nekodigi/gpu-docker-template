#このDocker Imageの内容を引き継ぐ https://github.com/Nekodigi/gpu-docker-template/blob/main/essential/Dockerfile
FROM nekodigi/gpu_essentials

WORKDIR /app

COPY requirements.txt requirements.txt
# requirements.txtに記載されたPythonライブラリをインストール
RUN pip3 install -r requirements.txt
# linuxのパッケージをインストールしたい場合
# (例)RUN apt-get update && apt-get install -y ffmpeg