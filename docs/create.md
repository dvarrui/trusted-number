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

## 2. TrustedNumber constructor

```ruby
require_relative "trusted-number"

num1 = TrustedNumber.new("3.14")
num2 = TrustedNumber.new("101", base: 2)

```
