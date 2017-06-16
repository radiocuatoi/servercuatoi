#!/usr/bin/env bash
export GIT_SSL_NO_VERIFY=true &&
echo "$(date)" > time.txt &&
git add . --all &&
git commit -m "ok" &&
git push $1 -f --all
