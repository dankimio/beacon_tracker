# README

Back-end for [BeaconTracker](https://github.com/dankimio/BeaconTracker) iOS app.

## Setup

- Ruby version: 2.4.1
- System dependencies: `$ brew install postgresql redis`
- Configuration: `config/secrets.yml`
- Database initialization: `$ rails db:setup`
- How to run the test suite: `$ rails test`
- Deployment instructions: automatic deploys to Heroku from master

## Architecture

BeaconTracker consists of the following components:

- API (`https://beacon-tracker.herokuapp.com/api`). The backend for iOS application. Uses token-based authentication. Files: `app/controllers/api/*``
- Admin area (`https://beacon-tracker.herokuapp.com/admin`). Admin dashboard for internal use. Uses Devise for authentication. Files: `app/controllers/admin/*``
