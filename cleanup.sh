#!/bin/bash

# Define the directories
THUMB_DIR="images/thumbs"
FULLS_DIR="images/fulls"

# Initialize a counter for missing images
missing_count=0

# Loop over all files in the thumbs directory
for file in "$THUMB_DIR"/*; do
    filename=$(basename "$file")  # Get the filename without the path

    # Check if the corresponding file exists in the fulls directory
    if [ ! -f "$FULLS_DIR/$filename" ]; then
        echo "File $filename does not exist in $FULLS_DIR. Deleting from $THUMB_DIR."
        rm "$file"  # Delete the file from thumbs if it does not exist in fulls
        missing_count=$((missing_count+1))  # Increment the missing files count
    fi
done

# Print the total count of missing images
echo "Total missing images deleted: $missing_count"

