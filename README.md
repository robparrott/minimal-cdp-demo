[![Build Status](https://travis-ci.org/robparrott/web-hello-world.png?branch=master)](https://travis-ci.org/robparrott/web-hello-world)


# Continuous Deployment Example 

This repository, based on [https://github.com/chrissearle/web-hello-world](https://github.com/chrissearle/web-hello-world) demonstrates using common CI and CD services to build a continuous deployment pipeline.

## Steps

### 1 Setup Primary Repository

Clone this respository, and modify this `README.md` and `.travis.yaml` file to point to this new repository.


### 2 Setup Travis CI

See

- http://docs.travis-ci.com/user/getting-started/

Create a Travis CI account based on your GitHub account, and note the token.

Once setup, on GitHub browse to the settings of the repository you want do CI with (i.e. this one?) and add a new Travis CI service. Provide the Travis CI username and token; use the "profile" tab on Travis CI to find these values. Once added, save and then make a trivial change to the repo and commit it. You should see the build happen automatically under Travis CI, and a status under this README.


### 3 Setup Heroku

To use Heroku, signup and create a new Java App by following the directions under this link: [Java App](https://devcenter.heroku.com/articles/getting-started-with-java).  Make sure you create a new ssh key, and name it after this particular app. This will be a "service" key, just used for deploying this app:

```
cd ~/.ssh/
ssh-keygen -f web-hello-world-heroku
```

and don't use a passphrase on it.

The run `heroku login` and register the key.  Next create a Heroku webapp for the repository by changing directory to this repository, and running

```
heroku create
```
and confirm the URL
```
heroku open
```

You can deploy directly from the repository (skipping the CI steps) by pushing directly to Heroku as follows:

```
git push heroku master
```

### 4 Integrate Heroku with Travic CI

Once you have an app in heroku ready to deploy to, we'll need to setup Travis CI to deploy as per the docs [here](http://docs.travis-ci.com/user/deployment/heroku/). You'll need to capture the API key for heroku by executing

```
heroku auth:token
```

and copying that value. Treat in securely, since it represents a token credential. Next, cd to the root of the repo we want to automate, and encrypt that token for Travis CI:

```
cd web-hello-world
travis encrypt $(heroku auth:token) --add deploy.api_key   
```

This edits your `.travis.yaml` and inserts an encrypted version of this token. You can then commit this edited file into a public repo with minimal risk of exposure.

One more step before you can deploy. You need to make sure that the app name in the deploy section matches the once created by heroku.

Once these things are aligned, make a minor change, and then visit the URL of the heroku app from the above command. If all goes well, you should see it deployed there.


### Setup a "Golden Master" repo

Instead of deploying straight from Travis CI about a successful build, instead 

```
 git remote add deploy git@github.com:robparrott/web-hello-world-deploy.git 
```
