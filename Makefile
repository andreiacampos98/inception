# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anaraujo <anaraujo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/24 10:17:39 by andreia           #+#    #+#              #
#    Updated: 2023/09/27 19:15:00 by anaraujo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: build up

build:
	mkdir -p /home/anaraujo/data/mariadb_data /home/anaraujo/data/wordpress_data
	@sudo grep -Fq "anaraujo.42.fr" /etc/hosts || sudo sed -i '/127\.0\.0\.1/ s/$$/ anaraujo.42.fr/' /etc/hosts
#se -i - performedits in-place by overwritting the original file
up: build
	@docker-compose -f ./srcs/docker-compose.yml up -d --build 

#Create and build all the containers and they still run in the background
#Use the -f flag to specify the location of a Compose configuration file.
#-d run the container in background

down:
	@docker-compose -f ./srcs/docker-compose.yml down

start:
	@docker-compose -f ./srcs/docker-compose.yml start

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

ps:
	@docker-compose -f ./srcs/docker-compose.yml ps

rm: stop
	@docker-compose -f ./srcs/docker-compose.yml rm

del_volumes:
	@docker-compose -f ./srcs/docker-compose.yml down --volumes
	@sudo rm -rf /home/anaraujo/data

del:
	@docker system prune
#elimina tudo o que nao esta a ser usado


re:	fclean all ps
clean: stop rm
fclean: clean del_volumes del
	@sudo grep -Fq " anaraujo.42.fr" /etc/hosts && sudo sed -i 's/ anaraujo.42.fr' etc/hosts

.PHONY: all re down clean
