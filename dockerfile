# Stage 1
FROM node:16.18-alpine as build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2
FROM nginx:1.23.2-alpine
COPY --from=build /usr/src/app/dist/sample-app /usr/share/nginx/html