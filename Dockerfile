FROM node:12-slim

WORKDIR /usr/src/app
COPY package.json .
COPY package-lock.json .
RUN npm install --production
COPY db db/
COPY srv srv/
COPY srv/gen/csn.json srv/
COPY app app/

EXPOSE 4004
USER node
CMD [ "npm", "start" ]