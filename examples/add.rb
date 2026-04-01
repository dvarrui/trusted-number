#!/usr/bin/env ruby
require_relative "../lib/trusted-number"

def line
  puts "\n" + "-" * 40
end

line
puts "Example : 101.1 + 0.1 (base 2)"

bin1 = TrustedNumber.new("101.1", base: 2)
bin2 = TrustedNumber.new("0.1", base: 2)

res = bin1 + bin2
puts "Result  : #{res.value}"
puts res.about

line
puts "Example : 0.1 + 0.2 (base 10)"
dec1 = TrustedNumber.new("0.1")
dec2 = TrustedNumber.new("0.2")

res = dec1 + dec2
puts "Result  : #{res.value}"
puts res.about
