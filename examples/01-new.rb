#!/usr/bin/env ruby

require_relative "../lib/trusted-number"

samples = [
  ["0120.0", 10, 0],
  [-0.010, 10, 3],
  ["0101.00", 2, 0],
  [-1110, 2, -1],
  ["0ab.c0", 16, 0],
  ["-0ab0.0e0", 16, 3]
]

samples.each do |number, base, exp|
  tnumber = TrustedNumber.new(number, base: base, exp: exp)

  puts "==> number: #{number}, base: #{base}, exp: #{exp}"
  puts "    #{tnumber.inspect}"
  puts ""
end
