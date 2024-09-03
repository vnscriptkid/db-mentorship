up:
	docker compose up -d

down:
	docker compose down --volumes --remove-orphans

cli:
	docker compose exec -it mongo mongosh

sh:
	docker compose exec -it mongo bash
