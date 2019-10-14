#!/bin/sh

set -e
set -u

# Build and tag docker image.
docker build -t $REPO:$VERSION .
docker tag $REPO:$VERSION $REPO:latest

if [ $VERSION != "snapshot" ]; then
  # Prepare git commit and tag before publishing Docker image.
  git add .
  git commit -m "Version $VERSION."
  git tag v${VERSION}

  # Push Docker image.
  docker push $REPO:$VERSION
  docker push $REPO:latest

  # Push git commit and tag.
  git push origin master
  git push origin v${VERSION}
fi
