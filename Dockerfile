# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Set the timezone to Asia/Kolkata
ENV TZ=Asia/Kolkata

# Update and upgrade the system
RUN apt-get update -y && apt-get upgrade -y

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get install -y curl wget

# Install Node.js using NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
RUN apt-get install -y nodejs

# Install necessary packages
RUN apt-get install -y ffmpeg git imagemagick graphicsmagick sudo yarn

# Install global packages: pm2, sqlite, and others as needed
RUN npm install -g pm2 sqlite ajayos/nodelog @octokit/rest buffer 

# Create a directory for the AURORA app
WORKDIR /AURORA

# Copy the contents of the AURORA folder to /AURORA in the container
COPY AURORA /AURORA

# Set the working directory to /AURORA
WORKDIR /AURORA

# Copy aurora.sh to /bin folder
COPY AURORA/aurora.sh /bin/aurora

# Set permissions for aurora.sh
RUN chmod +x /bin/aurora

