#!/usr/bin/env bash

# Updates github host pages at sarthakgrover.github.io
#
# Command: bash ./update_github.sh

echo -e "Publish new public folder...\n"
rm -rf public/
git submodule add -f -b master https://github.com/sarthakgrover/sarthakgrover.github.io.git public

echo -e "Regenerate html code for display"
hugo

echo -e "Push to remote repository"
git commit -a -m "updated public and site"
git push -u origin master

echo -e "Push to public"
cd public
git add .
git commit -m "Build website"
git push origin master
cd ..