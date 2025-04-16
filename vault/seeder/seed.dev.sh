#!/bin/sh

echo "⌛ Waiting for Vault to be reachable..."

until vault status > /dev/null 2>&1; do
  echo "⏳ Vault not ready... retrying in 1s"
  sleep 1
done

echo "✅ Vault is up! Seeding dev secrets..."

## CHANGE FOLLOWING VALUES TO SEED THE DB CORRECTLY

vault kv put secret/jwt SECRET_KEY=dev-jwt-secret
vault kv put secret/oauth GOOGLE_CLIENT_ID=dev-client-id GOOGLE_CLIENT_SECRET=dev-client-secret

echo "✅ Dev Vault seeded."
