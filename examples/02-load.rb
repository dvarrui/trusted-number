#!/usr/bin/env ruby
require_relative "../lib/trusted-number"

values = [
  ["101.1", 2, 0],
  ["0.1", 2, -1],
  ["1,2", 10, 0],
  ["0.2", 10, 2]
]

values.each do |str, base, exp|
  number = TNumber.new(0, base: base, exp: exp)
  TrustedNumber::Load.new(number).from_str(str)

  puts number
end
