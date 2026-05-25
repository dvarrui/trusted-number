#!/usr/bin/env ruby
require_relative "../lib/trusted-number"
require_relative "line"

values = [
  ["101.1", 2],
  ["0.1", 2],
  ["0,1", 10],
  ["0.2", 10]
]

values.each do |str, base|
  line
  num1 = TNumber.new(0, base: 2)
  TrustedNumber::Load.new(num1).from_string(str)

  puts num1.about
  puts num1.to_s
  puts num1.sign
  puts num1.mant
  puts num1.exp
  puts num1.base
  puts num1.predot
  puts num1.postdot
end
