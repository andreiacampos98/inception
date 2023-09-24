# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: andreia <andreia@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/24 10:17:39 by andreia           #+#    #+#              #
#    Updated: 2023/09/24 15:03:41 by andreia          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: 
	docker-compose -f ./srcs/docker-compose.yml up -d --build 

#Create and build all the containers and they still run in the background
#Use the -f flag to specify the location of a Compose configuration file.
#-d run the container in background

down:
	docker-compose down

#destroy all your ressources

clean:
	docker compose stop $(docker ps -a -q)
#allow to delete all the opened images
	docker rm $(docker ps -a -q)

fclean:
	
re:	fclean all

.PHONY: all re down clean
