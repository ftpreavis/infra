FROM vault:1.13.3
COPY .env.csv /.env.csv
RUN chmod +rx /.env.csv
COPY seed.dev.sh /seed.sh
RUN chmod +x /seed.sh

CMD ["sh", "/seed.sh"]
