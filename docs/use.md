[<< back](../README.md)

# Use numbers

1. Load `trusted-number` library.
2. Create `TrustedNumber` number. Base 10 by default.
3. Operate with numbers.

## Sum numbers

```ruby
require "trusted-number"

num1 = TrustedNumber.new("0.1")
num2 = TrustedNumber.new("0.2")

puts num1 + num2
```

## Compare numbers

```ruby
num1 = TrustedNumber.new("-1,5")
num2 = TrustedNumber.new("2")

puts (num1 == num2) #=> false 
puts (num1 < num2)  #=> true
puts (num1 > num2)  #=> false
```