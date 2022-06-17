#!/bin/bash
tags=(rolling galactic humble)

for value in ${tags[@]}
do
    git tag $value -f
    git push origin $value -f
done

exit 0