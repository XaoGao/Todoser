# README

# Todoser

### Requirements

`ruby >= 2.7.0`

`rails ~> 6.1.4`

### Installation & using

In `terminal` or `cmd`

- `$ git clone git@github.com:XaoGao/Todoser.git`

- `$ gem install bundler` - if needed

- `$ yarn` - if needed

- open second terminal and type `$ bin/webpack-dev-server` - if needed

- in first terminal type `$ bundle install`

- `$ docker-compose up` for postgresql in docker

If the following error messages appear in the console:

```console
connection to server at "127.0.0.1", port 5432 failed: FATAL:  password authentication fail
```
or

```
FATAL:  role "postgres" does not exist
```
container needs to be recreated:

- `$ docker-compose down`

- `$ docker-compose up --force-recreate`

- `$ rails db:migrate`

- `$ rails s` for server starting

Then open `http://localhost:3000` at your web-browser