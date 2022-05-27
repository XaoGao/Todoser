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

- `$ bin/webpack-dev-server` - if needed

- `$ bundle install`

- `$ rails db:migrate`

- `$ rails s` for server starting

Then open `http://localhost:3000` at your web-browser


### Credentials fix

if there are problems with rails db:migrate like
`activesupport-6.1.4.6/lib/active_support/message_encryptor.rb:203:in rescue in _decrypt': ActiveSupport::MessageEncryptor::InvalidMessage`

In `terminal`

- `$ rm config/credentials.yml.enc`

- `$ EDITOR=nano rails credentials:edit` close (Ctrl + x)

- `$ rails db:migrate`