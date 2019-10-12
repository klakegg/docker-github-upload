#!/bin/sh

set -e
set -u

# Fetch tag
export TAG=$(echo $GITHUB_REF | sed "s:.*/::g")

# Fetch upload url
export UPLOAD_URL=$(curl -s -u ${GITHUB_ACTOR}:${GITHUB_TOKEN} https://api.github.com/repos/${GITHUB_REPOSITORY}/releases/tags/${TAG} \
  | jq -r '.upload_url' \
  | sed "s:{.*::g")

# Verify upload url was found
if [ ! "$UPLOAD_URL" ]; then
  echo "Unable to find release for tag '$TAG'."
  exit 1
fi

FILE=${INPUT_PATH:-.github/publish.sh}

# Check if script exists
if [ ! -e $FILE ]; then
  echo "Unable to find '$FILE'."
  exit 1
fi

# Trigger script for publishing
source $FILE
