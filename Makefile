all:
ifeq (,$(wildcard /home/acousini/data/mysql))
	@echo "Creating data folders..."
	@sudo mkdir -p /home/acousini/data/mysql
	@sudo mkdir -p /home/acousini/data/html
	@sudo chmod 777 /home/acousini/data/mysql
	@sudo chmod 777 /home/acousini/data/html
endif
	@echo "Starting Inception..."
	@sleep 1
	@sudo docker-compose -f srcs/docker-compose.yml up -d --build

re: fclean all

stop:
	@sudo docker-compose -f srcs/docker-compose.yml stop


clean: stop
	@sudo docker-compose -f srcs/docker-compose.yml down -v

fclean: clean
	@sudo rm -rf /home/acousini/data/html
	@sudo rm -rf /home/acousini/data/mysql
	@sudo docker system prune -af