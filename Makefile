setup:
	@make build
	@make up
	@make composer-update

setup-from-scratch:
	@make setup
	@make install-laravel


build:
	docker-compose build --no-cache --force-rm

stop:
	docker-compose stop

up:
	docker-compose up -d

install-laravel:
	docker exec laravel-docker bash -c "cd /var/www/html"
	docker exec laravel-docker bash -c "composer create-project laravel/laravel ."
	docker exec laravel-docker bash -c "chown -R www-data:www-data /var/www/html"

run-laravel-app:
	docker exec laravel-docker bash -c "cd /var/www/html"
	docker exec laravel-docker bash -c "php artisan serve"

composer-update:
	docker exec laravel-docker bash -c "composer update"

migrate:
	docker exec laravel-docker bash -c "php artisan migrate"

seed:
	docker exec laravel-docker bash -c "php artisan db:seed"