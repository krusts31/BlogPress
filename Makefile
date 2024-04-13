up-dev:
	bash ./srcs/requirements/certbot/init-letsencrypt.sh blog-dev.com
	docker compose -f srcs/docker-compose-blog-dev.yaml\
		--env-file srcs/.env-blog-dev up --build

down-dev:
	docker compose -f srcs/docker-compose-blog-dev.yaml\
		--env-file srcs/.env-blog-dev -v down 
	docker volume rm srcs_vol_mariadb srcs_vol_wordpress

fclean:
	rm -rf ./srcs/requirements/certbot/conf/live
	rm -rf ./srcs/requirements/certbot/conf/options-ssl-nginx.conf
	rm -rf ./srcs/requirements/certbot/conf/ssl-dhparams.pem

save:
	bash ./srcs/tools/database_backup.sh

import:
	bash ./srcs/tools/import_database.sh 24.04.07-12.40.34.sql

stop:
	docker stop -t 0 $(shell docker ps -q)
