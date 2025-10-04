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

# Mudança principal: usar a porta que o Render fornece via variável PORT
CMD ["sh", "-c", "node lib/server/server.js"]
