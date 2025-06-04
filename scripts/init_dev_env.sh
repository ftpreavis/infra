#!/bin/bash
set -e

EXAMPLE_FILE="infra/env/.example.env"
TARGET_FILE="infra/env/.dev.env"

echo "🔧 Creating $TARGET_FILE from $EXAMPLE_FILE"
> "$TARGET_FILE"

while IFS= read -r line || [ -n "$line" ]; do
	line=$(printf "%s" "$line" | tr -d '\r')
	[ -z "$line" ] && continue
	case "$line" in \#*) continue ;; esac

	key="${line%%=*}"
	default="${line#*=}"

	printf "%s [%s]: " "$key" "$default"
	read -r input < /dev/tty  # <- force each read to go to terminal
	value="${input:-$default}"
	echo "$key=$value" >> "$TARGET_FILE"
done < "$EXAMPLE_FILE"

echo "✅ All done!"
