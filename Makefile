# 既にlaravelのファイルがある場合の初期インストール
install:
	docker-compose build
	docker-compose up -d
	docker-compose exec php composer install
	docker-compose exec php php artisan migrate
	docker-compose exec php php artisan key:generate
	docker-compose exec php php artisan db:seed

# 初期状態の時に実行する。（laravelのファイルがない）
laravel:
	docker-compose build
	docker-compose up -d
	docker-compose exec php composer create-project laravel/laravel example_app
	docker-compose exec php mv example_app/* ./
	docker-compose exec php rm -rf ./example_app/

# 初期状態の時に実行。
setup:
	docker-compose exec php cp .env.example .env
	docker-compose exec php php artisan migrate
	docker-compose exec php php artisan key:generate
	docker-compose exec php php artisan db:seed

build:
	docker-compose build

up:
	docker-compose up

upd:
	docker-compose up -d

down:
	docker-compose down

start:
	docker-compose start

stop:
	docker-compose stop

restart:
	docker-compose down
	docker-compose up -d

migrate:
	docker-compose exec php php artisan migrate

seed:
	docker-compose exec php php artisan db:seed

re-seed:
	docker-compose exec php php artisan migrate:refresh
	docker-compose exec php php artisan db:seed

refresh:
	docker-compose exec php php artisan migrate:refresh

reset:
	docker-compose exec php php artisan migrate:reset

rollback:
	docker-compose exec php php artisan migrate:rollback

db:
	docker-compose exec db psql -d laravel_development -U docker

ps:
	docker-compose ps

psa:
	docker-compose ps -a

image:
	docker-compose images

tinker:
	docker-compose exec php php artisan tinker

cache:
	docker-compose exec php php artisan cache:clear
	docker-compose exec php php artisan config:clear
	docker-compose exec php php artisan route:clear

list:
	docker-compose exec php php artisan route:list

mix:
	dc run node npm run dev

npm-install:
	dc run node npm install
