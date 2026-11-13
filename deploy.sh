#!/bin/sh
# Bump the build number (so phones drop their cached copy), commit and push.
set -e
cd "$(dirname "$0")"
n=$(( $(cat version.txt) + 1 ))
echo "$n" > version.txt
sed -i '' "s/const BUILD = \"[0-9]*\";/const BUILD = \"$n\";/" index.html
git add -A
git commit -q -m "${1:-Update site}"
git push -q
echo "deployed build $n"
