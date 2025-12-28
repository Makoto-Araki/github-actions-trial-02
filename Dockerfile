FROM python_base_image

# 作業ディレクトリ設定
WORKDIR /app

# パッケージ設定ファイルのコピー
COPY requirements.txt .

# 追加パッケージのインストール
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# アプリ本体をコピー
COPY . .

# アプリ実行
CMD ["python", "main.py"]
