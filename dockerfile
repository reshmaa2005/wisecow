FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
# Ensure /usr/games is in PATH so fortune & cowsay work without full path
ENV PATH="/usr/games:/usr/local/games:${PATH}"

# Install fortune-mod and cowsay
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    fortune-mod cowsay \
 && rm -rf /var/lib/apt/lists/*

# Default command: print a random cow with a fortune
CMD ["bash", "-c", "fortune | cowsay"]
