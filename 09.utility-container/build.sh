# Create image
docker build -t node-util .

# Run npm init inside a contaier and share the output with our local machine (thanks to bind mount)
# In this way we can't have node installed on the host machine but create a npm project anyway
docker run -it -v $(pwd):/app node-util npm init 


# Using ENTRYPOINT we can restrict what can we do inside the container
# ENTRYPOINT [ "npm" ] automatically prepend npm to the command provided in cli
docker run -it -v $(pwd):/app node-util init 


### With docker compose (n.b., npm is the service name inside docker-compose)
docker-compose run --rm npm init