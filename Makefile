# Commande pour lancer Docker Compose
build-env:
	docker-compose -p hack-oeil-symfony-dev -f ./.docker/docker-compose.yml up
	exit
    
# Commande pour installer symfony
sf-install:
	docker exec ho_symfony_6 composer install



.PHONY: build-env symfony-install