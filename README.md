[![Build Status](https://travis-ci.org/robparrott/web-hello-world.png?branch=master)](https://travis-ci.org/robparrott/web-hello-world)

# Continuous Deployment Example 

This reposoity, based on (https://github.com/chrissearle/web-hello-world)[https://github.com/chrissearle/web-hello-world] demonstrates using common CI and CD services to build a continuous deployment pipeline.

# Steps

## 1 Setup Primary Repository

Clone this respository, and modify this `README.md` and `.travis.yaml` file to point to this new repository

## 2 Setup Travis CI

See

- http://docs.travis-ci.com/user/getting-started/

Create a Travis CI account based on your GitHub account, 



## Setup a "Golden Master" repo

Instead of deploying straight from Travis CI about a successful build, instead 

```
 git remote add deploy git@github.com:robparrott/web-hello-world-deploy.git 
```
