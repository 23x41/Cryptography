#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_filename> <encoding_iterations>"
    exit 1
fi

input_filename="$1"
encoding_iterations="$2"

if [ ! -f "$input_filename" ]; then
    echo "Error: File '$input_filename' not found."
    exit 1
fi

content=$(cat "$input_filename")
encodings=("base16" "base32" "base64" "hex")
key=""

for _ in $(seq 1 $encoding_iterations); do
    selected_encoding="${encodings[$((RANDOM % ${#encodings[@]}))]}"
    key="$key $selected_encoding"

    case $selected_encoding in
        "base16") content=$(echo "$content" | xxd -p -c 9999);;
        "base32") content=$(echo -n "$content" | base32);;
        "base64") content=$(echo -n "$content" | base64);;
        "hex") content=$(echo -n "$content" | xxd -p -c 9999);;
    esac
done

echo "$key" > key.txt
echo "$content" > secret.txt

