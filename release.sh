#! /usr/bin/bash
set -uvx
set -e
cwd=`pwd`
ts=`date "+%Y.%m%d.%H%M"`
version="${ts//.0/.}"
comment=$1

echo $version

pubspec "$version"
#dart pub get

cat << EOS >> CHANGELOG.md

## $version

- $comment
EOS

dos2unix pubspec.yaml
dos2unix CHANGELOG.md

./do-analyze.sh
./do-test.sh

#exit 0

cd $cwd
tag="yaml_io-$version"
git add .
git commit -m"yaml_io: $comment"
git tag -a "$tag" -m"$tag"
git push origin "$tag"
git push origin HEAD:main
git remote -v

#dart pub publish --force
