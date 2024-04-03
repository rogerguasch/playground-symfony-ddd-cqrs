current-dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))


start:
	docker compose up -d
	make clean-cache

build:
	@if [ ! -f .env.local ]; then echo '' > .env.local; fi
	UID=${shell id -u} GID=${shell id -g} docker compose up --build -d
	make composer-install
	make clean-cache

composer-install:
	@docker exec php composer install

clean-cache:
	@rm -rf apps/*/*/var
	@docker exec php bin/console cache:warmup

deploy:
	@serverless deploy
