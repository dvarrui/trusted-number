[<< back](../README.md)

# Create

## 1. Create TrustedNumber numbers

1. Load `trusted-number` library.
2. Create `TrustedNumber` number objects. Base 10 by default.
3. Operate with numbers.

```ruby
require "trusted-number"

num1 = TrustedNumber.new("0.1")
num2 = TrustedNumber.new("0.2")

puts num1 + num2
```

## 2. TrustedNumber constructor options

> **NOTE**: For now, it is only possible to perform operations between numbers with the same base.

```ruby
require_relative "trusted-number"

dec1 = TrustedNumber.new("3.14")
bin2 = TrustedNumber.new("101", base: 2)
hex3 = TrustedNumber.new("FF", base: 16)
```

## 3. Alias TNumber

The alias is a shorthand way of referring to the main class.

```ruby
require "trusted-number"

num1 = TNumber.new("0.1")
num2 = TNumber.new("0.2")

puts num1 + num2
```

## 4. Factory

