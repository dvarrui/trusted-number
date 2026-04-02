[<< back](../README.md)

# Create

## 1. Create TrustedNumber base 10 numbers

Create `TrustedNumber` number (base 10) from `String`:

```ruby
num1 = TrustedNumber.new("1")
num2 = TrustedNumber.new("0.2")
num3 = TrustedNumber.new("3.4")
num4 = TrustedNumber.new("-4")
```

Create `TrustedNumber` number (base 10) from `Integer`:

```ruby
num1 = TrustedNumber.new(1)
num2 = TrustedNumber.new(-2)
```

Create `TrustedNumber` number (base 10) from `Float`:

```ruby
num1 = TrustedNumber.new(0.1)
num2 = TrustedNumber.new(-2.3)
```

## 2. Create TrustedNumber numbers for other bases.

```ruby
require_relative "trusted-number"

dec1 = TrustedNumber.new("3.14")
bin2 = TrustedNumber.new("101", base: 2)
hex3 = TrustedNumber.new("FF", base: 16)
```

## 3. Using TNumber alias

The alias `TNumber` is a shorthand way of referring to the main class `TrustedNumber`.

```ruby
require "trusted-number"

num1 = TNumber.new("0.1")
num2 = TNumber.new("0.2")

puts num1 + num2
```

## 4. Factory

Factory is a number generator for a given base.

```ruby
b2 = TrustedNumber.factory(2)
bin2 = b2.call("101")

b10 = TrustedNumber.factory(10)
dec1 = b10.call(0.1)

b16 = TrustedNumber.factory(16)
hex3 = b16.call("FF")
```