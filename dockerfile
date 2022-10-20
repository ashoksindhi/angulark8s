# Stage 1
FROM node:16.18-alpine as node
WORKDIR /app
COPY / ./
COPY package*.json ./

RUN npm install -g @angular/cli@13.2.5 && \
    npm install && \
    npm build

# Stage 2
FROM nginx:1.23.2-alpine
COPY --from=build /app/dist/sample-app /usr/share/nginx/html