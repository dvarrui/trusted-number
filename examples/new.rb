#!/usr/bin/env ruby
require_relative "../lib/trusted-number"
require_relative "line"

values = ["0120.0", -0.010]

values.each do |value|
  num = TrustedNumber.new(value)

  line(nl: false)
  puts "Example: #{value}"
  puts "  base  : #{num.base}"
  puts "  sign  : #{num.sign}"
  puts "  mant  : #{num.mant}"
  puts "  exp   : #{num.exp}"
  puts "  about : #{num.about}"
  puts "  to_s  : #{num.to_s}"
end

line(nl: false)
