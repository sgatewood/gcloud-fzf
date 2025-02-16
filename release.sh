#!/usr/bin/env bash

set -euo pipefail

echo -n "enter a tag: "
read -r tag

echo -n "enter a message: "
read -r message

echo -n "releasing tag '${tag}' with message '${message}' -- ok? (y/N): "
read -r confirmation

if [[ "${confirmation}" != "y" ]]; then
    echo "cancelling"
    exit 1
fi

git tag -a "${tag}" -m "${message}"
git push origin "${tag}"

GIT_NAME=$(git config get user.name)
GIT_EMAIL=$(git config get user.email)
GITHUB_TOKEN=$(gh auth token) 
goreleaser release --clean
