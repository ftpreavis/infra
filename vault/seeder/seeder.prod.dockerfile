FROM vault:1.13.3
COPY seed.prod.sh /seed.sh
RUN chmod +x /seed.sh
CMD ["sh", "/seed.sh"]
