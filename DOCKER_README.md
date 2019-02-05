# Docker Rails

DockerでRailsを動かす環境をローカルで構築するためだけのリポジトリです。
DBはMySQLです。


## Step

.sampleファイルを変更

```
Gemfile.sample → Gemfile
Gemfile.lock.sample → Gemfile.lock
```

DockerボリュームにRailsアプリを作成

```
docker-compose run web bundle exec rails new . --force --database=mysql --skip-bundle
```

`config/database.yml` にてdbの設定を変更(以下は例)

```yml
default: &default
  adapter: mysql2
  encoding: utf8mb4
  collation: utf8mb4_bin
  pool: <%= ENV['MAX_THREAD'] || 5 %>
  username: <%= ENV['DB_USERNAME'] || 'root' %>
  password: <%= ENV['DB_PASSWORD'] %>
  database: <%= ENV['DB_DBNAME'] %>
  host: <%= ENV['DB_HOST'] || 'db' %>
  port: <%= ENV['DB_PORT'] || 3306 %>

development:
  <<: *default
  database: app_develop

test:
  <<: *default
  database: app_test

production:
  <<: *default
```

コンテナをbuild

```
docker-compose build
```

RailsのDB設定

```
docker-compose run web bin/rails db:setup
```

バックグウンドでコンテナを作成+起動

```
docker-compose up -d
```

http://localhost:3000 にアクセスして動作を確認


## コマンド

コンテナ停止+削除

```
docker-compose down
```


## 参考

- [DockerでRuby on Railsの開発をしよう](https://qiita.com/saitoeku3/items/b1aa2ae143624e551aea)
