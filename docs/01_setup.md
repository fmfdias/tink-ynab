# Setup

## Install Ruby

Check the current ruby version referenced in the Gemfile.

e.g:

```
$> ruby-install ruby 2.7.0
$> chruby 2.7.0
```

## Config bundle to place gems in the vendor folder (optional)

```
bundle config --local path vendor/bundle
```

## Postgres libraries (optional)

Use this if you don't have postgres installed on the local machine (e.g: using docker)

```
$> brew install libpq
$> bundle config --local build.pg --with-pg-config=/usr/local/opt/libpq/bin/pg_config
```

## Setup node

The node version that we are using is in .nvmrc file.

### Setup using nvm

```
$> brew install nvm
$> nvm install 12.16.1
```

When you need to work in the project run

```
$> nvm use
```

## Services dependencies

The project contains a docker-compose file with the setup of all service dependencies (e.g: postgresql). It's recommender that the versions of the services used should match the ones in the production environment.

#### Install Docker

https://docs.docker.com/docker-for-mac/install/
