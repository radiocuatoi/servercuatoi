#!/usr/bin/env bash
export GIT_SSL_NO_VERIFY=true
echo "$(date)" > time.txt
git add . --all
git commit -m "ok"
git remote | xargs -L1 git push --all -f
