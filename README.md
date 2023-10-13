# Environnement de développement Symfony 6

## Avec le Makefile
### Etape 1 construire l'environnement
> make build-env

### Etape 2 déployer symfony
> make sf-install

### Etape 3
Enjoy ;-)

------------------

## Sans le Makefile
### Etape 1 construire l'environnement
> docker-compose -p hack-oeil-symfony-dev -f ./.docker/docker-compose.yml up

### Etape 2 déployer symfony
> docker exec ho_symfony_6 composer install

### Etape 3
Enjoy ;-)