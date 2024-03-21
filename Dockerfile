# Use Nginx as the base image
FROM nginx:latest

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Copy the contents of the 'dist' directory from your local machine to the working directory in the container
COPY ./dist/ .

# Expose port 80 to allow incoming connections
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]



