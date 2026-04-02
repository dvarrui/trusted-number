[<< back](../README.md)

# Create

## 1. Create base 10 numbers

Create base 10 number from `String`:

```ruby
num1 = TrustedNumber.new("1")
num2 = TrustedNumber.new("0.2")
num3 = TrustedNumber.new("3.4")
num4 = TrustedNumber.new("-4")
```

Create base 10 number from `Integer`:

```ruby
num1 = TrustedNumber.new(1)
num2 = TrustedNumber.new(-2)
```

Create base 10 number from `Float`:

```ruby
num1 = TrustedNumber.new(0.1)
num2 = TrustedNumber.new(-2.3)
```

## 2. Create numbers for other bases.

```ruby
require_relative "trusted-number"

bin = TrustedNumber.new("101", base: 2)
hex = TrustedNumber.new("FF", base: 16)
```

## 3. Using alias

The alias `TNumber` is a shorthand way of referring to the main class `TrustedNumber`.

```ruby
require "trusted-number"

num1 = TNumber.new("0.1")
num2 = TNumber.new("0.2")

puts num1 + num2
```

## 4. Numbers factory

Factory is a number generator for a given base.

```ruby
b2 = TrustedNumber.factory(2)
bin = b2.call("101")

b10 = TrustedNumber.factory(10)
dec = b10.call(0.1)

b16 = TrustedNumber.factory(16)
hex = b16.call("FF")
```