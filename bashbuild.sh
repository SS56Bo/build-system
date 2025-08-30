#!/bin/bash

usage() {
    >&2 echo "Usage: $0 <project>"
    return 0
}

pname=$1
pdir="./${pname}"
tname=/home/soham/Desktop/BS/bashbuild.rc/templates
#tname=/var/bashbuild.rc/templates

if [ -z "$pname" ]; then
    usage
    exit 1
elif ! [ -d "$tname" ]; then
    >&2 echo "Unable to find template dir: $tname"
    exit 2
elif [ -d "$pdir" ]; then
    >&2 echo "Project dir already exists: $pdir"
    exit 3
fi

cur="$PWD"
cd $tname
echo "Select a template:"
select x in *; do
    template="$x"
    break
done

cd $cur
cp -R ${tname}/$template $pdir
cd $pdir
for x in *; do
    new=$(sed "s,PROJECTNAME,$pname,g" <<< "$x")
    sed "s,PROJECTNAME,$pname,g" < $x > $new
    if [ -e "$new" ]; then
        rm -f $x
    fi
done 
