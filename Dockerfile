FROM node:alpine as builder

WORKDIR '/dock'

RUN npm install

COPY . .

RUN npm run build

FROM nginx

EXPOSE 80

COPY --from=builder /dock/build /usr/share/nginx/html