.PHONY: up down

up:
	@cd srcs && docker-compose up --build

down:
	@cd srcs && docker-compose down

fclean:
	@cd srcs && docker-compose down
	@cd ~/data && sudo rm -rf ftp_logs/ shared/ wp_db/ wp_files/ && mkdir ftp_logs/ shared/ wp_db/ wp_files/
	@docker rmi $$(docker images -q)
