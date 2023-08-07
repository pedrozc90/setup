#!/bin/bash

if [[ -d ./Tukui ]]; then
    rm -rf Tukui
fi

# git clone --single-branch --branch Live https://github.com/tukui-org/Tukui.git

git clone --single-branch --branch "fixes" git@github.com:pedrozc90/Tukui-fork.git Tukui

rm -rf ./Config \
    && rm -rf ./Core \
    && rm -rf ./Libs \
    && rm -rf ./Licenses \
    && rm -rf ./Locales \
    && rm -rf ./Medias \
    && rm -rf ./Modules \
    && rm -rf ./Themes \
    && rm -fv ./*.toc \
    && mv -v ./Tukui/Tukui/* . \
    && rm -rf ./Tukui

find -type f -name "*.lua" | while read f; do tail -n1 $f | read -r _ || echo >> $f; done
find -type f -name "*.xml" | while read f; do tail -n1 $f | read -r _ || echo >> $f; done
find -type f -name "*.toc" | while read f; do tail -n1 $f | read -r _ || echo >> $f; done
find -type f -name "*.txt" | while read f; do tail -n1 $f | read -r _ || echo >> $f; done

./stage.sh

git status

# message="v$version"

# if [[ -n $title ]]; then
#     message+=" ($title)"
# fi

# echo "MESSAGE: $message"

# # update repository
# git commit --message "$message" \
#     && git push

# # create tag
# git tag --annotate "v$version" --message "released at $release_date" \
#     && git push origin "v$version"
