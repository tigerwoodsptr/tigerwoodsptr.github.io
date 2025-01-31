#!/bin/bash

# Check if jpegoptim is installed
if ! command -v jpegoptim &> /dev/null; then
    echo "Error: jpegoptim is not installed. Install it using 'sudo apt install jpegoptim' or 'brew install jpegoptim'."
    exit 1
fi

# Directory to search for images (default: current directory)
DIR="${1:-.}"

# Find and optimize JPEG/JPG images recursively
find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) | while read -r img; do
    echo "Optimizing: $img"  # Print image location

    # Apply lossless compression while keeping the original format
    jpegoptim --strip-all --max=85 "$img"

    echo "Optimized: $img"
done

echo "All images optimized successfully!"
