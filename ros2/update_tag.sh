#!/bin/bash
tags=(humble jazzy rolling)

for value in ${tags[@]}
do
    git tag $value -f
    git push origin $value -f
done

exit 0