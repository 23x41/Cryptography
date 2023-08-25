#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <iterations> <filename>"
    exit 1
fi

iterations="$1"
filename="$2"

if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found."
    exit 1
fi

content=$(cat "$filename")

for (( i=0; i<$iterations; i++ )); do
    content=$(echo "$content" | base64)
done

echo "$content"
