#!/usr/bin/env ruby
require_relative "../lib/trusted-number"
require_relative "line"

num = TrustedNumber.new("123.456")

line
puts "Example: 123.456"
puts "  base  : #{num.base}"
puts "  sign  : #{num.sign}"
puts "  mant  : #{num.mant}"
puts "  exp   : #{num.exp}"
puts "  value : #{num.value}"
puts "  about : #{num.about}"
line
