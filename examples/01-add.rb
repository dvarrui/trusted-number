#!/usr/bin/env ruby
require_relative "../lib/trusted-number"

# ------------
puts "\n" + "=" * 10
puts "Base 2:"

bin1 = TrustedNumber.new("1.1", base: 2) # (1.5 decimal)
bin2 = TrustedNumber.new("1.1", base: 2) # (1.5 decimal)

res = bin1 + bin2
puts res
puts "Value: #{res.value}" # => "11" (3.0 en decimal)

# ------------
puts "\n" + "=" * 10
puts "Base 10"
dec1 = TrustedNumber.new("0.1")
dec2 = TrustedNumber.new("0.2")

res = dec1 + dec2
puts res
puts "Value: #{res.value}"
