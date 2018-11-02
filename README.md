# Fora

*Why "fora"?* Its kind of the phoenetic pronunciation of the ancient greek
word for time, [φορά](https://en.wiktionary.org/wiki/%CF%86%CE%BF%CF%81%CE%AC)

*Uses?* simple transform of Time/Dates <-> String

**Dependencies**:
- ruby > 2.1
- contracts gem > 0.12.0
- rspec

*Goals:* Create ruby only methods that can be mixed into a class for
transforming strings to time or dates to strings. A lot of these methods
exist natively in ActiveSupport. This class isn't trying to imitate
those methods but instead is geared towards a quick well guarded, by
contracts, way of transforming back and forth.

Mostly this is a demo of the Contracts gem, but I also use these methods
in my classes so I figured I'd just create a quick gem out of them.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fora'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fora

## Usage

Just include these methods in your class

```ruby
class MyAwesomeClass
  include Fora

  ...
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nacengineer/fora. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

