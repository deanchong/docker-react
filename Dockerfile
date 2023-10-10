FROM node:16-alpine

workdir '/app'

COPY package.json .
RUN npm install

COPY . .


CMD ["npm", "start"]