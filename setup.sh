docker-compose build
docker-compose run web yarn install
docker-compose run web run rails db:create
