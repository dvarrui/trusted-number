#!/usr/bin/env ruby
require_relative "../lib/trusted-number"

values = [
  ["101.1", 2],
  ["0.1", 2],
  ["1,2", 10],
  ["0.2", 10]
]

values.each do |str, base|
  number = TNumber.new(0, base: base)
  TrustedNumber::Load.new(number).from_str(str)

  puts number
end
