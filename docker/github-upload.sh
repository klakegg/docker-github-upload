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
elif [ "${INPUT_PATH:-}" ]; then
  # Trigger script file for upload.

  # Check if file exists.
  if [ ! -e $INPUT_PATH ]; then
    echo "Unable to find '$INPUT_PATH'."
    exit 1
  fi

  # Trigger script for publishing.
  source $INPUT_PATH
else
  # Lack of configuration.
  echo "Configuration is missing."
  echo "Please see https://github.com/klakegg/github-upload for information."
  exit 1
fi
