[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

# BattleBot

A simple Discord bot written in Ruby you can use to fight your friends!

This app is coding practice for a few technologies such as Ruby, Classes, TDD, RSpec, RuboCop, Rake, Bundler, GitHub Actions, interacting with files, YAML, etc.

Commands!:
- `bb challenge @user` to challenge someone to a battle!
- `bb accept @user` to accept a challenge from that person and commence the battle!
- `bb char` to view your character stats.
- `bb char @user` to view someone else's character stats.
- `bb name <new name>` changes your character's name.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'battle_bot', :git => 'https://github.com/LouisSavoie/battle_bot.git'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install battle_bot

## Usage

### As modules
You can use the modules in `lib/battle_bot` ad-hoc by installing the gem in your own application then requiring them in your code.

### As an app
You can run the bot as a stand-alone app with `ruby run.rb` from the root directory.

Before running the bot you need to create an enviromental variable `BOT_TOKEN`. You can get a token from the Discord Developers Portal by creating an application, then a bot for that application.

You can create the enviromental variable by creating a file named `.env` in the root directory and adding the line `BOT_TOKEN=yourTokenHereWithNoSpace`. Or by following the procedure for your specific host.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/LouisSavoie/battle_bot.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
