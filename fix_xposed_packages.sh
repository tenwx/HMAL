#!/bin/bash

# Find all Kotlin files in the xposed directory
find ./xposed/src/main/java/x/y/z/xposed -type f -name "*.kt" | while read -r file; do
    # Use perl for more reliable in-place editing
    perl -pi -e 's/package x\.y\.z\.xposed\.xposed/package x.y.z.xposed/g' "$file"
done 