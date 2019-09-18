#!/usr/bin/env bash

# Updates github host pages at sarthakgrover.github.io
#
# Command: bash ./update_github.sh

echo -e "Publish new public folder...\n"
rm -r public/
git submodule add -f -b master https://github.com/sarthakgrover/sarthakgrover.github.io.git public

echo -e "Push to remote repository"
git add .
git commit -m "updated site"
git push -u origin master

echo -e "Regenerate html code for display"
hugo
cd public
git add .
git commit -m "Build website"
git push origin master
