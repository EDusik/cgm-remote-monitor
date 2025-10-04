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

# Garantir que o Node use a porta do Render
CMD ["sh", "-c", "export PORT=${PORT:-10000} && node lib/server/server.js"]
