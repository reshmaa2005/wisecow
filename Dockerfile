# Use Ubuntu as base image
FROM ubuntu:24.04

# Avoid interactive prompts during apt install
ENV DEBIAN_FRONTEND=noninteractive \
    PORT=4499

# Install required packages: bash, fortune, cowsay, netcat
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    bash \
    curl \
    netcat \
    fortune-mod \
    cowsay \
 && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the wisecow app script into container
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

# Expose the app port
EXPOSE 4499/tcp

# Run the app
CMD ["/app/wisecow.sh"]

