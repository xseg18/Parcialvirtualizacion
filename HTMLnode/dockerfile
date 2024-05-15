FROM node:latest

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get install -y npm

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port your app runs on
EXPOSE 3001

# Command to run your app
CMD ["node", "."]