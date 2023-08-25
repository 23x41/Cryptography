#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <iterations> <encoded_filename>"
    exit 1
fi

iterations="$1"
encoded_filename="$2"

if [ ! -f "$encoded_filename" ]; then
    echo "Error: File '$encoded_filename' not found."
    exit 1
fi

encoded_content=$(cat "$encoded_filename")

for (( i=0; i<$iterations; i++ )); do
    encoded_content=$(echo "$encoded_content" | base64 -d)
done

echo "$encoded_content"
