# README

# Todoser

### Requirements

`ruby >= 2.7.0`

`rails ~> 6.1.4`

### Installation & using

In `terminal` or `cmd`

- `$ git clone git@github.com:XaoGao/Todoser.git`

- `$ gem install bundler` - if needed

- `$ bundle install`

- `$ cp .env.example .env`

- `$ docker-compose up` for postgresql in docker or `$ docker-compose up -d` in background

- [if the following errors](#connection-error)

- `$ rails db:create`

- `$ rails db:migrate`

- `$ rails s` for server starting

Then open `http://localhost:3000` at your web-browser


### connection error

If the following error messages appear in the console:

	@@ -34,10 +49,4 @@ container needs to be recreated:

- `$ docker-compose down`

- `$ docker-compose up --force-recreate`