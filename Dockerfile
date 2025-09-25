FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    PORT=4499

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    bash curl netcat fortune-mod cowsay \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

EXPOSE 4499/tcp
CMD ["/app/wisecow.sh"]
