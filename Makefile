current-dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))


start:
	@if [ ! -f .env.local ]; then echo '' > .env.local; fi
	UID=${shell id -u} GID=${shell id -g} docker compose up --build -d
	make clean-cache

clean-cache:
	@rm -rf apps/*/*/var
	@docker exec php bin/console cache:warmup
