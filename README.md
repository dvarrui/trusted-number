# trusted-number

A trusted number is a number whose value will not change secretly.

For example (with base 10 numbers): `0.1 + 0.2 == 0.3`.

## Installation

```bash
gem install trusted-number
```

## Usage

Example (base 10):

```ruby
require "trusted-number"

dec1 = TrustedNumber.new("0.1")
dec2 = TrustedNumber.new("0.2")

print " Base 10: 0.1 + 0.2 == "
puts dec1 + dec2 #=> 0.3
```

Example (base 2):

```ruby
bin1 = TrustedNumber.new("101.1", base: 2)
bin2 = TrustedNumber.new("0.1", base: 2)

print " Base 2: 101.1 + 0.1 == "
puts bin1 + bin2 #=> 110(b2)
```

> More [examples](./examples/)

## Functions

Avalilable operations:

* New number object. Bases from 2 to 23.
* Compare (`==`, `<`, `>`)
* Add (`+`)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dvarrui/trusted-number.

## Development

In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Ruby code in the file `lib/trusted-number`. To experiment with that code, run `bin/console` for an interactive prompt.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

