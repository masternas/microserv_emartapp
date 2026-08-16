#!/bin/bash

# Replace with your repo owner and name
OWNER="masternas"
REPO="actionprofile"

# Get all artifact IDs (paginate through all pages)
ARTIFACT_IDS=$(gh api repos/$OWNER/$REPO/actions/artifacts --paginate --jq '.artifacts[].id')

# Loop through and delete each artifact
for ID in $ARTIFACT_IDS; do
  echo "Deleting artifact ID: $ID"
  gh api repos/$OWNER/$REPO/actions/artifacts/$ID -X DELETE
done

echo "✅ All artifacts deleted for $OWNER/$REPO"
