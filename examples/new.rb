#!/usr/bin/env ruby
require_relative "../lib/trusted-number"
require "debug"

def line
  puts "\n" + "-" * 40
end

num = TrustedNumber.new("123.456")

line
puts "Example: 123.456"
puts "- base    : #{num.base}"
puts "- sign    : #{num.sign}"
puts "- predot  : #{num.predot}"
puts "- postdot : #{num.postdot}"
puts "- value   : #{num.value}"
puts "- about   : #{num.about}"
