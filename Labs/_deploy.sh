#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "luciano.selzer@gmail.com"
git config --global user.name "Luciano Selzer"

git clone -b gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git book-output
cd book-output
cat ls
cp -r ../Labs/_book/* ./
git add --all *
git commit -m"Update the book" || true
git push -q origin gh-pages
