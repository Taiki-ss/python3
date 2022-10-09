a# Version
Python:3.10.x  

# Tips
pythonの実行はコンテナ上で行う。
```
# 実行例
docker compose exec python3 bash
python ~
```

### フォーマッターおよびリンター
当コンテナ共通でPEP8準拠の自動整形およびチェックが実行される。  
使用ライブラリは「autopep8」と「flake8」。

## Python用ライブラリ管理について
コンテナには直接ライブラリをインストールしない（pipのみインストール）
コンテナ内の`/usr/html`直下にPythonを使用したいプロジェクトのリポジトリをcloneするが、
基本はそのリポジトリごとにライブラリを指定し運用する。


### 【初回作業】
リポジトリ直下に`requirements.txt`というファイルを置く。
デフォルトセットで作成したければ下記コマンドで作成できる。
```
pip freeze > requirements.txt
```

#### 記載例（radical）
```
autopep8==1.7.0
flake8==5.0.4
mccabe==0.7.0
pycodestyle==2.9.1
pyflakes==2.5.0
toml==0.10.2
google-cloud-storage==2.5.0
google-cloud-bigquery==3.3.2
```

cloneしたリポジトリ上（コンテナに入った上で）で
```
# .venv作成（.gitignoreに入れてね）
python -m venv .venv
# venv環境に入る
source .venv/bin/activate
# 必要なライブラリをインストール
pip install -r requirements.txt
```
ライブラリ変更したいときはrequirements.txtを書き換えて同じようにやる。

### 【使用時（2回目以降）】
同様にcloneしたリポジトリ上（コンテナに入った上で）で
```
# venv環境に入る
source .venv/bin/activate
# 上記のエイリアス
va
```

この状態でpyファイルを実行すればライブラリが有効化されている。
