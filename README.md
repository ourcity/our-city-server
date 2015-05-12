# Our City Server

Our City Server is a Rails-based backend service that aggregates and harmonizes available public data APIs.

## Contents

* [Overview](#overview)
* [Dependencies](#dependencies)
* [Development Setup](#development-setup)
* [Production Setup](#production-setup)
* [Deployment](#deployment)

<a name="overview"></a>
## Overview

The app is hosted on Heroku.

* **Name**: 
* **URL**: 

*These are temporary.*

### Branches

There is one primary branch, `master`, that is deployed to `livefront-docs`. Feature development should be done on separate, temporary branches and then merged into `master` before deployment.

<a name="dependencies"></a>
## Dependencies

* Ruby 2.2
* [See the Gemfile](https://github.com/)
* Rails 4.2.1
* No DB

<a name="development-setup"></a>
## Development Setup

### Get the source code

1. Clone the repo

        git clone git@github.com:

1. Install [Heroku Toolbelt](https://toolbelt.heroku.com/)

### App setup

1. Install dependencies:

        bundle install

2. Create the db:

        rake db:create
        rake db:migrate
        rake db:test:prepare

3. Run unit tests:

        rspec


4. Start the server:

        $ rails server

5. You're ready! [http://localhost:3000](http://localhost:3000)

<a name="production-setup"></a>
## Production Setup

1. Create app on Heroku

        $ heroku create --stack cedar

2. Deploy to Heroku

        $ git push heroku
        $ heroku run rake db:migrate

3. Create user(s) via the console. See above for details.

<a name="deployment"></a>
## Deployment

1. If you used a feature branch, merge changes into the `master` branch

        $ git checkout master
        $ git merge <feature_branch>
        $ git commit -m <commit_message>
        $ git push

2. Deploy to Heroku

        $ heroku maintenance:on
        $ git push heroku
        $ heroku run rake db:migrate
        $ heroku ps:restart
        $ heroku maintenance:off
