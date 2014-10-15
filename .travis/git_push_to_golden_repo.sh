#!/bin/bash

git remote add deploy git@github.com:robparrott/minimal-cdp-demo-golden.git
git config --global push.default matching
git ls-files
git branch -av
git push deploy master

echo "Completed push..."
