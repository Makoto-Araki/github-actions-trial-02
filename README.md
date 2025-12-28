# github-actions-trial-02 (Github Actions 試作02)

## 前提条件
- リモートリポジトリ作成済

## 処理概要
- CI/CDの改善のためGithub Actionsの動作確認

## 環境構築
### ローカルリポジトリ作成
```bash
## ディレクトリ作成
$ cd ~
$ mkdir github-actions-trial-02

## ローカルリポジトリ初期化
$ cd github-actions-trial-02
$ git init

## ローカルリポジトリ初期設定 
$ git config --global user.email (自分のメールアドレス)
$ git config --global user.name Makoto-Araki

## 基本イメージ用のDockerfile作成
$ cd github-actions-trial-02
$ vi Dockerfile_Base_Image

## アプリイメージ用のDockerfile作成
$ cd github-actions-trial-02
$ vi Dockerfile

## ソース記述(スケルトン部分)
$ cd github-actions-trial-02
$ vi main.py

## パッケージ情報
$ cd github-actions-trial-02
$ vi requirements.txt

## バージョン情報
$ cd github-actions-trial-02
$ vi VERSIONS.txt

## バージョン情報の展開
$ cd github-actions-trial-02
$ export $(grep -v '^#' VERSIONS.txt)

## 基本イメージのビルド
$ cd github-actions-trial-02
$ docker build --no-cache -t python_base_image -f Dockerfile_Base_Image .

## アプリイメージのビルド
$ cd github-actions-trial-02
$ docker build --no-cache -t github-actions-trial-02_image:$(echo $PYTHON_APP_IMAGE_VERSION) .

## VSCode起動
$ cd github-actions-trial-02
$ code .

## ソース記述(開発作業)
$ cd github-actions-trial-02
$ vi main.py
```

### 本番環境
```bash
## 基本イメージのビルド ※初回のみ
$ cd github-actions-trial-02
$ docker build --no-cache -t makotoaraki346/python_base_image -f Dockerfile_Base_Image .

## 基本イメージをDockerhubへプッシュ ※初回のみ
$ cd github-actions-trial-02
$ docker push makotoaraki346/python_base_image

## バージョン情報の展開
$ cd github-actions-trial-02
$ export $(grep -v '^#' VERSIONS.txt)


```
