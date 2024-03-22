# Stage 1: Build the Vue application
#  1. Build the application
FROM node:14 AS Build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
#  Serve the built application with Nginx
FROM nginx:alpine
COPY --from=build app/dist /usr/share/nginx/html

# EXPOSE 8080
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
