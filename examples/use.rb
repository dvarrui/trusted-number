#!/usr/bin/env ruby

require_relative "../lib/trusted-number"

dec1 = TrustedNumber.new("0.1")
dec2 = TrustedNumber.new("0.2")

print " Base 10: 0.1 + 0.2 = "
puts dec1 + dec2 #=> 0.3

bin1 = TrustedNumber.new("101.1", base: 2)
bin2 = TrustedNumber.new("0.1", base: 2)

print " Base 2: 101.1 + 0.1 = "
puts bin1 + bin2 #=> 110