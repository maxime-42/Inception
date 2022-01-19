NAME		=	inception

all		: 	$(NAME)

$(NAME)		:
				docker-compose -f srcs/docker-compose.yaml up --force-recreate --build

install		:
				docker-compose -f srcs/docker-compose.yaml up --force-recreate --build

clean		:	
				docker-compose -f srcs/docker-compose.yaml down 

fclean		:	clean
				rm -rf /home/mkayumba
				sudo docker rm -f $(docker ps -aq); sudo docker rmi -f $(docker images -q); docker builder prune; 

.PHONY		:	all clean_host clean fclean