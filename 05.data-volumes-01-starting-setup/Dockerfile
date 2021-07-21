FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

# Importante mettere questa informazione in basso altrimenti per come
# funzionano i layer docker appena modifico la DEFAULT_PORT da cli automaticamente
# viene rifatto npm install, etc.. inutilmente
ARG DEFAULT_PORT=80

# ENV PORT 80
ENV PORT $DEFAULT_PORT

EXPOSE $PORT

CMD [ "npm", "start" ]