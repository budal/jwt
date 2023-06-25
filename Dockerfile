FROM node:latest

RUN apt update && apt install -y --no-install-recommends apt-utils supervisor

COPY ./docker/supervisord/supervisord.conf /etc/supervisor
COPY ./docker/supervisord/conf /etc/supervisord.d/
COPY ./apps /var/apps

RUN apt install -y git curl
RUN apt clean && rm -rf /var/lib/apt/lists/*

RUN chown node:node /var/apps/*

WORKDIR /var/apps