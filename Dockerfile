FROM node:16.16.0-alpine

LABEL maintainer="Nightscout Contributors"

WORKDIR /opt/app
ADD . /opt/app

RUN npm install --cache /tmp/empty-cache && \
  npm run postinstall && \
  npm run env && \
  rm -rf /tmp/*

USER node

# Apenas para documentação/local, não importa para Render
EXPOSE 10000

# Escuta na porta fornecida pelo Render
CMD ["sh", "-c", "PORT=${PORT} node lib/server/server.js"]
