#!/bin/sh

set -e
set -u

# Copy and prepare template files to root folder.
for file in $(ls template); do
  cat template/$file | sed "s:\[VERSION\]:$VERSION:g" > $file
done
