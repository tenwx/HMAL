#!/bin/bash

# Function to update files
update_file() {
    local file="$1"
    # Use perl for more reliable in-place editing
    perl -pi -e 's/com\.android\.hmal/x.y.z/g' "$file"
}

# Update proguard files
find . -name "proguard-rules.pro" -type f -exec bash -c 'update_file "$0"' {} \;

# Update XML files
find . -name "*.xml" -type f -exec bash -c 'update_file "$0"' {} \;

# Update Kotlin files
find . -name "*.kt" -type f -exec bash -c 'update_file "$0"' {} \;

# Update Java files
find . -name "*.java" -type f -exec bash -c 'update_file "$0"' {} \;

# Update shell scripts (to prevent future issues)
find . -name "*.sh" -type f -exec bash -c 'update_file "$0"' {} \; 