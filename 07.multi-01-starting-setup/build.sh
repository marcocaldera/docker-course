# Mongo DB container
docker run --name mongodb --rm -d -p 27017:27017 mongo

# Backend image
docker build -t golas .
# Backend container
docker run --name goals-backend --rm -d -p 80:80 golas

# Frontend image
docker build -t goals-react .
# Frontend container
docker run --name goals-frontend --rm -p 3000:3000 -it goals-react

###
# WITH NETWORK
###

# Create network
docker network create goals-net

# Mongo
docker run --name mongodb --rm -d --network goals-net mongo
# Backend container
docker run --name goals-backend --rm -d --network goals-net -p 80:80 goals-node
# Frontend container (network not needed beacuse a react app run on the brwaser and not into the container)
docker run --name goals-frontend --rm -p 3000:3000 -it goals-react


###
# WITH OPTMIZATION
###

# Run Mongo with volume for data persist and authentication
docker run --name mongodb -v data:/data/db -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=example --rm -d --network goals-net mongo
# Backend container with volume for logs file and live update (bind mount) exluding node_modules
docker run --name goals-backend -v logs:/app/logs -v "/${pwd}:/app" -v /app/node_modules --rm -d --network goals-net -p 80:80 goals-node
# Frontend container with bind mount for live source code update
docker run --name goals-frontend -v "/${pwd}:/app/src" --rm -p 3000:3000 -it goals-react