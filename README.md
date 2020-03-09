# 開発環境準備
1. Dockerをインストール
2. リポジトリをクローン
3. setup.sh
以下のコマンドでDocker Imageをビルドします。
```
$ ./setup.sh
```

4. サーバーを立ち上げる
```
$ docker-compose up
```

### 困ったら
#### yarn installしたい
```
$ docker-compose run web yarn install
```

#### DBを作成したい
```
$ docker-compose run web rails db:create
```

#### Migrationしたい
```
$ docker-compose run web rails db:migrate
```

