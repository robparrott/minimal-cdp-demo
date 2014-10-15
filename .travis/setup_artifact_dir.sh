#!/bin/bash

GIT_HASH=$(git log | head -1 | awk '{print $2}')
mkdir build 
cp -av target build/${GIT_HASH}

find .
