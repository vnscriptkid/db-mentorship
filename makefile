up:
	docker compose up -d

down:
	docker compose down --volumes --remove-orphans

cli:
	docker compose exec -it mongo mongosh
