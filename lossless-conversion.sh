#!/bin/bash

# Quick Optimizer for GitHub Pages
# Run this in your repository root

# Install required tools
sudo apt-get install -y jpegoptim optipng pngquant webp ffmpeg

# Optimize JPG
find . -type f -size +100k \( -iname "*.jpg" -o -iname "*.jpeg" \) -exec jpegoptim -m85 -p --strip-all {} \;

# Optimize PNG
find . -type f -size +100k -iname "*.png" -exec optipng -o7 -strip all {} \;

# Convert to WebP (modern format)
find . -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec cwebp -q 85 -m 6 -pass 3 -mt {} -o {}.webp \;

# Replace originals with WebP
find . -name "*.webp" | while read file; do
    original="${file%.webp}"
    mv "$file" "$original"
done

echo "Optimization complete! Don't forget to git commit and push!"