FROM vault:1.13.3
COPY seed.dev.sh /seed.sh
RUN chmod +x /seed.sh

ENV VAULT_ADDR=http://vault-module:8200
ENV VAULT_TOKEN=root

CMD ["sh", "/seed.sh"]
