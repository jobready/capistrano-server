# Capistrano Server

Simple Reusable Capistrano Scripts

- `cap deploy:restart`
- `cap deploy:stop`
- `cap deploy:start`
- `cap deploy:key`

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano',  '~> 3.1'
    gem 'capistrano-server'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-server

## Usage

Require everything

    # Capfile
    require 'capistrano/server'

Or require just what you need manually:

    # Capfile
    require 'capistrano/server/services'
    require 'capistrano/server/keys'

Please note that any `require` should be placed in `Capfile`, not `config/deploy.rb`.

## Templates

puma.rb and upstart scripts for sidekiq and puma are in the templates directory

## Contributing

1. Fork it ( http://github.com/jobready/capistrano-server/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
