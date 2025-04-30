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

# 3) Rename to what Vault expects:
sudo mv "$OUTDIR/fullchain.pem" "$OUTDIR/vault.crt"
sudo mv "$OUTDIR/privkey.pem"   "$OUTDIR/vault.key"

# 4) Give ownership to the Vault user inside the container (UID 1001)
sudo chown 1001:1001 "$OUTDIR/vault.crt" "$OUTDIR/vault.key"

# 5) Tighten perms
sudo chmod 644 "$OUTDIR/vault.crt"
sudo chmod 600 "$OUTDIR/vault.key"

echo "✔ Certificates for $DOMAIN written to $OUTDIR"
