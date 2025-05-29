#!/bin/bash

# CONFIG
BATCH_SIZE=1000
IMG_DIR="dataset/labels/val"
COMMIT_PREFIX="Add batch"
counter=0
batch=1

cd "$(dirname "$0")" || exit 1

for file in "$IMG_DIR"/*; do
  git add "$file"
  counter=$((counter + 1))

  if (( counter % BATCH_SIZE == 0 )); then
    git commit -m "$COMMIT_PREFIX $batch"
    git push
    echo "Batch $batch pushed: $counter files"
    batch=$((batch + 1))
  fi
done

if (( counter % BATCH_SIZE != 0 )); then
  git commit -m "$COMMIT_PREFIX $batch (final)"
  git push
  echo "Final batch $batch pushed: $((counter % BATCH_SIZE)) files"
fi

echo "Total images pushed: $counter"
