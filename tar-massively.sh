#!/bin/bash

# Iterate over each directory in the current directory
for dir in */; do
    # Remove the trailing slash from the directory name
    dir=${dir%/}
    # Create a tarball for the current directory
    tar -cvzf "${dir}.tar.gz" "$dir"
done
