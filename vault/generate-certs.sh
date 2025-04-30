#!/usr/bin/env bash
set -e

DOMAIN=vault.transcendance.charles-poulain.ovh
WEBROOT=/var/www/certbot
OUTDIR=/srv/ft_preavis/data/vault/certs

# 1) Obtain/renew
sudo certbot certonly \
  --non-interactive --agree-tos \
  --email charles.probe@gmail.com            \
  --webroot -w "$WEBROOT"           \
  -d "$DOMAIN"

# 2) Copy into place for Docker
mkdir -p "$OUTDIR"
sudo cp /etc/letsencrypt/live/"$DOMAIN"/{fullchain.pem,privkey.pem} "$OUTDIR"/
sudo chown -R 1001:1001 "$OUTDIR"
sudo chmod 640 "$OUTDIR"/*.pem

echo "✔ Certificates for $DOMAIN written to $OUTDIR"
