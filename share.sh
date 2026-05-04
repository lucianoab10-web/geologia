#!/bin/bash
set -e
# Check if a file was provided
if [ -z "$1" ]; then
  echo "Error: Please provide a file name."
  echo "Usage: ./share.sh filename.pdf"
  exit 1
fi

FILE=$1

# Replace any spaces in the filename with hyphens (URLs hate spaces)
CLEAN_FILE=$(echo "$FILE" | tr ' ' '-')
if [ "$FILE" != "$CLEAN_FILE" ]; then
    mv "$FILE" "$CLEAN_FILE"
    echo "Renamed '$FILE' to '$CLEAN_FILE' for web compatibility."
fi

# Add, commit, and push to GitHub
git add "$CLEAN_FILE"
git commit -m "Uploaded $CLEAN_FILE"
git push

# Print the final URL
echo ""
echo "✅ Upload complete! Here is your shareable URL:"
echo "👉 https://lucianoab10-web.github.io/geologia/$CLEAN_FILE"
echo ""
