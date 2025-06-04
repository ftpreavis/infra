#!/bin/bash
set -e

EXAMPLE_FILE="infra/vault/seeder/.env.csv.example"
TARGET_FILE="infra/vault/seeder/.env.csv"

echo "🔧 Creating $TARGET_FILE from $EXAMPLE_FILE"
> "$TARGET_FILE"

while IFS= read -r line || [ -n "$line" ]; do
	line=$(printf "%s" "$line" | tr -d '\r')
	[ -z "$line" ] && continue
	case "$line" in \#*) continue ;; esac

	# Parse CSV structure: path,KEY=DEFAULT
	path="${line%%,*}"
	kv="${line#*,}"
	key="${kv%%=*}"
	default="${kv#*=}"

	printf "%s [%s]: " "$key" "$default"
	read -r input < /dev/tty
	value="${input:-$default}"

	echo "$path,$key=$value" >> "$TARGET_FILE"
done < "$EXAMPLE_FILE"

echo "✅ All done!"
