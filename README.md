# github-actions-trial-02 (Github Actions 試作02)

## 前提条件
- リモートリポジトリ作成済

## 処理概要
- CI/CDの改善のためGithub Actionsの動作確認

## 環境構築
### ローカルリポジトリ
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

## アプリイメージ(開発用)のDockerfile作成
$ cd github-actions-trial-02
$ vi Dockerfile

## アプリイメージ(Github Actions用)のDockerfile作成
$ cd github-actions-trial-02
$ vi Dockerfile_Actions

## ソース記述(スケルトン部分)
$ cd github-actions-trial-02
$ vi main.py

## パッケージ情報
$ cd github-actions-trial-02
$ vi requirements.txt

## バージョン情報
$ cd github-actions-trial-02
$ vi VERSIONS.txt

## シェル上にバージョン情報の展開
$ cd github-actions-trial-02
$ export $(grep -v '^#' VERSIONS.txt)

## 基本イメージのビルド
$ cd github-actions-trial-02
$ docker build --no-cache -t python_base_image -f Dockerfile_Base_Image .

## アプリイメージ(開発用)のビルド
$ cd github-actions-trial-02
$ docker build --no-cache -t github-actions-trial-02_image:$(echo $PYTHON_APP_IMAGE_VERSION) .

## VSCode起動
$ cd github-actions-trial-02
$ code .

## ソース記述(開発作業)
$ cd github-actions-trial-02
$ vi main.py
```

### Dockerhub 準備
#### Account Settings に遷移
![github_actions_01](images/github_actions_01.png)

#### Personal Access Token (PTA) の画面に遷移
![github_actions_02](images/github_actions_02.png)

#### Generate New Token をクリック
![github_actions_03](images/github_actions_03.png)

#### Personal Access Token (PTA) の情報を入力後に Generate で生成
![github_actions_04](images/github_actions_04.png)

#### Personal Access Token (PTA) のアクセスコードが表示されるので Copy でクリップボード保存後に戻る
![github_actions_05](images/github_actions_05.png)

#### Personal Access Token (PTA) の生成を確認
![github_actions_06](images/github_actions_06.png)

### Github 準備
#### Settings に遷移
![github_actions_07](images/github_actions_07.png)

#### Secrets and Variables に遷移
![github_actions_08](images/github_actions_08.png)

#### Actions を選択
![github_actions_09](images/github_actions_09.png)

#### New repository secret を押下
![github_actions_10](images/github_actions_10.png)

#### Github Actions 用の secret 入力画面が表示
![github_actions_11](images/github_actions_11.png)

#### Github Actions 用の secret 入力１
![github_actions_12](images/github_actions_12.png)

#### Github Actions 用の secret 入力２ ※クリップボード保存の Dockerhub PAT アクセスコードを入力
![github_actions_13](images/github_actions_13.png)

#### Repository Secret の登録確認
![github_actions_14](images/github_actions_14.png)

### Github Actions 動作開始
```bash
## バージョン情報の更新
$ cd github-actions-trial-02
$ vi VERSIONS.txt

## バージョン情報の展開
$ cd github-actions-trial-02
$ export $(grep -v '^#' VERSIONS.txt)

## Github にプッシュ
$ cd github-actions-trial-02
$ git add .
$ git commit -m VERSION更新_2025122_01
$ git push origin main
```
