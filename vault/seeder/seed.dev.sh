#!/bin/sh

echo "⌛ Waiting for Vault to be reachable..."

until vault status > /dev/null 2>&1; do
  echo "⏳ Vault not ready... retrying in 1s"
  sleep 1
done

echo "✅ Vault is up! Seeding dev secrets..."

CSV_FILE=/.env.csv
if [[ ! -f "$CSV_FILE" ]]; then
  echo "Error loading seeding csv file"
  exit 1
fi

while IFS=, read -r path rest; do
  echo "Seeding $path → $rest"
  vault kv put "$path" $rest
done < "$CSV_FILE"

## CHANGE FOLLOWING VALUES TO SEED THE DB CORRECTLY
echo "✅ Dev Vault seeded."
