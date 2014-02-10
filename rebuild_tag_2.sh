#!/bin/sh

kzProject=$1
projectTags=$kzProject"/tags"

#tagPrjoectPath="/home/dragon/project/kz_www"

#if [ "$kzProject""x" != "/home/dragon/project/kz_www""x" ]; then
#    exit 0;
#fi

if [ -f "$projectTags" ]; then
    rm "$projectTags"
fi

cd `dirname $kzProject"/tags"`
/usr/local/ctags/bin/ctags -R >/dev/null 2>&1 

