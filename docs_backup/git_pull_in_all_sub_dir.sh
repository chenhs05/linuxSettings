#!/bin/bash

for dir in */; do
	pushd .
	cd $dir
	echo -e "$dir"
	git pull --all
	echo -e "\n"
	popd
done
