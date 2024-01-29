#!/bin/bash

# Specify branches to exclude
EXCLUDE_BRANCHES="(^\\*|master|main|development)"

# List local branches that are merged and exclude specified branches
MERGED_BRANCHES=$(git branch --merged | grep -Ev "$EXCLUDE_BRANCHES")

# Check if there are any branches to delete
if [ -z "$MERGED_BRANCHES" ]; then
  echo "No merged local branches to delete."
  exit 0
fi

echo "Deleting merged local branches:"

# Delete each merged local branch
echo "$MERGED_BRANCHES" | xargs -n 1 git branch -d

echo "Deletion complete."
