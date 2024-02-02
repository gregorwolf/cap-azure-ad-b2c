FROM node:20 AS build-env
WORKDIR /app

COPY package.json .
COPY package-lock.json .
RUN npm ci
COPY db db/
COPY srv srv/
#COPY srv/gen/srv/csn.json srv/
COPY app app/

FROM gcr.io/distroless/nodejs20-debian12
COPY --from=build-env /app /app
WORKDIR /app
EXPOSE 4004
CMD [ "npm", "start" ]
