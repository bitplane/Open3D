#!/bin/bash
# Fix all CMakeLists.txt files to use cmake_minimum_required VERSION 3.5

find . -name "CMakeLists.txt" -type f | while read -r file; do
    # Fix cmake_minimum_required lines
    sed -i 's/cmake_minimum_required(VERSION [0-2]\.[0-9.]*)/cmake_minimum_required(VERSION 3.5)/g' "$file"
    sed -i 's/cmake_minimum_required (VERSION [0-2]\.[0-9.]*)/cmake_minimum_required(VERSION 3.5)/g' "$file"

    # Fix cmake_policy lines
    sed -i 's/cmake_policy(VERSION [0-2]\.[0-9.]*)/cmake_policy(VERSION 3.5)/g' "$file"
    sed -i 's/cmake_policy (VERSION [0-2]\.[0-9.]*)/cmake_policy(VERSION 3.5)/g' "$file"
done
