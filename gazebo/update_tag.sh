#!/bin/bash
gazebo_tags=(humble-gazebo-fortress jazzy-gazebo-harmonic)

for value in ${gazebo_tags[@]}
do
    git tag $value -f
    git push origin $value -f
done

exit 0