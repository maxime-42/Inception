NAME = Inception

all: prune reload

stop:
	@ docker-compose -f srcs/docker-compose.yml down

clean:
	@ docker-compose -f srcs/docker-compose.yml down --volumes --rmi all

prune: clean
	@ docker system prune -f

reload: 
	@ docker-compose -f srcs/docker-compose.yml up --build

.PHONY: linux stop clean prune reload all