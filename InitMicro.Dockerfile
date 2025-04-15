FROM node:latest

WORKDIR /app

CMD ["/bin/sh", "-c", "\
  echo '📁 Initializing Fastify project in /app...'; \
  if [ ! -f package.json ]; then \
    npm init -y; \
  else \
    echo '📦 package.json already exists, skipping init'; \
  fi && \
  npm install fastify && \
  if [ ! -f index.js ]; then \
    echo \"const fastify = require('fastify')();\" > index.js && \
    echo \"fastify.get('/', async () => ({ hello: 'world' }));\" >> index.js && \
    echo \"fastify.listen({ port: 3000 }, err => { if (err) throw err; });\" >> index.js && \
    echo '✅ index.js created'; \
  else \
    echo '📝 index.js already exists, skipping'; \
  fi && \
  echo '✅ Fastify setup complete!'"]
