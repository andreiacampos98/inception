# Define default directory path and hostname
DIR_PATH ?= /home/anaraujo/data

all: up

# Create necessary directories for MariaDB and WordPress data
dir:
	sudo mkdir -p $(DIR_PATH)
	sudo mkdir -p $(DIR_PATH)/mariadb
	sudo mkdir -p $(DIR_PATH)/wordpress

# Creates my network
network:
	docker network create inception

# Stop and remove containers
down:
	docker compose -f srcs/docker-compose.yml down

# Bring up Docker containers defined in srcs/docker-compose.yml
up: dir
	@sudo grep -Fq "anaraujo.42.fr" /etc/hosts || sudo sed -i '/127\.0\.0\.1/ s/$$/ anaraujo.42.fr/' /etc/hosts
	docker compose -f srcs/docker-compose.yml up --build -d

# Provide interactive access to the shell inside the Nginx container
nginx:
	docker exec -it nginx bash

# Provide interactive access to the shell inside the WordPress container
wp:
	docker exec -it wordpress bash

# Provide interactive access to the shell inside the MariaDB container
maria:
	docker exec -it mariadb bash

# List running Docker containers
ps:
	docker ps

# Stop and remove containers, remove images, volumes, and networks
clean: down
	-@docker images -qa | xargs docker rm -f
	-@docker stop $(docker ps -qa)
	-@docker rm $(docker ps -qa)
	-@docker volume rm wordpress_data -f
	-@docker volume rm mariadb_data -f
	-@docker network ls -q | xargs docker network rm

# Clean everything, including unused Docker objects and remove ~/data directory
fclean: clean
	@docker system prune -af
	@sudo rm -rf $(DIR_PATH)
	@sudo grep -Fq " anaraujo.42.fr" /etc/hosts && sudo sed -i 's/ anaraujo.42.fr//g' /etc/hosts

# Remove everything and then bring the containers back up
re: fclean up

.PHONY: all re clean fclean wp maria ps dir down up nginx
