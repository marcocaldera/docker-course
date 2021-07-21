# Build image
docker build -t starwars .

# Run container
docker run --name fav --rm -p 3000:3000 starwars

# Run mongodb container based on mongo image
docker run -d --name mongodb mongo

# Get ip address of mongodb container and search for ip
docker inspect mongodb

# Run container inside network
docker network create favorites-net
docker run -d --name mongodb --network favorites-net mongo
docker run --name fav --network favorites-net --rm -p 3000:3000 starwars