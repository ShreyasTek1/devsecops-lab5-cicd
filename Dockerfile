# Use an official Node.js runtime as a parent image
FROM node:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the application source code
COPY . .

# Make port 8888 available
EXPOSE 8888

# Set production environment
ENV NODE_ENV=production

# Run the application
CMD ["node", "app.js"]
