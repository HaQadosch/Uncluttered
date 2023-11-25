#!/bin/sh
set -eu

FIREFOX_PATHS=( \
  "/Applications/Firefox.app/Contents/MacOS/firefox" \
  "firefox"
)
for i in "${FIREFOX_PATHS[@]}"
do
  if command -v $i &> /dev/null; then
  FIREFOX=$i
  fi
done

# CLI options detailed here https://wiki.mozilla.org/Firefox/CommandLineOptions
DATA_DIR="$(mktemp -d -t 'firefox-unsafe_data_dir.XXXXXXXXXX')"
"${FIREFOX}" \
  -profile $DATA_DIR \
  -no-remote \
  -url http://localhost:8888/ \
  >/dev/null 2>&1 &!
