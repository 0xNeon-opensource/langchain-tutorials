#!/bin/bash

# Directory to start from
dir="../../data/code/todo-list-react-ts-app-txt/"

echo "Starting the renaming process..."

# Loop through every file in directory and subdirectories
find "$dir" -type f -print0 | while IFS= read -r -d '' file; do
    # Skip files that already have a .txt extension
    if [[ $file != *.txt ]]; then
        # Append .txt to the end of the file name
        echo "Renaming $file to $file.txt..."
        mv -- "$file" "$file.txt" || {
            echo "Failed to rename $file"
            exit 1
        }
    else
        echo "Skipping $file, it already has a .txt extension"
    fi
done

echo "Renaming process completed."
