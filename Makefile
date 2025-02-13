setup:
	@make build
	@make up
	@make composer-update

setup-from-scratch:
	@make setup
	@make install-laravel


build:
	docker-compose build --no-cache --force-rm

down:
	docker-compose stop

up:
	docker-compose up -d

install-laravel:
	docker exec laravel-docker bash -c "cd /var/www/html"
	docker exec laravel-docker bash -c "composer create-project laravel/laravel ."
	docker exec laravel-docker bash -c "chown -R www-data:www-data /var/www/html"

run-app:
	powershell -Command "start http://localhost:9000/public"

composer-update:
	docker exec laravel-docker bash -c "composer update"

migrate:
	docker exec laravel-docker bash -c "php artisan migrate"

seed:
	docker exec laravel-docker bash -c "php artisan db:seed"

# Composer command "make composer command='composercommand'"
composer:
	docker exec laravel-docker bash -c "composer $(command)"

npm:
	docker exec laravel-docker bash -c "npm $(command)"


# Define variables
name =
flags =
command=

# Generate Controller using this command "make name=controllerName flags=-"
# flags { resource = --resource or -r, api = --api, model binding = --model=modelName,  route model binding = --parent=ModelName}
controller:
	docker exec laravel-docker bash -c "php artisan make:controller $(name) $(flags)"

# Generate model using this command "make model name=modelName flags=-"
# flags {migration = --migration or -m, controller= --controller or -c, resource = --resource or -r, migration + controller + resource = --migration --controller --resource or -mcr}
model:
	docker exec laravel-docker bash -c "php artisan make:model $(name) $(flags)"

# Generate migration using this command "make migration name=migrationName flags=-"
migration:
	docker exec laravel-docker bash -c "php artisan make:migration $(name) $(flags)"

# Custom artisan command "make artisan command='artisanCommand'"
artisan:
	docker exec laravel-docker bash -c "php artisan $(command)"