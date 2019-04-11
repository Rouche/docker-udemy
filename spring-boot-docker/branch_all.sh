#!/bin/bash

#Creates local branch from remotes if it does not exists.

for REMOTE in $(git branch -a | grep remotes | grep -v HEAD | grep -v master); do 
    for BRANCH in $(git branch | grep -v HEAD | grep -v master); do 
        found=0
        
        #Spaces needs to be after [ and before ]. This is a "test" command.
        if [ "${REMOTE#remotes/origin/}" == "${BRANCH}" ]; then 
            found=1
            break
        fi
    done
    
    if [ ${found} == 0 ]; then
        echo "Branch created: [${REMOTE#remotes/origin/}]"
        git branch --track "${REMOTE#remotes/origin/}" "${REMOTE}"; 
    fi
done