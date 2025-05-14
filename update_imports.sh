#!/bin/bash

# Find all Kotlin and Java files
find . -type f \( -name "*.kt" -o -name "*.java" \) | while read -r file; do
    # Use perl for more reliable in-place editing
    perl -pi -e 's/import com\.android\.hmal\./import x.y.z./g' "$file"
done 