#!/bin/bash

# Function to process a file
process_file() {
    local src="$1"
    local dst="$2"
    local pkg="$3"
    
    # Create destination directory if it doesn't exist
    mkdir -p "$(dirname "$dst")"
    
    # Update package declaration and copy to new location
    sed "1s|package com.android.hmal|package $pkg|" "$src" > "$dst"
    
    # Remove original file
    rm "$src"
}

# App module
for file in app/src/main/java/com/android/hmal/*.kt; do
    [ -f "$file" ] && process_file "$file" "${file/com\/android\/hmal/x\/y\/z}" "x.y.z"
done

# App subpackages
for dir in ui service util; do
    for file in app/src/main/java/com/android/hmal/$dir/**/*.kt; do
        [ -f "$file" ] && process_file "$file" "${file/com\/android\/hmal/x\/y\/z}" "x.y.z.$dir"
    done
done

# Common module
for file in common/src/main/java/com/android/hmal/common/*.{kt,java}; do
    [ -f "$file" ] && process_file "$file" "${file/com\/android\/hmal/x\/y\/z}" "x.y.z.common"
done

# Xposed module
for file in xposed/src/main/java/com/android/hmal/xposed/*.kt; do
    [ -f "$file" ] && process_file "$file" "${file/com\/android\/hmal/x\/y\/z}" "x.y.z.xposed"
done

for file in xposed/src/main/java/com/android/hmal/xposed/hook/*.kt; do
    [ -f "$file" ] && process_file "$file" "${file/com\/android\/hmal/x\/y\/z}" "x.y.z.xposed.hook"
done

# Move AIDL files
mkdir -p common/src/main/aidl/x/y/z/common
mv common/src/main/aidl/com/android/hmal/common/* common/src/main/aidl/x/y/z/common/
sed -i "1s|package com.android.hmal.common|package x.y.z.common|" common/src/main/aidl/x/y/z/common/*.aidl

# Clean up empty directories
rm -rf app/src/main/java/com
rm -rf common/src/main/java/com
rm -rf common/src/main/aidl/com
rm -rf xposed/src/main/java/com 