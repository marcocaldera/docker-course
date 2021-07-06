FROM node

# Indica a docker di eseguire tutti i comandi che lanceremo (RUN) dentro la cartella /app
WORKDIR /app

# Copia tutto "." quello che si trova nella cartella 02.nodejs-... ed in tutte le sotto cartelle
# all'interno di /app (in quando la WORKDIR è /app)

# Va anche bene così dato che la WORKDIR è /app
# COPY . .

# Questa soluzione è più pulita
COPY . /app

RUN npm install

# Quando il container è in esecuzione (quindi in linux) vogliamo esporre la porta 80 al nostro sistema (e.g., macos)
EXPOSE 80

CMD [ "node",  "server.js"]

# La differenza tra RUN e CMD è che:
# RUN viene eseguito quando viene creata l'image
# CMD viene eseguito quando viene creato un container (quindi n volte con n il numero di volte in cui viene
# creato un container a partire da quell'image)