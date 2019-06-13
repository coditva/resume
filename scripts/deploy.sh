#!/bin/sh

blog_repo="https://coditva:$GITHUB_TOKEN@github.com/coditva/blog"

latest_tag=$(git tag | tail -n1)
previous_tag=$(git tag | tail -n2 | head -n1)
changelog=$(git log --oneline --reverse $previous_tag..$latest_tag)

if [[ -d "blog/" ]]; then
    cd blog/
    git pull
else
    git clone $blog_repo blog/ || exit 1
    cd blog/
fi

cp ../resume.pdf ./static/resume.pdf || exit 1

git config user.name  "Utkarsh Maheshwari"
git config user.email "coditva@gmail.com"

git commit -a -m "Update resume with TravisCI

changelog:
$changelog"

git push origin master
