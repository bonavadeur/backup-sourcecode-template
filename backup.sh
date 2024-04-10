#!/bin/bash

git stash
git checkout master
stashHash=$(git log --oneline --all | head -n 1 | cut -d' ' -f1)
git checkout $stashHash --theirs .
git add . && git commit -m "message"
git checkout release
git stash pop
