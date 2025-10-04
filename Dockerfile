FROM node:16.16.0-alpine

LABEL maintainer="Nightscout Contributors"

WORKDIR /opt/app
ADD . /opt/app

RUN npm install --cache /tmp/empty-cache && \
  npm run postinstall && \
  npm run env && \
  rm -rf /tmp/*

USER node

# Não precisa expor uma porta fixa, mas pode manter para documentação
EXPOSE 10000

# Use a porta fornecida pelo Render
CMD ["sh", "-c", "PORT=${PORT:-10000} node lib/server/server.js"]
