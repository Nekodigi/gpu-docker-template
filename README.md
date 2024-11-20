# GPU Docker Template

GPU サーバーで簡単に利用できる Docker 環境です。

- [GPU Docker Template](#gpu-docker-template)
  - [1 レポジトリ構成](#1-レポジトリ構成)
    - [1.1 ファイル解説](#11-ファイル解説)
    - [1.2 インストール済ライブラリ一覧](#12-インストール済ライブラリ一覧)
      - [ベースイメージ](#ベースイメージ)
      - [Linux コマンド](#linux-コマンド)
      - [Python ライブラリ](#python-ライブラリ)
      - [動作デモ](#動作デモ)
  - [2 利用方法](#2-利用方法)
    - [2.1 初期設定](#21-初期設定)
    - [2.2 Docker 環境を新たに作る場合](#22-docker-環境を新たに作る場合)
    - [2.3 Pytorch のバージョンを変更したい場合](#23-pytorch-のバージョンを変更したい場合)
  - [3 トラブルシューティング](#3-トラブルシューティング)
    - [3.1 既知の問題](#31-既知の問題)
    - [3.2 新たな問題](#32-新たな問題)
  - [4 参考資料](#4-参考資料)

## 1 レポジトリ構成

### 1.1 ファイル解説

```sh
/all-in-one  #nekodigi/gpu_essentialsに機能を追加したベースイメージ(現状未使用)
/essential(nekodigi/gpu_essentials)  #ベースイメージ(nekodigi/gpu_essentials)をビルドするためのコード。
#通常使用では、この中身を理解する必要はないが、全く異なるバージョンのpytorchを使いたい場合は、このコードをもとに、一からDockerイメージを作成すること

#以下のファイルは、環境設定の際に一度だけ使う
- /env.sh #環境変数を**ユーザ**が記入するファイル。のちの.shファイルで参照
- /local.sh #VDIから実行する。
- /setup.sh #local.shによってGPUサーバーにコピーされ、サーバー上で実行される
- /test.sh #setup.shによって設定が正しく行われたか検証(GPUサーバ側)
- /utils.sh #(未使用)


/example  #!!!!基本的にこのディレクトリのみを使う。nekodigi/gpu_essentialsをベースとし
- /requirements.txt #インストールするライブラリを記述
- /docker-compose.yml #GPU割り当て数の資源割り当て、ローカルのフォルダをDockerにマウントするために使用
- /.devcontainer/devcontainer.json #Docker内のVscodeにインストールされる拡張機能を指定
```

### 1.2 インストール済ライブラリ一覧

#### ベースイメージ

nvcr.io/nvidia/pytorch:24.01-py3
※Tensorflow(2.15.0)も導入済

#### Linux コマンド

- wget, curl, bzip2, build-essential, git, fzf, git-lfs, ca-certificates, libsndfile1-dev, libgl1, libx11-6, unzip
- oh my zsh **多機能 Linux コマンドプロンプト**

#### Python ライブラリ

- tensorflow[and-cuda]
-
- lightning, matplotlib, datasets, transformers, hydra-core, rich, einops, faiss-gpu, psutil, ema_pytorch, denoising_diffusion_pytorch 　**ライブラリ**
- black, ruff, isort, mypy, pydocstyle, pytest, pytest-cov **フォーマット/テスト**
- gpustat, thefuck **Linux 用コマンド**

#### 動作デモ

- https://github.com/Lightning-AI/tutorials.git **環境構築の成功検証用**

## 2 利用方法

### 2.1 初期設定

※GPU サーバー・スターターキットを参照

### 2.2 Docker 環境を新たに作る場合

- /example の中身をコピーする  
  以下の個所を修正する。(任意)
  - docker-compose.yaml
    - container_name: [一意に定まる名前に]
    - volumes: - [[ローカルでのpath]:[Docker内でのpath]]
      - root フォルダ以外の PC 内のフォルダを Docker 内からアクセスする場合必要
      - (例)- /data1/shared:/shared
  - requirements.txt #python のライブラリを追加したい場合は追記する
  - Dockerfile
    - RUN [Docker 内で実行したいコマンド] #Docker 内にライブラリをインストールする場合に利用。sudo は必要ない
  - .decvontainer/devcontainer.json
    - "name": "[vscode での表示名]",
- Docker に入った状態なら"Rebuild Container"を Vscode で実行することで初めて、変更が反映されます。この時、マウントされていない Docker 内のみに存在するファイルは全てリセットされます。

### 2.3 Pytorch のバージョンを変更したい場合

nekodigi/gpu_essentials にインストールされているライブラリのバージョンを変更したい場合は、一から Docker イメージをビルドする必要があります。  
/essential の中身を参考にしてください・

## 3 トラブルシューティング

### 3.1 既知の問題

※GPU サーバー・スターターキットを参照

### 3.2 新たな問題

※GPU サーバー・スターターキットにコメント又は、Github に issue を立てて報告すること

## 4 参考資料

※GPU サーバー・スターターキット又は、旧:GPU サーバー環境構築を参照
