.PHONY: create-networks
create-networks:
	docker network create frontend
	docker network create backend
