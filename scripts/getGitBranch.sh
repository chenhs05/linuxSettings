#!/usr/bin/env bash

# based on the script on https://stackoverflow.com/q/50223913


# setup escape codes based on out output format
#RD="\001\033[0;31m\002"
#GN="\001\033[0;32m\002"
#LG="\001\033[0;37m\002"
#BL="\001\033[0;34m\002"
RD=""
GN=""
LG=""
BL=""

# return an evil star if git repo is dirty
git_dirty() {
    ERROR="${RD}✘"
    git diff-files --no-ext-diff --quiet
    if [[ $? -gt 0 ]]; then
        #echo -ne "$ERROR"
	printf '%b' "$ERROR"
        return 0
    fi

    git diff-index --no-ext-diff --quiet --cached HEAD
    if [[ $? -gt 0 ]]; then
        #echo -ne "$ERROR"
        printf '%b' "$ERROR"
        return 0
    fi

    #echo -ne "${GN}✓ "
    printf '%b' "${GN}✓"
}

# format current git branch
ISGIT=$(git rev-parse --short HEAD 2>/dev/null)
if [[ -z "$ISGIT" ]]; then
	#echo -ne ""
	printf '%b' ""
	exit $?
fi

BRANCH=$(git symbolic-ref -q HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
if [[ -z "${BRANCH// }" ]]; then
    BRANCH=$(git describe --tags --exact-match HEAD 2>/dev/null) || BRANCH=$ISGIT
fi
#echo -ne "${LG}[${BL}$BRANCH`git_dirty`${LG}]"
printf '%b' "${LG}[${BL}$BRANCH `git_dirty`${LG}]"
