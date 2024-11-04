#!/bin/sh -el

[ -z "${INPUT_TARGET_DIR}" ] && { echo "Need to set TARGET_DIR. Default is './'"; exit 1; }
[ -z "${INPUT_CONFIG_FILE}" ] && { echo "Need to set CONFIG_FILE. Default is 'config.yml'"; exit 1; }
[ -z "${INPUT_FORMAT}" ] && { echo "Need to set INPUT_FORMAT. Default is 'PDF'"; exit 1; }

# TODO Enable env paramaters that only INPUT_TARGET_DIR works well.

echo "Run Initialization and build step"
cd $INPUT_TARGET_DIR && bundle install && npm install && REVIEW_CONFIG_FILE="$INPUT_CONFIG_FILE" npm run pdf
echo "Finish build step"
