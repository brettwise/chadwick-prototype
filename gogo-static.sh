#!/bin/bash

echo "Type the name of your site without the .com This will rename the folder you're in and be used in the first git commit:"
read sitename
echo "Cool hang tight. This might take a few seconds."
(cd ..; mv static-site-generator $sitename)
echo "Folder renamed."
echo -ne '\n' 'build' '\n' 'y' '\n' '404.html' '\n' 'y' '\n' | divshot init
echo "divshot site initialized"
(cd src/sass;bower install)
echo "Sass related Bower packages installed."
(cd src/js;bower install)
echo "JS related Bower packages installed."
rm -rf src/js/vendor/modernizr/feature-detects
rm -rf src/js/vendor/modernizr/media
rm -rf src/js/vendor/modernizr/test
rm -rf src/js/vendor/instantclick/tests
rm -rf .git
echo "Old git repo removed."
git init
echo "New git repo initialized."
git add -A
git commit -m "Initial commit for $sitename"
rm README.md
mv new-repo-readme.md README.md
git add -A
git commit -m "Removed readme from original static project's readme and moved new one to be default."
npm install
echo "npm packages installed."
subl .
gulp
