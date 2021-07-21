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