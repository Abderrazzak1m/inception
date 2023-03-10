build:
	sudo docker-compose -f ./srcs/docker-compose.yml up  --build
down:
	sudo docker-compose -f ./srcs/docker-compose.yml down
rm_all:
	sudo docker-compose -f ./srcs/docker-compose.yml down  --rmi all  --volumes --remove-orphans && \
	sudo rm -rf /home/amiski/data/db/* && \
	sudo rm -rf /home/amiski/data/wordpress/* \
	
rebuild: down build

re: rm_all build
.PHONY: build down rm_all rebuild re
