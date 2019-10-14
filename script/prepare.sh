#!/bin/sh

set -e
set -u

# Copy and prepare template files to project folder.
for file in $(ls template); do
  cat template/$file \
  | sed "s:\[VERSION\]:$VERSION:g" \
  | sed "s:\[REPO\]:$REPO:g" \
  > $file
done
