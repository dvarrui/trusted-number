# trusted-number

[![Gem Version](https://badge.fury.io/rb/trusted-number.svg)](https://badge.fury.io/rb/trusted-number)
![GitHub](https://img.shields.io/github/license/dvarrui/trusted-number)


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

dec1 + dec2 #=> 0.3
```

Example (base 2):

```ruby
bin1 = TrustedNumber.new("101.1", base: 2)
bin2 = TrustedNumber.new("0.1", base: 2)

bin1 + bin2 #=> 110(b2)
```

> More [examples](./examples/)

## Contents

* [Create numbers](./docs/create.md)
* [Use numbers](./docs/use.md)
* [Available operations](./docs/operations.md)
* [Development](./docs/development.md)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dvarrui/trusted-number.

