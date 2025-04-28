# Deprecated

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
    echo \"import fastify from 'fastify';\" > index.js && \
    echo \"\" >> index.js && \
    echo \"const server = fastify();\" >> index.js && \
    echo \"\" >> index.js && \
    echo \"server.get('/', async (request, reply) => {\" >> index.js && \
    echo \"  return 'pong';\" >> index.js && \
    echo \"});\" >> index.js && \
    echo \"\" >> index.js && \
    echo \"server.listen({ host: '0.0.0.0', port: 3000 }, (err, addr) => {\" >> index.js && \
    echo \"  if (err) {\" >> index.js && \
    echo \"    console.error(err);\" >> index.js && \
    echo \"    process.exit(1);\" >> index.js && \
    echo \"  }\" >> index.js && \
    echo \"  console.log(\\\"Server listening at \\\", addr);\" >> index.js && \
    echo \"});\" >> index.js; \
  else \
    echo '📝 index.js already exists, skipping'; \
  fi && \
  echo '✅ Fastify setup complete!'"]
