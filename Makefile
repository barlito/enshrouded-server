stack_name=enshrouded

app_container_id = $(shell docker ps --filter name="$(stack_name)" -q)

.PHONY: bash
bash:
	docker exec -it -u root $(app_container_id) bash

.PHONY: deploy
deploy:
	sudo chown -R 10000:10000 ./enshrouded
	docker-compose up -d

.PHONY: undeploy
undeploy:
	docker-compose down

.PHONY: restart
restart:
	make undeploy
	make deploy

.PHONY: logs
logs:
	docker-compose logs -f
