# PipedriveRuby
[![Build Status](https://travis-ci.org/lypborges/pipedrive_ruby.svg?branch=master)](https://travis-ci.org/lypborges/pipedrive_ruby)[![Code Climate](https://codeclimate.com/github/lypborges/pipedrive_ruby/badges/gpa.svg)](https://codeclimate.com/github/lypborges/pipedrive_ruby)[![Test Coverage](https://codeclimate.com/github/lypborges/pipedrive_ruby/badges/coverage.svg)](https://codeclimate.com/github/lypborges/pipedrive_ruby/coverage)

It's a working in progress.

## Tested with Ruby versions:
- 2.0.0
- 2.1.9
- 2.2.5
- 2.3.1

Welcome to your new gem! To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pipedrive_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pipedrive_ruby --pre

## Usage

See Wiki [getting started!](https://github.com/lypborges/pipedrive_ruby/wiki)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lypborges/pipedrive_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Publishing new version with
- Using https://github.com/svenfuchs/gem-release
- `gem install gem-release` if you don't have.
- `gem bump --version pre`, this will change the version according
- `gem release --tag` this will, publish to rubygems.org and tag on github

##Tips

If the tests fail in CI. Try the following:

1 - Remove the 
before push/pull requests always run tests:
- `codeclimate analyze`
- `rake spec`

## Thanks
- Gustavo Maestri, for teach me ruby ;) (@gumaestri)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
