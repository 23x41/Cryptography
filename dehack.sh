#!/bin/bash

if [ ! -f "secret.txt" ] || [ ! -f "key.txt" ]; then
    echo "Error: Files 'secret.txt' and 'key.txt' are required."
    exit 1
fi

content=$(cat secret.txt)
key=$(cat key.txt)
encodings=($key)

for (( i=${#encodings[@]}-1; i>=0; i-- )); do
    encoding="${encodings[$i]}"
    case $encoding in
        "base16") content=$(echo "$content" | xxd -r -p);;
        "base32") content=$(echo -n "$content" | base32 -d);;
        "base64") content=$(echo -n "$content" | base64 -d);;
        "hex") content=$(echo -n "$content" | xxd -r -p);;
    esac
done

echo "$content"

