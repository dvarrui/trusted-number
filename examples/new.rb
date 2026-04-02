#!/usr/bin/env ruby
require_relative "../lib/trusted-number"
require_relative "line"

input = "0123.4560"
num = TrustedNumber.new(input)

line
puts "Example: #{input}"
puts "  base  : #{num.base}"
puts "  sign  : #{num.sign}"
puts "  mant  : #{num.mant}"
puts "  exp   : #{num.exp}"
puts "  value : #{num.value}"
puts "  about : #{num.about}"
line
