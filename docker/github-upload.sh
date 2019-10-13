#!/bin/sh

set -e
set -u

# Extract tag.
export TAG=$(echo $GITHUB_REF | sed "s:.*/::g")

# Fetch upload url.
export UPLOAD_URL=$(curl -s -u ${GITHUB_ACTOR}:${GITHUB_TOKEN} https://api.github.com/repos/${GITHUB_REPOSITORY}/releases/tags/${TAG} \
  | jq -r '.upload_url' \
  | sed "s:{.*::g")

# Verify upload url was found.
if [ ! "$UPLOAD_URL" ]; then
  echo "Unable to find release for tag '$TAG'."
  exit 1
fi

if [ "${INPUT_FILE:-}" ]; then
  # Simple file upload.
  upload \
    -f "${INPUT_FILE}" \
    -n "${INPUT_NAME:-}" \
    -l "${INPUT_LABEL:-}" \
    -t "${INPUT_TYPE:-}"
elif [ "${INPUT_SCRIPT:-}" ]; then
  # Trigger script for upload.
  sh -c "${INPUT_SCRIPT}"
else
  # Trigger script file for upload.
  SCRIPT=${INPUT_PATH:-.github/publish.sh}

  # Check if file exists.
  if [ ! -e $SCRIPT ]; then
    echo "Unable to find '$SCRIPT'."
    exit 1
  fi

  # Trigger script for publishing.
  source $SCRIPT
fi
