#!/bin/sh

export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root

echo "🔐 Logging in to Vault..."
vault login $VAULT_TOKEN

echo "🌱 Writing secrets to Vault..."

vault kv put secret/jwt SECRET_KEY=super-secret-jwt
vault kv put secret/oauth GOOGLE_CLIENT_ID=your-client-id GOOGLE_CLIENT_SECRET=your-client-secret

echo "✅ Vault seeded successfully."
