# python3
python3用のDocker環境

## 実行方法
下記コマンドでコンテナに入ってからpython実行する
```
docker compose exec python3 bash
```

## Jupyter-lab

```
docker run -v $PWD/opt:/root/opt -w /root/opt -it --rm -p 7777:8888 python3_python3 jupyter-lab --ip 0.0.0.0 --allow-root -b localhost
```
この場合、アクセスできるURLは
http://localhost:7777