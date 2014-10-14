#!/bin/bash
#
# Sets up SSH within the Travis CI service 
#   so that we can use the private SSH key push to repos
#
# Assume we run from the root of the repo under Travis CI
#

# Run ssh-agent
eval `ssh-agent`

# Add the key
chmod 600 .travis/web-helloworld-production-deploy.key
ssh-add .travis/web-helloworld-production-deploy.key
ssh-add -l 
