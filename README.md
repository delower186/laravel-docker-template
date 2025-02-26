# laravelDockerTemplate

## Configuration
Find the configuration options bellow:

1. Change mysql root password in .env file (default is password)
2. Change service name (your laravel project name)
3. Change PHP image version (if you want, default is 8.4.3-apache)
4. Run ``` make setup ``` if you just cloned the repository ``` laravel-docker ```
5. Run ``` make setup-from-scratch ``` if you cloned ``` laravel-docker-template ```
6. Run command ``` make build ``` if you want to build image
7. Run command ``` make stop ``` to stop container or service
8. Run command ``` make up  ``` to start container
9. Run command ``` make install-laravel-app ``` to install fresh laravel in ``` laravel-app ``` directory
10. Run command ``` make composer-update ``` to install laravel dependencies
11. Run command ``` make migrate ``` to migrate laravel migrations
12. Run command ``` make seed ``` to seed laravel databases
13. Rum command ``` make composer command='composercommand' ``` to run composer commands in docker container, for example ``` make composer command='update' ``` and it will run ``` composer update``` command
14. Rum command ``` make npm command='npmcommand' ``` to run npm commands in docker container, for example ``` make npm command='--help' ``` and it will run ``` npm --help ``` command
15. Run command ``` make controller name='controller name' flags='use flags' ``` to create laravel controller in docker container, for example ``` make controller name='AdminController' flags='--resource' ``` will create AdminController.php resource controller
15. Run command ``` make model name='model name' flags='use flags' ``` to create laravel controller in docker container, for example ``` make controller name='Admin' flags='-m' ``` will create Admin.php model with migration
15. Run command ``` make migration name='controller name' flags='use flags' ``` to create laravel controller in docker container, for example ``` make migration name='admin_migration' flags='--table=Admin' ``` will create admin_migration migration with table Admin
15. Run command ``` make artisan command='artisancommand' ``` to run artisan command in docker container, for example ``` make artisan command='migrate' ``` will run ``` php artisan migrate ```


## Contact Me
| Portfolio | Link |
| ------ | ------ |
| Upwork | https://www.upwork.com/freelancers/delower |
| GitHub | https://github.com/delower186 |