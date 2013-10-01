#!/bin/sh
git submodule foreach git pull &&
git diff --name-only | xargs git add &&
git commit -m 'Update vim plugins'
