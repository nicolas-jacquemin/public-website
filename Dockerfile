FROM node:latest AS BUILDER
LABEL maintainer="Nicolas Jacquemin <nicolas@nicolasjacquemin.com>"
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest
COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY docker/default.conf /etc/nginx/conf.d/default.conf
COPY --from=BUILDER /app/dist /usr/share/nginx/html