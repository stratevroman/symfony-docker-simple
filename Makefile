DOCKER_COMPOSE_FILE = docker-compose.yaml
PHP_CONTAINER = hackaton_php_1

DOCKER_COMPOSE = docker-compose -f $(DOCKER_COMPOSE_FILE) exec

start-with-dev-env: docker-build down up composer-install env-dev fresh-db migrate

up:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

docker-build:
	docker-compose -f $(DOCKER_COMPOSE_FILE) build

run-tests: build-test run-test

env-dev:
	$(DOCKER_COMPOSE) php composer symfony:dump-env dev

build-test:
	$(DOCKER_COMPOSE) php vendor/bin/codecept build

run-test:
	docker-compose -f $(DOCKER_COMPOSE_FILE) exec -T --user $(USER_ID):$(USER_GROUP) php vendor/bin/codecept run

composer-install:
	$(DOCKER_COMPOSE) php composer install

fresh-db: drop-db create-db

drop-db:
	$(DOCKER_COMPOSE) php bin/console doctrine:database:drop --force

create-db:
	$(DOCKER_COMPOSE) php bin/console doctrine:database:create

migrate:
	$(DOCKER_COMPOSE) php bin/console --no-interaction doctrine:migrations:migrate

load-fixtures:
	$(DOCKER_COMPOSE) php bin/console --no-interaction doctrine:fixtures:load

composer-require:
	$(DOCKER_COMPOSE) php composer require symfony/orm-pack
