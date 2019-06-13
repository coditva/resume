#!/bin/sh

blog_repo="https://coditva:$GITHUB_TOKEN@github.com/coditva/blog"

git clone $blog_repo blog/ || exit 1
cd blog/
cp ../resume.pdf ./static/resume.pdf || exit 1

git config user.name  "Utkarsh Maheshwari"
git config user.email "coditva@gmail.com"

git commit -m "Update resume with TravisCI" static/resume.pdf || exit 0

git remote rm origin
git remote add origin $blog_repo

git push origin master
