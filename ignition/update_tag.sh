#!/bin/bash
ignition_tags=(galactic-ignition-edifice humble-ignition-fortress)

for value in ${ignition_tags[@]}
do
    git tag $value -f
    git push origin $value -f
done

exit 0