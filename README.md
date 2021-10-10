# laravel一気にアップするdockerサンプル

laravelの環境をdockerで用意しました。

## 初回構築
```
git clone https://github.com/yabukichi/laravel-docker
cd ./laravel-docker/server
cp .env.example .env
cd ..
make install
```

## 運用中に使いそうなコマンド

docker起動
```
make up (docker-compose up)
```

dockerイメージを裏側で起動する。（デーモンで起動）
```
make upd (docker-compose up -d)
```

dockerイメージを停止・削除する。
```
make down (docker-compose down)
```

dockerイメージを削除せずに停止する。
```
make stop (docker-compose stop)
```

dockerイメージを再起動。停止（stop）した時に使う。
```
make stop (docker-compose start)
```
その他はmakefileに記載

### よく使うコマンドlaravel
【UserControllerをコントローラー名に。】
php artisan make:controller UserController

dc exec php php artisan route:list

【UserSeederをシーダー名に。】
php artisan db:seed --class=UserSeeder 

ER図の開き方
open schema/index.html

ER作成コマンド（ER図の更新時に使用）
docker run -v "$PWD/schema:/output" --net="host" schemaspy/schemaspy:6.1.0 -t pgsql -host db -db laravel_development -u docker -p docker