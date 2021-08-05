
# Run composer and create laravel project inside .src
docker-compose run --rm composer create-project --prefer-dist laravel/laravel .

# Run appliation (server, interpreter, db)
docker-compose up server php mysql

# By adding "depends_on" inside the docker-compose we can just use "up server"
docker-compose up server