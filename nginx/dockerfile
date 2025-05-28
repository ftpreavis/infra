FROM nginx:alpine

# Optional: copy your custom config
COPY nginx.conf /etc/nginx/nginx.conf

CMD sh -c '\
  for host in $WAIT_FOR_HOSTS; do \
    until getent hosts "$host"; do \
      echo "⏳ Waiting for $host..."; \
      sleep 1; \
    done; \
    echo "✅ $host resolved."; \
  done; \
  exec nginx -g "daemon off;"; \
'
